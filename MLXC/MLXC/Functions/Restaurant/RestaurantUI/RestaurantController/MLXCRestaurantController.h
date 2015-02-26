//
//  MLXCRestaurantController.h
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLXCRestaurantListViewController.h"
#import "MLXCRestaurantFoodListViewController.h"

@interface MLXCRestaurantController : NSObject
<
UITableViewDataSource
>

DECLARE_AS_SINGLETON(MLXCRestaurantController);

@property(nonatomic, weak) MLXCRestaurantListViewController *restaurantListVC;
@property(nonatomic, weak) MLXCRestaurantFoodListViewController *foodListVC;

/**
 *  店铺列表页面显示时，请求前后界面的显示
 */
- (void)restaurantListLoadViewWithRequest;

/**
 *  店铺列表页面返回时候需要进行的操作
 */
- (void)restaurantListback;

/**
 *  选择某一个店铺
 *
 *  @param indexPath 店铺位置
 */
- (void)selectRestaurant:(NSIndexPath *)indexPath;

/**
 *  食品列表页面显示时，请求前后界面的显示
 */
- (void)restaurantFoodListLoadViewWithRequest;

/**
 *  食品列表页面返回时候需要进行的操作
 */
- (void)restaurantFoodListBack;

/**
 *  刷新食品列表
 */
- (void)reloadFoodList;

/**
 *  选择某一个食品
 *
 *  @param indexPath 食品位置
 */
- (void)selectFood:(NSIndexPath *)indexPath;

/**
 *  更新食品的图片显示，展开或者缩进一行图片
 *
 *  @param indexPath 食品位置
 */
- (void)updateFoodImageRow:(NSIndexPath *)indexPath;

@end
