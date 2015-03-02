//
//  MLXCRestaurantManager.m
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCRestaurantManager.h"
#import "MLXCRestaurantInput.h"
#import "MLXCRestaurantFood.h"
#import "ReflectHeader.h"

@implementation MLXCRestaurantManager

DEFINE_SINGLETON(MLXCRestaurantManager);

- (void)clearRestaurantListData{
    self.restaurantList = nil;
    self.restaurantId = nil;
}

- (void)clearRestaurantFoodData{
    self.restaurantFoodList = nil;
}

- (void)loadRestaurantList:(ResponseBlock)block{
    __weak MLXCRestaurantManager *wSelf = self;
    [[NetConfigManager shareInstance] request:@"" requestObject:nil responseObject:nil response:^(int code, NSString *message, id content, NSError *error) {
        if (mock) {
            NSArray *mockData = [MLXCRestaurantInput restaurantList];
            wSelf.restaurantList = (MLXCRestaurantList *)[Reflection objectFromContent:mockData className:@"MLXCRestaurantList"];
            block(200, nil, self.restaurantList, nil);
        }else{
            
        }
    }];
}

- (void)selectRestaurant:(NSString *)restaurantId{
    _restaurantId = restaurantId;
}

- (void)loadFoodList:(ResponseBlock)block{
    __weak MLXCRestaurantManager *wSelf = self;
    [[NetConfigManager shareInstance] request:@"" requestObject:nil responseObject:nil response:^(int code, NSString *message, id content, NSError *error) {
        if (mock) {
            NSDictionary *mockData = [MLXCRestaurantInput restaurantFoodList];
            wSelf.restaurantFoodList = (MLXCRestaurantFoodList *)[Reflection objectFromContent:mockData className:@"MLXCRestaurantFoodList"];
            block(200, nil, self.restaurantList, nil);
        }else{
            
        }
    }];
}

- (NSString *)updatePrice{
    //restaurantFoodList
    float fTotalPrice = 0;
    for (MLXCRestaurantFood *food in _restaurantFoodList.foods) {
        if (food.bSelect) {
            fTotalPrice += food.foodNumber * [food.foodPrice floatValue];
        }
    }
    return [NSString stringWithFormat:@"%.2f", fTotalPrice];
}

- (NSArray *)readSelectFoods{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSArray *arrSelectFoods = [userDefault objectForKey:SelectFoodsKey];
    return arrSelectFoods;
}

- (void)saveSelectFoods{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSArray *restuarantsOld = [self readSelectFoods];
    
    NSMutableArray *selectedFoods = [NSMutableArray array];
    for (MLXCRestaurantFood *food in _restaurantFoodList.foods) {
        if (food.bSelect) {
            NSDictionary *dicSelectFood = [Reflection dictionaryFromObject:food];
            NSMutableDictionary *mutableDicSelectFood = [NSMutableDictionary dictionaryWithDictionary:dicSelectFood];
            [selectedFoods addObject:mutableDicSelectFood];
        }
    }
    if (!restuarantsOld) {//本地没有选择的食品
        if (_restaurantFoodList) {
            NSArray *restaurants = @[@{@"foods":selectedFoods, @"restaurantId":_restaurantFoodList.restaurantId, @"restaurantName":_restaurantFoodList.restaurantName, @"restaurantPhone":_restaurantFoodList.restaurantPhone}];
            
            [userDefault setObject:restaurants forKey:SelectFoodsKey];
            [userDefault synchronize];
        }
    }else{
        NSDictionary *restaurant = @{@"foods":selectedFoods, @"restaurantId":_restaurantFoodList.restaurantId, @"restaurantName":_restaurantFoodList.restaurantName, @"restaurantPhone":_restaurantFoodList.restaurantPhone};
        
        NSMutableArray *restaurantNew = [NSMutableArray array];
        for (NSDictionary *dic in restuarantsOld) {
            if (![dic[@"restaurantId"] isEqualToString:_restaurantFoodList.restaurantId]) {
                [restaurantNew addObject:dic];
            }
        }
        [restaurantNew addObject:restaurant];
        
        [userDefault setObject:restaurantNew forKey:SelectFoodsKey];
        [userDefault synchronize];
    }
}

@end
