//
//  MLXCCheckoutViewController.m
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCCheckoutViewController.h"
#import "MLXCCheckoutController.h"
#import "UIViewController+Bar.h"

@interface MLXCCheckoutViewController ()

@property(nonatomic, weak) IBOutlet UITableView *tableRestaurant;

@end

@implementation MLXCCheckoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [MLXCCheckoutController shareInstance].checkoutVC = self;
    
    [[MLXCCheckoutController shareInstance] checkoutRestaurantLoadViewWithRequest];
    _tableRestaurant.dataSource = [MLXCCheckoutController shareInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    [super initView];
    __weak MLXCCheckoutViewController *wSelf = self;
    UIImage *imageBack = [UIImage imageNamed:@"back.png"];//[UIImage imageWithContentsOfFile:IMAGEURL(@"back.png")];
    [self showLeftBarItem:imageBack leftBlock:^{
//        [[MLXCCheckoutController shareInstance] restaurantFoodListBack];
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
}

- (void)showDataView{
    [super showNoDataView];
    
    [self reloadData];
}

- (void)reloadData{
    [_tableRestaurant reloadData];
}

#pragma mark - tableview delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 44.0;
}

@end
