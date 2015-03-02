//
//  MLXCCheckoutManager.m
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCCheckoutManager.h"
#import "MLXCCheckoutInput.h"
#import "ReflectHeader.h"

@implementation MLXCCheckoutManager

DEFINE_SINGLETON(MLXCCheckoutManager);

- (void)loadSelectFood{
    _selectRestaurants = [NSMutableArray array];
    
    NSArray *list  = [MLXCCheckoutInput selectFoods];
    for (NSDictionary *dic in list) {
        MLXCCheckoutFoodList *foodModel = (MLXCCheckoutFoodList *)[Reflection objectFromContent:dic className:@"MLXCCheckoutFoodList"];
        [_selectRestaurants addObject:foodModel];
    }
}

- (void)changeFood:(ChangeFoodType)changeType food:(MLXCCheckoutFood *)selectFood{
    if (changeType == MinusFood) {
        selectFood.foodNumber --;
        if (selectFood.foodNumber < 1) {
            selectFood.foodNumber = 1;
        }
    }else if (changeType == AddFood) {
        selectFood.foodNumber ++;
    }else{
        NSMutableArray *selectRestaurantsCopy = [NSMutableArray array];
        for (MLXCCheckoutFoodList *foodList in _selectRestaurants) {
            //移除选择的食品
            NSMutableArray *mutableFoodList = [NSMutableArray arrayWithArray:foodList.foods];
            if ([foodList.restaurantId isEqualToString:selectFood.restaurantId]) {
                [mutableFoodList removeObject:selectFood];
                foodList.foods = mutableFoodList;
            }
            
            //如果没有选择的食品，则从店铺列表中删除
            if (foodList.foods.count > 0) {
                [selectRestaurantsCopy addObject:foodList];
            }
        }
        _selectRestaurants = selectRestaurantsCopy;
    }
    [self saveSelectFoods];
}

- (NSString *)updatePrice{
    //restaurantFoodList
    float fTotalPrice = 0;
    for (MLXCCheckoutFoodList *foodList in _selectRestaurants) {
        for (MLXCCheckoutFood *food in foodList.foods) {
            fTotalPrice += food.foodNumber * [food.foodPrice floatValue];
        }
    }
    return [NSString stringWithFormat:@"%.2f", fTotalPrice];
}

- (void)saveSelectFoods{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];

    NSMutableArray *arrFoods = [NSMutableArray array];
    for (MLXCCheckoutFoodList *foodList in _selectRestaurants) {
        NSDictionary *dicFood = [Reflection dictionaryFromObject:foodList];
        [arrFoods addObject:dicFood];
    }
    
    [userDefault setObject:arrFoods forKey:SelectFoodsKey];
    [userDefault synchronize];
    
}

@end
