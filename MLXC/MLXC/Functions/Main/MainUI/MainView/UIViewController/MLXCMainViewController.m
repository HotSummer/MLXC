//
//  MLXCMainViewController.m
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCMainViewController.h"
#import "MLXCRestaurantListViewController.h"
#import "MLXCCheckoutInterface.h"
#import "MLXCMainInput.h"
#import "MLXCMainCell.h"

@interface MLXCMainViewController ()

@end

@implementation MLXCMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - tableview delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [MLXCMainInput funtions].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MLXCMainCell *cell = (MLXCMainCell *)[tableView dequeueReusableCellWithIdentifier:@"MLXCMainCellIndentifier"];
    cell.functionName = [MLXCMainInput funtions][indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        MLXCRestaurantListViewController *restaurantListVC = [[UIStoryboard storyboardWithName:@"Restaurant" bundle:ResourceBundle] instantiateViewControllerWithIdentifier:@"MLXCRestaurantListViewControllerStoryboardID"];//[[ResourceBundle loadNibNamed:@"MLXCRestaurantListViewController" owner:self options:nil] lastObject];
        [self.navigationController pushViewController:restaurantListVC animated:YES];
    }else{
        UIViewController *viewController = [MLXCCheckoutInterface checkoutViewController];
        [self.navigationController pushViewController:viewController animated:YES];
    }
}

@end
