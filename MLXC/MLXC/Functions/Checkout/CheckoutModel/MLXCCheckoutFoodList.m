//
//  MLXCCheckoutFoodList.m
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCCheckoutFoodList.h"
#import "MLXCCheckoutFood.h"

@implementation MLXCCheckoutFoodList

- (NSDictionary *)classForArrayProperty{
    return @{@"foods":@"MLXCCheckoutFood"};
}

- (NSInteger)foodsNumber{
    NSInteger number = 0;
    for (MLXCCheckoutFood *food in _foods) {
        number += food.foodNumber;
    }
    return number;
}

@end
