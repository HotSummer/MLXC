//
//  MLXCRestaurantFoodList.h
//  MLXC
//
//  Created by summer.zhu on 26/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLXCRestaurantFoodList : NSObject

@property(nonatomic, strong) NSString *restaurantId;
@property(nonatomic, strong) NSString *restaurantName;
@property(nonatomic, strong) NSArray *foods;

@end
