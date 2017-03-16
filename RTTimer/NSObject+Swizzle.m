//
//  NSObject+Swizzle.m
//  DeallocBlock
//
//  Created by terry on 2017/2/13.
//  Copyright © 2017年 terry. All rights reserved.
//

#import "NSObject+Swizzle.h"
#import <objc/runtime.h>
//#import "swizzle.h"

@implementation NSObject (Swizzle)
+ (void)load {

//    SwizzleInstanceMethod([self class], NSSelectorFromString(@"dealloc"), @selector(tw_dealloc));
//    SwizzleInstanceMethod([self class], NSSelectorFromString(@"fire"), @selector(tw_fire));
//    SwizzleInstanceMethod([self class], NSSelectorFromString(@"invalidate"), @selector(tw_invalidate));
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        Class class = [self class];
        
        SEL originalSelector = NSSelectorFromString(@"dealloc");
        SEL swizzledSelector = @selector(tw_dealloc);
        
        Method originalMethod = class_getInstanceMethod(class, originalSelector);
        Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
        
//        BOOL didAddMethod = class_addMethod(class, originalSelector,
//                                            method_getImplementation(swizzledMethod),
//                                            method_getTypeEncoding(swizzledMethod));
//        if (didAddMethod) {
//            class_replaceMethod(class,
//                                swizzledSelector,
//                                method_getImplementation(originalMethod),
//                                method_getTypeEncoding(originalMethod));
//        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
//        }
    });
}

//+ (void)initialize {
//    NSLog(@"%@ initialize", NSStringFromClass([self class]));
//}

- (void)tw_dealloc {
    [self tw_dealloc];
//    NSLog(@"timer dealloc: %@", self);
}

- (void)tw_invalidate {
    NSLog(@"invalidate :%@", self);
}

- (void)tw_fire {
    NSLog(@"fire timer:%@", self);
}
@end
