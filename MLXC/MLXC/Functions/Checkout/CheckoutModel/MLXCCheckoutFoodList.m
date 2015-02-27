//
//  MLXCCheckoutFoodList.m
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCCheckoutFoodList.h"

@implementation MLXCCheckoutFoodList

- (NSDictionary *)classForArrayProperty{
    return @{@"foods":@"MLXCCheckoutFood"};
}

@end
