//
//  MLXCCheckoutFood.m
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCCheckoutFood.h"

@implementation MLXCCheckoutFood

- (NSString *)foodInfo{
    return [NSString stringWithFormat:@"%@ / %@", _foodName, _foodPrice];
}

@end
