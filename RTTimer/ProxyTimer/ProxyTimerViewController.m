//
//  ProxyTimerViewController.m
//  RTTimer
//
//  Created by terry on 2017/2/17.
//  Copyright © 2017年 terry. All rights reserved.
//

#import "ProxyTimerViewController.h"
#import "ProxyTimer.h"

@interface ProxyTimerViewController ()
@property (nonatomic, strong) ProxyTimer *proxyTimer;
@end

@implementation ProxyTimerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //
    NSMethodSignature *sg = [self methodSignatureForSelector:@selector(tick:)];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:sg];
    invocation.target = self;
    invocation.selector  = @selector(tick:);
    id userInfo = @{@"id": @(1)};
    [invocation setArgument:&userInfo atIndex:2];
    
    self.proxyTimer = [ProxyTimer scheduledTimerWithTimeInterval:1 invocation:invocation repeats:YES];
}

- (void)tick:(NSTimer *)timer {
    NSLog(@"tick timer:%@", timer);
}

- (void)dealloc {
    [self.proxyTimer invalidate];
}

@end
