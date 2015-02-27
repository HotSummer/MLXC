//
//  MLXCCheckoutController.h
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLXCCheckoutViewController.h"

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

@end
