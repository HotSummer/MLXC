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
    return @[@{@"restaurantId":@"1001", @"restaurantName":@"家常菜馆", @"restaurantPrice":@"7元起", @"restaurantAddress":@"伴亭路18号", @"restaurantSmallImageUrl":@"http://img0.bdstatic.com/img/image/4477414b48e0b8d5686712a009fa3c911408337942.jpg"}, @{@"restaurantId":@"1002", @"restaurantName":@"福建混沌", @"restaurantPrice":@"9元起", @"restaurantAddress":@"伴亭路14号", @"restaurantSmallImageUrl":@"http://img0.bdstatic.com/img/image/63b2ef359345929635a54b877a03074a1409131582.jpg"}, @{@"restaurantId":@"1003", @"restaurantName":@"东北水饺", @"restaurantPrice":@"11元起", @"restaurantAddress":@"伴亭路15号", @"restaurantSmallImageUrl":@"http://img0.bdstatic.com/img/image/%E7%94%B0%E5%9B%AD%E9%A3%8E%E5%85%89%E6%96%B9.jpg"}, @{@"restaurantId":@"1004", @"restaurantName":@"湘菜馆", @"restaurantPrice":@"10元起", @"restaurantAddress":@"伴亭路19号", @"restaurantSmallImageUrl":@"http://img0.bdstatic.com/img/image/29ae2f8b81c5d4b785b596e2503e7e471409210670.jpg"}];
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
    return @{@"restaurantId":@"1001", @"foods":@[@{@"restaurantId":@"1001", @"foodName":@"菌菇混沌9个", @"foodPrice":@"￥10", @"foodImages":@[@"http://img0.bdstatic.com/img/image/shouye/lyxs.jpg", @"http://img0.bdstatic.com/img/image/%E7%94%B0%E5%9B%AD%E9%A3%8E%E5%85%89%E6%96%B9.jpg", @"www.baidu.com/3.jpeg", @"www.baidu.com/4.jpeg"]},
  @{@"restaurantId":@"1002", @"foodName":@"菌菇混沌13个", @"foodPrice":@"￥15", @"foodImages":@[@"http://img0.bdstatic.com/img/image/63b2ef359345929635a54b877a03074a1409131582.jpg", @"www.baidu.com/2.jpeg", @"http://img0.bdstatic.com/img/image/shouye/lyxs.jpg", @"http://img0.bdstatic.com/img/image/4477414b48e0b8d5686712a009fa3c911408337942.jpg"]},
  @{@"restaurantId":@"1003", @"foodName":@"荠菜混沌13个", @"foodPrice":@"￥11", @"foodImages":@[@"http://img0.bdstatic.com/img/image/shouye/lygz.jpg", @"http://img0.bdstatic.com/img/image/63b2ef359345929635a54b877a03074a1409131582.jpg", @"www.baidu.com/3.jpeg", @"http://img0.bdstatic.com/img/image/shouye/lyxs.jpg"]},
  @{@"restaurantId":@"1004", @"foodName":@"鲜肉混沌15个", @"foodPrice":@"￥15", @"foodImages":@[@"http://img0.bdstatic.com/img/image/%E5%BB%BA%E7%AD%91%E6%96%B9.jpg", @"www.baidu.com/2.jpeg", @"www.baidu.com/3.jpeg", @"http://img0.bdstatic.com/img/image/29ae2f8b81c5d4b785b596e2503e7e471409210670.jpg"]}]};
}

@end
