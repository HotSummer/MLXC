//
//  MLXCCheckoutController.m
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCCheckoutController.h"
#import "MLXCRestaurantNameCell.h"
#import "MLXCRestaurantFoodCell.h"

@implementation MLXCCheckoutController

DEFINE_SINGLETON(MLXCCheckoutController);

- (void)checkoutRestaurantLoadViewWithRequest{
    [_checkoutVC initView];
    
    [[MLXCCheckoutManager shareInstance] loadSelectFood];
    
    if ([MLXCCheckoutManager shareInstance].selectRestaurants.count > 0) {
        [_checkoutVC showDataView];
    }else{
        [_checkoutVC showNoDataView];
    }
}

- (void)reloadCheckoutViewController{
    [_checkoutVC reloadData];
}

- (void)showSelectFood:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {//点击第一个
        MLXCCheckoutFoodList *foodList = [MLXCCheckoutManager shareInstance].selectRestaurants[indexPath.section];
        foodList.bExtand = !foodList.bExtand;
        
        [self reloadCheckoutViewController];
    }
}

- (void)changeFood:(ChangeFoodType)changeType food:(MLXCCheckoutFood *)selectFood{
    [[MLXCCheckoutManager shareInstance] changeFood:changeType food:selectFood];
    
    if ([MLXCCheckoutManager shareInstance].selectRestaurants.count > 0) {
        [self reloadCheckoutViewController];
    }else{
        [_checkoutVC showNoDataView];
    }
}

#pragma mark - tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [MLXCCheckoutManager shareInstance].selectRestaurants.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    MLXCCheckoutFoodList *foodList = [MLXCCheckoutManager shareInstance].selectRestaurants[section];
    NSInteger iFoodListCount = foodList.bExtand?(foodList.foods.count+1):1;
    return iFoodListCount;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MLXCCheckoutFoodList *foods = [MLXCCheckoutManager shareInstance].selectRestaurants[indexPath.section];
    if (indexPath.row == 0) {
        MLXCRestaurantNameCell *cell = (MLXCRestaurantNameCell *)[tableView dequeueReusableCellWithIdentifier:@"MLXCRestaurantNameCellIndentifier"];
        cell.foodList = foods;
        return cell;
    }else{
        MLXCRestaurantFoodCell *foodCell = (MLXCRestaurantFoodCell *)[tableView dequeueReusableCellWithIdentifier:@"MLXCRestaurantFoodCellIndentifier"];
        MLXCCheckoutFood *food = foods.foods[indexPath.row-1];
        foodCell.food = food;
        return foodCell;
    }
    
    return nil;
}

@end
