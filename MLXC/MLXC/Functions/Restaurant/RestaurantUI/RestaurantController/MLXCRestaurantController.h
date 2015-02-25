//
//  MLXCRestaurantController.h
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLXCRestaurantListViewController.h"

@interface MLXCRestaurantController : NSObject
<
UITableViewDataSource
>

DECLARE_AS_SINGLETON(MLXCRestaurantController);

@property(nonatomic, weak) MLXCRestaurantListViewController *ownerVC;

/**
 *  请求前后界面的显示
 */
- (void)loadViewWithRequest;

/**
 *  页面返回时候需要进行的操作
 */
- (void)back;

@end
