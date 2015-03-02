//
//  MLXCCheckoutController.h
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLXCCheckoutViewController.h"
#import "MLXCCheckoutManager.h"


@interface MLXCCheckoutController : NSObject
<
UITableViewDataSource
>

@property(nonatomic, weak) MLXCCheckoutViewController *checkoutVC;

DECLARE_AS_SINGLETON(MLXCCheckoutController);

/**
 *  结算页面显示时，请求前后界面的显示
 */
- (void)checkoutRestaurantLoadViewWithRequest;

/**
 *  刷新结算页
 */
- (void)reloadCheckoutViewController;

/**
 *  显示选择的食品
 *
 *  @param indexPath 食品位置
 */
- (void)showSelectFood:(NSIndexPath *)indexPath;

/**
 *  修改食品
 *
 *  @param changeType 修改类型
 *  @param selectFood 修改的食品
 */
- (void)changeFood:(ChangeFoodType)changeType food:(MLXCCheckoutFood *)selectFood;

/**
 *  更新价格
 */
- (void)updatePrice;


@end
