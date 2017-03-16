//
//  ProxyTimer.h
//  RTTimer
//
//  Created by terry on 2017/2/17.
//  Copyright © 2017年 terry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Proxy.h"

NS_ASSUME_NONNULL_BEGIN

@interface ProxyTimer : NSObject
@property (nonatomic,   weak, readonly) NSTimer *timer;

+ (ProxyTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti invocation:(NSInvocation *)invocation repeats:(BOOL)yesOrNo;
+ (ProxyTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(nullable id)userInfo repeats:(BOOL)yesOrNo;

- (void)invalidate;
- (void)fire;
@end

NS_ASSUME_NONNULL_END
