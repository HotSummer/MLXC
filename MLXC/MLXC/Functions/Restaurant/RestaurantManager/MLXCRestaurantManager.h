//
//  MLXCRestaurantManager.h
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLXCRestaurantFoodList.h"
#import "MLXCRestaurantList.h"
#import "NetConfigManager.h"

@interface MLXCRestaurantManager : NSObject

@property(nonatomic, strong) MLXCRestaurantList *restaurantList;
@property(nonatomic, strong) NSString *restaurantId;
@property(nonatomic, strong) MLXCRestaurantFoodList *restaurantFoodList;

DECLARE_AS_SINGLETON(MLXCRestaurantManager);

/**
 *  清空餐饮店铺列表中的数据
 */
- (void)clearRestaurantListData;

/**
 *  清空餐饮食品数据
 */
- (void)clearRestaurantFoodData;

/**
 *  请求餐饮店铺列表
 *
 *  @param block 请求完成回调
 */
- (void)loadRestaurantList:(ResponseBlock)block;

/**
 *  选择餐饮店铺
 *
 *  @param restaurantId 店铺Id
 */
- (void)selectRestaurant:(NSString *)restaurantId;

/**
 *  请求餐饮列表
 *
 *  @param block 请求完成回调
 */
- (void)loadFoodList:(ResponseBlock)block;

@end
