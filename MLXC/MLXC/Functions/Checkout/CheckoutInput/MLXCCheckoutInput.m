//
//  MLXCCheckoutInput.m
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCCheckoutInput.h"

@implementation MLXCCheckoutInput

+ (NSArray *)selectFoods{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSArray *arrSelectFoods = [userDefault objectForKey:SelectFoodsKey];
    return arrSelectFoods;
}

@end
