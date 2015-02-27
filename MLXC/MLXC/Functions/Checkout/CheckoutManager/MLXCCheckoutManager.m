//
//  MLXCCheckoutManager.m
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCCheckoutManager.h"
#import "MLXCCheckoutFoodList.h"
#import "MLXCCheckoutInput.h"
#import "MLXCCheckoutFood.h"
#import "ReflectHeader.h"

@implementation MLXCCheckoutManager

DEFINE_SINGLETON(MLXCCheckoutManager);

- (void)loadSelectFood{
    _selectRestaurants = [NSMutableArray array];
    
    NSDictionary *dicList  = [MLXCCheckoutInput selectFoods];
    for (NSArray *foods in dicList.allValues) {
        if (foods.count > 0) {
            MLXCCheckoutFoodList *foodList = [[MLXCCheckoutFoodList alloc] init];
            NSMutableArray *arrFoods = [NSMutableArray array];
            
            NSString *restaurantId = @"";
            NSString *restaurantName = @"";
            for (NSDictionary *food in foods) {
                MLXCCheckoutFood *foodModel = (MLXCCheckoutFood *)[Reflection objectFromContent:food className:@"MLXCCheckoutFood"];
                [arrFoods addObject:foodModel];
                restaurantId = foodModel.restaurantId;
                restaurantName = foodModel.restaurantName;
            }
            foodList.foods = arrFoods;
            foodList.restaurantId = restaurantId;
            foodList.restaurantName = restaurantName;
            [_selectRestaurants addObject:foodList];
        }
    }
}

@end
