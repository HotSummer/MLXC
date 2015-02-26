//
//  MLXCRestaurantInput.m
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCRestaurantInput.h"

@implementation MLXCRestaurantInput

+ (NSArray *)restaurantList{
    return @[@{@"restaurantId":@"1001", @"restaurantName":@"家常菜馆", @"restaurantPrice":@"7元起", @"restaurantAddress":@"伴亭路18号", @"restaurantSmallImageUrl":@"www.baidu.com/1.jpeg"}, @{@"restaurantId":@"1002", @"restaurantName":@"福建混沌", @"restaurantPrice":@"9元起", @"restaurantAddress":@"伴亭路14号", @"restaurantSmallImageUrl":@"www.baidu.com/2.jpeg"}, @{@"restaurantId":@"1003", @"restaurantName":@"东北水饺", @"restaurantPrice":@"11元起", @"restaurantAddress":@"伴亭路15号", @"restaurantSmallImageUrl":@"www.baidu.com/3.jpeg"}, @{@"restaurantId":@"1004", @"restaurantName":@"湘菜馆", @"restaurantPrice":@"10元起", @"restaurantAddress":@"伴亭路19号", @"restaurantSmallImageUrl":@"www.baidu.com/4.jpeg"}];
}

/*
 @property(nonatomic, strong) NSString *restaurantId;
 @property(nonatomic, strong) NSArray *foods;
 
 @property(nonatomic, strong) NSString *restaurantId;
 @property(nonatomic, strong) NSString *foodName;
 @property(nonatomic, strong) NSString *foodPrice;
 @property(nonatomic, strong) NSArray *foodImages;
 */
+ (NSDictionary *)restaurantFoodList{
    return @{@"restaurantId":@"1001", @"foods":@[@{@"restaurantId":@"1001", @"foodName":@"菌菇混沌9个", @"foodPrice":@"￥10", @"foodImages":@[@"www.baidu.com/1.jpeg", @"www.baidu.com/2.jpeg", @"www.baidu.com/3.jpeg", @"www.baidu.com/4.jpeg"]}, @{@"restaurantId":@"1001", @"foodName":@"菌菇混沌13个", @"foodPrice":@"￥15", @"foodImages":@[@"www.baidu.com/1.jpeg", @"www.baidu.com/2.jpeg", @"www.baidu.com/3.jpeg", @"www.baidu.com/4.jpeg"]}, @{@"restaurantId":@"1001", @"foodName":@"荠菜混沌13个", @"foodPrice":@"￥11", @"foodImages":@[@"www.baidu.com/1.jpeg", @"www.baidu.com/2.jpeg", @"www.baidu.com/3.jpeg", @"www.baidu.com/4.jpeg"]}, @{@"restaurantId":@"1001", @"foodName":@"鲜肉混沌15个", @"foodPrice":@"￥15", @"foodImages":@[@"www.baidu.com/1.jpeg", @"www.baidu.com/2.jpeg", @"www.baidu.com/3.jpeg", @"www.baidu.com/4.jpeg"]}]};
}

@end
