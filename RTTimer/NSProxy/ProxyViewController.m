//
//  ProxyViewController.m
//  RTTimer
//
//  Created by terry on 2017/2/17.
//  Copyright © 2017年 terry. All rights reserved.
//

#import "ProxyViewController.h"
#import "Proxy.h"

@interface ProxyViewController ()
@property (nonatomic, strong) Proxy *proxy;
@property (nonatomic,   weak) NSTimer *timer;
@end

@implementation ProxyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.proxy = [[Proxy alloc] initWithTarget:self];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self.proxy selector:@selector(tick:) userInfo:nil repeats:YES];
}

- (void)tick:(NSTimer *)timer {
    NSLog(@"timer tick:%@", timer);
}

- (void)dealloc {
    NSLog(@"dealloc --> %@", self);
    [self.timer invalidate];
}
@end
