//
//  Proxy.m
//  RTTimer
//
//  Created by terry on 2017/2/17.
//  Copyright © 2017年 terry. All rights reserved.
//

#import "Proxy.h"

@implementation Proxy
- (instancetype)initWithTarget:(id)target {
    self.target = target;
    return self;
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    NSMethodSignature *sg = [self.target methodSignatureForSelector:sel];
    return sg;
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    [invocation invokeWithTarget:self.target];
}

- (BOOL)respondsToSelector:(SEL)aSelector {
    return [self.target respondsToSelector:aSelector];
}

- (void)dealloc {
    NSLog(@"proxy dealloc %@", self);
}
@end
