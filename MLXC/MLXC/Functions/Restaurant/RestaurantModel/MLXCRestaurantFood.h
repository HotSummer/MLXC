//
//  MLXCRestaurantFood.h
//  MLXC
//
//  Created by summer.zhu on 26/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MLXCRestaurantFood : NSObject

@property(nonatomic, strong) NSString *restaurantId;
@property(nonatomic, strong) NSString *restaurantName;
@property(nonatomic, strong) NSString *foodName;
@property(nonatomic, strong) NSString *foodPrice;
@property(nonatomic, strong) NSArray *foodImages;

@property(nonatomic) NSInteger foodNumber;//点这道菜的个数
/**
 *  是否选择该食品
 */
@property(nonatomic) BOOL bSelect;
/**
 *  是否展开
 */
@property(nonatomic) BOOL bExtend;

- (NSString *)foodInfo;

@end
