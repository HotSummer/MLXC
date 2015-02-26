//
//  MLXCRestaurantFoodList.m
//  MLXC
//
//  Created by summer.zhu on 26/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCRestaurantFoodList.h"

@implementation MLXCRestaurantFoodList

- (NSDictionary *)classForArrayProperty{
    return @{@"foods":@"MLXCRestaurantFood"};
}

@end
