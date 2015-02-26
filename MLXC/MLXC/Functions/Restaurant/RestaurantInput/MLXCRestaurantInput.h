//
//  MLXCRestaurantInput.h
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLXCRestaurantInput : NSObject

/**
 *  本地mock餐饮店铺列表
 *
 *  @return 餐饮店铺列表数组
 */
+ (NSArray *)restaurantList;

/**
 *  本地mock餐饮食品列表
 *
 *  @return 餐饮食品列表
 */
+ (NSDictionary *)restaurantFoodList;

@end
