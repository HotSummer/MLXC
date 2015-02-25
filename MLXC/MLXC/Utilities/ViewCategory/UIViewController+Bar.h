//
//  UIViewController+Bar.h
//  VSBuyComponent
//
//  Created by summer.zhu on 17/12/14.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^RightBlock)();
typedef void(^LeftBlock)();

@interface UIViewController (Bar)

/**
 *  UIViewController右上角按钮
 *
 *  @param content 按钮内容
 *  @param block   按钮点击时间
 */
- (void)showRightBarItem:(id)content rightBlock:(RightBlock)block;

/**
 *  UIViewController左上角按钮
 *
 *  @param content 按钮内容
 *  @param block   按钮点击时间
 */
- (void)showLeftBarItem:(id)content leftBlock:(LeftBlock)block;

@end
