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
 *  食品信息cell的高度，如果选择了该食品，高度为75 否则44
 *
 *  @param indexPath 食品位置
 *
 *  @return cell的高度
 */
- (CGFloat)foodMessageCellHeight:(NSIndexPath *)indexPath;

/**
 *  展开或者缩进一行食品的图片
 *
 *  @param indexPath 食品位置
 */
- (void)updateFoodImageRow:(NSIndexPath *)indexPath;

/**
 *  将选择的食品保存到本地
 */
- (void)saveSelectFood;

@end
