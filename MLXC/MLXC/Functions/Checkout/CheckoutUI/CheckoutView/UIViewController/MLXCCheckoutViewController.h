//
//  MLXCCheckoutViewController.h
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCBaseViewController.h"

@interface MLXCCheckoutViewController : MLXCBaseViewController
<
UITableViewDelegate
>

/**
 *  刷新结算页数据
 */
- (void)reloadData;

/**
 *  显示价格
 *
 *  @param price 价格字符串
 */
- (void)showPrice:(NSString *)price;

@end
