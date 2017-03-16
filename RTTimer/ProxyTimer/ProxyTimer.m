//
//  ProxyTimer.m
//  RTTimer
//
//  Created by terry on 2017/2/17.
//  Copyright © 2017年 terry. All rights reserved.
//

#import "ProxyTimer.h"

@interface ProxyTimer ()
@property (nonatomic, strong) Proxy *proxy;
@property (nonatomic,   weak, readwrite) NSTimer *timer;
@end

@implementation ProxyTimer

+ (ProxyTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo  {
    return [[ProxyTimer alloc] initWithTimeInterval:ti invocation:invocation repeats:yesOrNo];
}

+ (ProxyTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo {
    ProxyTimer *pTimer = [[ProxyTimer alloc] initWithTimeInterval:ti target:aTarget selector:aSelector userInfo:userInfo repeats:yesOrNo];
    return pTimer;
}

- (instancetype)initWithTimeInterval:(NSTimeInterval)ti target:(id)target selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.proxy = [[Proxy alloc] initWithTarget:target]; 
    self.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:self.proxy selector:aSelector userInfo:userInfo repeats:yesOrNo]; 
    return self;
}

- (instancetype)initWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    id target = invocation.target;
    SEL selector = invocation.selector;
    self.proxy = [[Proxy alloc] initWithTarget:target];
    
    NSMethodSignature *sg = [self.proxy methodSignatureForSelector:selector];
    NSInvocation *invoke = [NSInvocation invocationWithMethodSignature:sg];
    invoke.selector = selector;
    invoke.target = self.proxy;
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:ti invocation:invoke repeats:yesOrNo];
    
    return self;
}

- (void)invalidate {
    [self.timer invalidate];
}

- (void)fire {
    [self.timer fire]; 
}

- (void)dealloc {
    NSLog(@"dealloc --> %@", self);
}

@end
