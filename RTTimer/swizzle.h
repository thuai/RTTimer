//
//  swizzle.h
//  DeallocBlock
//
//  Created by terry on 2017/2/13.
//  Copyright © 2017年 terry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

//static inline void SwizzleInstanceMethod(Class c, SEL origSEL, SEL newSEL)
//{
//    Method origMethod = class_getInstanceMethod(c, origSEL);
//    Method newMethod = class_getInstanceMethod(c, newSEL);
//    
//    if (class_addMethod(c, origSEL, method_getImplementation(newMethod), method_getTypeEncoding(origMethod))) {
//        class_replaceMethod(c, newSEL, method_getImplementation(origMethod), method_getTypeEncoding(newMethod));
//    } else {
//        method_exchangeImplementations(origMethod, newMethod);
//    }
//}
//
//static inline void SwizzleClassMethod(Class c, SEL origSEL, SEL newSEL)
//{
//    Method origMethod = class_getClassMethod(c, origSEL);
//    Method newMethod = class_getClassMethod(c, newSEL);
//    
//    if (class_addMethod(c, origSEL, method_getImplementation(newMethod), method_getTypeEncoding(origMethod))) {
//        class_replaceMethod(c, newSEL, method_getImplementation(origMethod), method_getTypeEncoding(newMethod));
//    } else {
//        method_exchangeImplementations(origMethod, newMethod);
//    }
//}



@interface swizzle : NSObject

@end
