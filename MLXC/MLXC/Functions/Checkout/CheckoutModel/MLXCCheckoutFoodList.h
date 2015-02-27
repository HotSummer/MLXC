//
//  MLXCCheckoutFoodList.h
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLXCCheckoutFoodList : NSObject

@property(nonatomic, strong) NSString *restaurantId;
@property(nonatomic, strong) NSString *restaurantName;
@property(nonatomic, strong) NSArray *foods;

@end
