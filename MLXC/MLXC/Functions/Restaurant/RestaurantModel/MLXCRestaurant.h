//
//  MLXCRestaurant.h
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLXCRestaurant : NSObject

@property(nonatomic, strong) NSString *restaurantId;
@property(nonatomic, strong) NSString *restaurantName;
@property(nonatomic, strong) NSString *restaurantPrice;
@property(nonatomic, strong) NSString *restaurantAddress;
@property(nonatomic, strong) NSString *restaurantSmallImageUrl;

@end
