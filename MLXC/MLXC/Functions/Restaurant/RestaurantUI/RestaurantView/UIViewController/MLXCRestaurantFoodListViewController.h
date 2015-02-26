//
//  MLXCRestaurantFoodListViewController.h
//  MLXC
//
//  Created by summer.zhu on 26/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLXCBaseViewController.h"

@interface MLXCRestaurantFoodListViewController : MLXCBaseViewController
<
UITableViewDelegate
>
/**
 *  刷新食品数据
 */
- (void)reloadData;

/**
 *  展开一行食品的图片介绍
 *
 *  @param indexPath 食品的位置
 */
- (void)addRow:(NSIndexPath *)indexPath;

/**
 *  缩进一行食品的图片介绍
 *
 *  @param indexPath 食品的位置
 */
- (void)removeRow:(NSIndexPath *)indexPath;

@end
