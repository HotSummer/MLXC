//
//  MLXCRestaurantController.m
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCRestaurantController.h"
#import "MLXCRestaurantListCell.h"
#import "MLXCFoodListImagesCell.h"
#import "MLXCRestaurantManager.h"
#import "MLXCRestaurantFood.h"
#import "MLXCFoodListCell.h"

#define RestaurantListTable 1001
#define FoodListTable 1002


@implementation MLXCRestaurantController

DEFINE_SINGLETON(MLXCRestaurantController);

- (void)restaurantListLoadViewWithRequest{
    [_restaurantListVC initView];
    [[MLXCRestaurantManager shareInstance] loadRestaurantList:^(int code, NSString *message, id content, NSError *error) {
        if (error) {
            [_restaurantListVC showNoDataView];
        }else{
            if (code == 200) {
                [_restaurantListVC showDataView];
            }else{
                [_restaurantListVC showNoDataView];
            }
        }
    }];
}

- (void)restaurantListback{
    [[MLXCRestaurantManager shareInstance] clearRestaurantListData];
}

- (void)selectRestaurant:(NSIndexPath *)indexPath{
    MLXCRestaurant *restaurant = [MLXCRestaurantManager shareInstance].restaurantList.restaurants[indexPath.row];
    [[MLXCRestaurantManager shareInstance] selectRestaurant:restaurant.restaurantId];
    if (!_foodListVC) {
        _foodListVC = [[UIStoryboard storyboardWithName:@"Restaurant" bundle:ResourceBundle] instantiateViewControllerWithIdentifier:@"MLXCRestaurantFoodListViewControllerStoryboardId"];
    }
    [_restaurantListVC.navigationController pushViewController:_foodListVC animated:YES];
}

- (void)restaurantFoodListLoadViewWithRequest{
    [_foodListVC initView];
    [[MLXCRestaurantManager shareInstance] loadFoodList:^(int code, NSString *message, id content, NSError *error) {
        if (error) {
            [_foodListVC showNoDataView];
        }else{
            if (code == 200) {
                [_foodListVC showDataView];
            }else{
                [_foodListVC showNoDataView];
            }
        }
    }];
}

- (void)restaurantFoodListBack{
    [[MLXCRestaurantManager shareInstance] clearRestaurantFoodData];
}

- (void)reloadFoodList{
    [_foodListVC reloadData];
}

- (void)selectFood:(NSIndexPath *)indexPath{
    MLXCRestaurantFood *food = [MLXCRestaurantManager shareInstance].restaurantFoodList.foods[indexPath.section];
    food.bSelect = !food.bSelect;
    if (!food.bSelect) {
        food.foodNumber = 1;
    }
    [_foodListVC reloadData];
}

- (CGFloat)foodMessageCellHeight:(NSIndexPath *)indexPath{
    MLXCRestaurantFood *food = [MLXCRestaurantManager shareInstance].restaurantFoodList.foods[indexPath.section];
    if (food.bSelect) {
        return 75.0f;
    }else{
        return 44.0f;
    }
}

- (void)updateFoodImageRow:(NSIndexPath *)indexPath{
    MLXCRestaurantFood *food = [MLXCRestaurantManager shareInstance].restaurantFoodList.foods[indexPath.section];
    if (food.bExtend) {
        [_foodListVC addRow:indexPath];
    }else{
        [_foodListVC removeRow:indexPath];
    }
}

- (void)saveSelectFood{
    [[MLXCRestaurantManager shareInstance] saveSelectFoods];
}

#pragma mark - tableview datasource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (tableView.tag == RestaurantListTable) {
        return 1;
    }else if (tableView.tag == FoodListTable) {
        return [MLXCRestaurantManager shareInstance].restaurantFoodList.foods.count;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView.tag == RestaurantListTable) {
        return [MLXCRestaurantManager shareInstance].restaurantList.restaurants.count;
    }else if (tableView.tag == FoodListTable) {
        MLXCRestaurantFood *food = [MLXCRestaurantManager shareInstance].restaurantFoodList.foods[section];
        if (food.bExtend) {
            return 2;
        }else{
            return 1;
        }
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView.tag == RestaurantListTable) {
        MLXCRestaurantListCell *cell = (MLXCRestaurantListCell *)[tableView dequeueReusableCellWithIdentifier:@"MLXCRestaurantListCellIndentifier"];
        cell.restaurant = [MLXCRestaurantManager shareInstance].restaurantList.restaurants[indexPath.row];
        return cell;
    }else if (tableView.tag == FoodListTable) {
        MLXCRestaurantFood *food = [MLXCRestaurantManager shareInstance].restaurantFoodList.foods[indexPath.section];
        if (food.bExtend) {
            if (indexPath.row == 0) {//第一行
                MLXCFoodListCell *cell = (MLXCFoodListCell *)[tableView dequeueReusableCellWithIdentifier:@"MLXCFoodListCellIndentifier"];
                cell.food = food;
                cell.indexPath = indexPath;
                return cell;
            }else{//第二行
                MLXCFoodListImagesCell *cell = (MLXCFoodListImagesCell *)[tableView dequeueReusableCellWithIdentifier:@"MLXCFoodListImagesCellIndentifier"];
                cell.food = food;
                return cell;
            }
        }else{
            MLXCFoodListCell *cell = (MLXCFoodListCell *)[tableView dequeueReusableCellWithIdentifier:@"MLXCFoodListCellIndentifier"];
            cell.food = food;
            cell.indexPath = indexPath;
            return cell;
        }
        
    }
    return nil;
}

@end
