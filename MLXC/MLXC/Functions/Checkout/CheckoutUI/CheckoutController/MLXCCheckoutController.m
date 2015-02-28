//
//  MLXCCheckoutController.m
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCCheckoutController.h"
#import "MLXCRestaurantNameCell.h"
#import "MLXCCheckoutFoodList.h"
#import "MLXCCheckoutManager.h"

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

#pragma mark - tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [MLXCCheckoutManager shareInstance].selectRestaurants.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    MLXCCheckoutFoodList *foodList = [MLXCCheckoutManager shareInstance].selectRestaurants[section];
    return foodList.foods.count+1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MLXCRestaurantNameCell *cell = (MLXCRestaurantNameCell *)[tableView dequeueReusableCellWithIdentifier:@"MLXCRestaurantNameCellIndentifier"];
    MLXCCheckoutFoodList *foods = [MLXCCheckoutManager shareInstance].selectRestaurants[indexPath.section];
    cell.foodList = foods;
    return cell;
}

@end
