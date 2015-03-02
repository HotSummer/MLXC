//
//  MLXCCheckoutManager.h
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MLXCCheckoutFoodList.h"
#import "MLXCCheckoutFood.h"

typedef enum {
    MinusFood = 0,//减少食品数量
    AddFood,//添加食品数量
    DeleteFood//删除食品
}ChangeFoodType;

@interface MLXCCheckoutManager : NSObject

@property(nonatomic, strong) NSMutableArray *selectRestaurants;

DECLARE_AS_SINGLETON(MLXCCheckoutManager);

/**
 *  加载选择的食品
 */
- (void)loadSelectFood;

/**
 *  修改食品
 *
 *  @param changeType 修改类型
 *  @param selectFood 修改的食品
 */
- (void)changeFood:(ChangeFoodType)changeType food:(MLXCCheckoutFood *)selectFood;

/**
 *  更新价格
 *
 *  @return 价格
 */
- (NSString *)updatePrice;

/**
 *  保存选择的食品, 结构：@{SelectFoodsKey:@{restaurantId:@[selectfood]}}
 */
- (void)saveSelectFoods;

@end
