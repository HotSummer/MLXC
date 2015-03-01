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
    [[NetConfigManager shareInstance] request:@"" requestObject:nil responseObject:nil response:^(int code, NSString *message, id content, NSError *error) {
        if (mock) {
            NSArray *mockData = [MLXCRestaurantInput restaurantList];
            self.restaurantList = (MLXCRestaurantList *)[Reflection objectFromContent:mockData className:@"MLXCRestaurantList"];
            block(200, nil, self.restaurantList, nil);
        }else{
            
        }
    }];
}

- (void)selectRestaurant:(NSString *)restaurantId{
    _restaurantId = restaurantId;
}

- (void)loadFoodList:(ResponseBlock)block{
    [[NetConfigManager shareInstance] request:@"" requestObject:nil responseObject:nil response:^(int code, NSString *message, id content, NSError *error) {
        if (mock) {
            NSDictionary *mockData = [MLXCRestaurantInput restaurantFoodList];
            self.restaurantFoodList = (MLXCRestaurantFoodList *)[Reflection objectFromContent:mockData className:@"MLXCRestaurantFoodList"];
            block(200, nil, self.restaurantList, nil);
        }else{
            
        }
    }];
}

- (NSDictionary *)readSelectFoods{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    NSDictionary *dicSelectFoods = [userDefault objectForKey:SelectFoodsKey];
    return dicSelectFoods;
}

- (void)saveSelectFoods{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *dic = [self readSelectFoods];
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    
    NSMutableArray *selectedFoods = [NSMutableArray array];
    for (MLXCRestaurantFood *food in _restaurantFoodList.foods) {
        if (food.bSelect) {
            NSDictionary *dicSelectFood = [Reflection dictionaryFromObject:food];
            NSMutableDictionary *mutableDicSelectFood = [NSMutableDictionary dictionaryWithDictionary:dicSelectFood];
            [selectedFoods addObject:mutableDicSelectFood];
        }
    }
    
    if (!dic) {//本地没有选择的食品
        if (_restaurantFoodList) {
            NSDictionary *dicRestaurant = @{_restaurantFoodList.restaurantId:selectedFoods};
            [userDefault setObject:dicRestaurant forKey:SelectFoodsKey];
            [userDefault synchronize];
        }
    }else{
        
        [mutableDic setObject:selectedFoods forKey:_restaurantFoodList.restaurantId];
        [userDefault setObject:mutableDic forKey:SelectFoodsKey];
        [userDefault synchronize];
    }
}

@end
