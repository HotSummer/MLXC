//
//  MLXCRestaurantController.m
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCRestaurantController.h"
#import "MLXCRestaurantListCell.h"
#import "MLXCRestaurantManager.h"

@implementation MLXCRestaurantController

DEFINE_SINGLETON(MLXCRestaurantController);

- (void)loadViewWithRequest{
    [_ownerVC initView];
    [[MLXCRestaurantManager shareInstance] loadRestaurantList:^(int code, NSString *message, id content, NSError *error) {
        if (error) {
            [_ownerVC showNoDataView];
        }else{
            if (code == 200) {
                [_ownerVC showDataView];
            }else{
                [_ownerVC showNoDataView];
            }
        }
        
    }];
}

- (void)back{
    [[MLXCRestaurantManager shareInstance] clearRestaurantListData];
}

#pragma mark - tableview datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [MLXCRestaurantManager shareInstance].restaurantList.restaurants.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    //MLXCMainCell *cell = (MLXCMainCell *)[tableView dequeueReusableCellWithIdentifier:@"MLXCMainCellIndentifier"];
    MLXCRestaurantListCell *cell = (MLXCRestaurantListCell *)[tableView dequeueReusableCellWithIdentifier:@"MLXCRestaurantListCellIndentifier"];
    cell.restaurant = [MLXCRestaurantManager shareInstance].restaurantList.restaurants[indexPath.row];
    return cell;
}

@end
