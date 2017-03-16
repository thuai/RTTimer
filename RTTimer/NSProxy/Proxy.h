//
//  Proxy.h
//  RTTimer
//
//  Created by terry on 2017/2/17.
//  Copyright © 2017年 terry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Proxy : NSProxy
@property (nonatomic, weak) id target;

- (instancetype)initWithTarget:(id)target;
@end
