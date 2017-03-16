//
//  RunTimeViewController.m
//  RTTimer
//
//  Created by terry on 2017/2/16.
//  Copyright © 2017年 terry. All rights reserved.
//

#import "RunTimeViewController.h"
#import <objc/runtime.h>
#import "FakeTarget.h"

@interface RunTimeViewController ()
@property (nonatomic, strong) FakeTarget *timerTarget;
@property (nonatomic,   weak) NSTimer    *timer;
@end

static const void *timerKey = &timerKey;
static const void *weakKey = &weakKey;

@implementation RunTimeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.timerTarget = [[FakeTarget alloc] init];
    
    IMP imp = class_getMethodImplementation([self class], @selector(selfTimerEvent:));
    class_addMethod([self.timerTarget class], @selector(onTimerEvent:), imp, "v@");
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self.timerTarget selector:@selector(onTimerEvent:) userInfo:nil repeats:YES];
    
    objc_setAssociatedObject(self.timerTarget, weakKey, self, OBJC_ASSOCIATION_ASSIGN);
}

- (void)selfTimerEvent:(NSTimer *)timer {
    NSLog(@"timer event call self method :%@ in %@", timer, self);
}

- (void)dealloc {
    [self.timer invalidate];
}

@end
