//
//  MLXCBaseViewController.h
//  MLXC
//
//  Created by summer.zhu on 26/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MLXCBaseViewController : UIViewController

/**
 *  界面初始状态
 */
- (void)initView;

/**
 *  没有数据的界面状态
 */
- (void)showNoDataView;

/**
 *  有数据的界面显示
 */
- (void)showDataView;

@end
