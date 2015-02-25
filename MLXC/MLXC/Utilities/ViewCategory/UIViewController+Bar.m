//
//  UIViewController+Bar.m
//  VSBuyComponent
//
//  Created by summer.zhu on 17/12/14.
//  Copyright (c) 2014年 test. All rights reserved.
//

#import "UIViewController+Bar.h"
#import "objc/runtime.h"

static NSString *LeftBlockString = @"LeftBlockString";
static NSString *RightBlockString = @"RightBlockString";

@implementation UIViewController (Bar)

- (void)showRightBarItem:(id)content rightBlock:(RightBlock)block{
    objc_setAssociatedObject(self, &RightBlockString, block, OBJC_ASSOCIATION_COPY);
    
    UIBarButtonItem *rightBarItem = nil;
    if ([content isKindOfClass:[NSString class]]) {
        rightBarItem = [self barWithString:(NSString *)content selector:@selector(didPressedBtnRight)];
    }else if ([content isKindOfClass:[UIImage class]]){
        rightBarItem = [self barWithImage:(UIImage *)content selector:@selector(didPressedBtnRight)];
    }else if ([content isKindOfClass:[UIView class]]){
        rightBarItem = [self barWithCustomerView:(UIView *)content];
    }
    if (rightBarItem) {
        self.navigationItem.rightBarButtonItem = rightBarItem;
    }
}

- (void)didPressedBtnRight{
    RightBlock rightBlock = (RightBlock)objc_getAssociatedObject(self, &RightBlockString);
    if (rightBlock != nil) {
        rightBlock();
    }
}

- (void)showLeftBarItem:(id)content leftBlock:(LeftBlock)block{
    objc_setAssociatedObject(self, &LeftBlockString, block, OBJC_ASSOCIATION_COPY);
    UIBarButtonItem *leftBarItem = nil;
    if ([content isKindOfClass:[NSString class]]) {
        leftBarItem = [self barWithString:(NSString *)content selector:@selector(didPressedBtnleft)];
    }else if ([content isKindOfClass:[UIImage class]]){
        leftBarItem = [self barWithImage:(UIImage *)content selector:@selector(didPressedBtnleft)];
    }else if ([content isKindOfClass:[UIView class]]){
        leftBarItem = [self barWithCustomerView:(UIView *)content];
    }
    if (leftBarItem) {
        self.navigationItem.leftBarButtonItem = leftBarItem;
    }
}

- (void)didPressedBtnleft{
    LeftBlock leftBlock = (LeftBlock)objc_getAssociatedObject(self, &LeftBlockString);
    if (leftBlock != nil) {
        leftBlock();
    }
}

#pragma mark - 创建BarButtonItem三种方式
- (UIBarButtonItem *)barWithString:(NSString *)message selector:(SEL)selector{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithTitle:message style:UIBarButtonItemStylePlain target:self action:selector];
    [item setTintColor:[UIColor whiteColor]];
    return item;
}

- (UIBarButtonItem *)barWithImage:(UIImage *)image selector:(SEL)selector{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithImage:image
                                                             style:UIBarButtonItemStylePlain
                                                            target:self
                                                            action:selector];
    [item setTintColor:[UIColor whiteColor]];
    return item;
}

- (UIBarButtonItem *)barWithCustomerView:(UIView *)customerView{
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:customerView];
    return item;
}

@end
