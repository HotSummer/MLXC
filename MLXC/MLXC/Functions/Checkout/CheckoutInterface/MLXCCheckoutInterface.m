//
//  MLXCCheckoutInterface.m
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCCheckoutInterface.h"

@implementation MLXCCheckoutInterface

//DEFINE_SINGLETON(MLXCCheckoutInterface);

+ (MLXCCheckoutViewController *)checkoutViewController{
    MLXCCheckoutViewController *viewController = [[UIStoryboard storyboardWithName:@"Checkout" bundle:ResourceBundle] instantiateViewControllerWithIdentifier:@"MLXCCheckoutViewControllerStoryboardId"];
    return viewController;
}

@end
