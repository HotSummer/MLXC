//
//  MLXCRestaurantFood.m
//  MLXC
//
//  Created by summer.zhu on 26/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCRestaurantFood.h"

@implementation MLXCRestaurantFood

- (NSString *)foodInfo{
    return [NSString stringWithFormat:@"%@ / %@", _foodName, _foodPrice];
}

@end
