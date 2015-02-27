//
//  MLXCCheckoutManager.h
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLXCCheckoutManager : NSObject

@property(nonatomic, strong) NSMutableArray *selectRestaurants;

DECLARE_AS_SINGLETON(MLXCCheckoutManager);

- (void)loadSelectFood;

@end
