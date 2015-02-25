//
//  MLXCMainViewController.m
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCMainViewController.h"
#import "MLXCRestaurantListViewController.h"
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
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MLXCMainCell *cell = (MLXCMainCell *)[tableView dequeueReusableCellWithIdentifier:@"MLXCMainCellIndentifier"];
    cell.functionName = @"小区餐馆";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    MLXCRestaurantListViewController *restaurantListVC = [[UIStoryboard storyboardWithName:@"Restaurant" bundle:ResourceBundle] instantiateViewControllerWithIdentifier:@"MLXCRestaurantListViewControllerStoryboardID"];//[[ResourceBundle loadNibNamed:@"MLXCRestaurantListViewController" owner:self options:nil] lastObject];
    [self.navigationController pushViewController:restaurantListVC animated:YES];
}

@end
