//
//  MLXCRestaurantList.m
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCRestaurantList.h"
#import "ReflectHeader.h"

@implementation MLXCRestaurantList

- (NSDictionary *)classForArrayProperty{
    return @{@"restaurants":@"MLXCRestaurant"};
}

@end
