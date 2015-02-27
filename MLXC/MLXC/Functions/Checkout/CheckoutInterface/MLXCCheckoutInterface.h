//
//  MLXCCheckoutInterface.h
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLXCCheckoutViewController.h"

@interface MLXCCheckoutInterface : NSObject

//DECLARE_AS_SINGLETON(MLXCCheckoutInterface);

+ (MLXCCheckoutViewController *)checkoutViewController;

@end
