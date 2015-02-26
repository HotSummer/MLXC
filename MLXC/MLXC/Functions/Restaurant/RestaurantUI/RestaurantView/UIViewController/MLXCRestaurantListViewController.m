//
//  MLXCRestaurantListViewController.m
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCRestaurantListViewController.h"
#import "MLXCRestaurantController.h"
#import "UIViewController+Bar.h"

@interface MLXCRestaurantListViewController ()

@property(nonatomic, weak) IBOutlet UIView *viewNoData;
@property(nonatomic, weak) IBOutlet UITableView *tableRestaurantList;

@end

@implementation MLXCRestaurantListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [MLXCRestaurantController shareInstance].restaurantListVC = self;
    
    [[MLXCRestaurantController shareInstance] restaurantListLoadViewWithRequest];
    _tableRestaurantList.dataSource = [MLXCRestaurantController shareInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    [super initView];
    __weak MLXCRestaurantListViewController *wSelf = self;
    UIImage *imageBack = [UIImage imageNamed:@"back.png"];//[UIImage imageWithContentsOfFile:IMAGEURL(@"back.png")];
    [self showLeftBarItem:imageBack leftBlock:^{
        [[MLXCRestaurantController shareInstance] restaurantListback];
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    _tableRestaurantList.hidden = YES;
    _viewNoData.hidden = YES;
}

- (void)showNoDataView{
    [super showNoDataView];
    _tableRestaurantList.hidden = YES;
    _viewNoData.hidden = NO;
}

- (void)showDataView{
    [super showDataView];
    _tableRestaurantList.hidden = NO;
    _viewNoData.hidden = YES;
    [_tableRestaurantList reloadData];
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
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[MLXCRestaurantController shareInstance] selectRestaurant:indexPath];
}

@end
