//
//  MLXCCheckoutInput.m
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCCheckoutInput.h"

@implementation MLXCCheckoutInput

+ (NSDictionary *)selectFoods{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSDictionary *dicSelectFoods = [userDefault objectForKey:SelectFoodsKey];
    return dicSelectFoods;
}

@end
