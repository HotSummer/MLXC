//
//  MLXCCheckoutFood.h
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLXCCheckoutFood : NSObject

@property(nonatomic, strong) NSString *orderFoodTime;
@property(nonatomic, strong) NSString *restaurantName;
@property(nonatomic, strong) NSString *restaurantId;
@property(nonatomic, strong) NSString *foodName;
@property(nonatomic, strong) NSString *foodPrice;
@property(nonatomic) NSInteger foodNumber;//份数

- (NSString *)foodInfo;

@end
