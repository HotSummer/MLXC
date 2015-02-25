//
//  MLXCRestaurantManager.h
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLXCRestaurantList.h"
#import "NetConfigManager.h"

@interface MLXCRestaurantManager : NSObject

@property(nonatomic, strong) MLXCRestaurantList *restaurantList;

DECLARE_AS_SINGLETON(MLXCRestaurantManager);

/**
 *  请求餐饮店铺列表
 */
- (void)loadRestaurantList:(ResponseBlock)block;

/**
 *  清空餐饮列表中的数据
 */
- (void)clearRestaurantListData;

@end
