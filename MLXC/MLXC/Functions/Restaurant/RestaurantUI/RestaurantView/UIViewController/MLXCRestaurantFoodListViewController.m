//
//  MLXCRestaurantFoodListViewController.m
//  MLXC
//
//  Created by summer.zhu on 26/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCRestaurantFoodListViewController.h"
#import "MLXCRestaurantController.h"
#import "UIViewController+Bar.h"

@interface MLXCRestaurantFoodListViewController ()

@property(nonatomic, weak) IBOutlet UIView *viewNoData;
@property(nonatomic, weak) IBOutlet UITableView *tableFood;
@property(nonatomic, weak) IBOutlet UIView *viewPrice;
@property(nonatomic, weak) IBOutlet UILabel *lblPrice;

@end

@implementation MLXCRestaurantFoodListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [MLXCRestaurantController shareInstance].foodListVC = self;
    
    [[MLXCRestaurantController shareInstance] restaurantFoodListLoadViewWithRequest];
    _tableFood.dataSource = [MLXCRestaurantController shareInstance];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initView{
    [super initView];
    
    __weak MLXCRestaurantFoodListViewController *wSelf = self;
    UIImage *imageBack = [UIImage imageNamed:@"back.png"];//[UIImage imageWithContentsOfFile:IMAGEURL(@"back.png")];
    [self showLeftBarItem:imageBack leftBlock:^{
        [[MLXCRestaurantController shareInstance] restaurantFoodListBack];
        [wSelf.navigationController popViewControllerAnimated:YES];
    }];
    
    [self showRightBarItem:@"保存" rightBlock:^{
        [[MLXCRestaurantController shareInstance] saveSelectFood];
    }];
    
    _tableFood.hidden = YES;
    _viewNoData.hidden = YES;
}

- (void)showNoDataView{
    [super showNoDataView];
    
    _tableFood.hidden = YES;
    _viewPrice.hidden = YES;
    _viewNoData.hidden = NO;
}

- (void)showDataView{
    [super showDataView];
    
    _tableFood.hidden = NO;
    _viewPrice.hidden = NO;
    _viewNoData.hidden = YES;
    [_tableFood reloadData];
}

- (void)reloadData{
    [_tableFood reloadData];
}

- (void)addRow:(NSIndexPath *)indexPath{
    [_tableFood beginUpdates];
    [_tableFood insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationMiddle];
    [_tableFood endUpdates];
}

- (void)removeRow:(NSIndexPath *)indexPath{
    [_tableFood beginUpdates];
    [_tableFood deleteRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:1 inSection:indexPath.section]] withRowAnimation:UITableViewRowAnimationFade];
    [_tableFood endUpdates];
}

- (void)showPrice:(NSString *)price{
    _lblPrice.text = [NSString stringWithFormat:@"总金额：￥%@", price];
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
    if (indexPath.row == 0) {
        return [[MLXCRestaurantController shareInstance] foodMessageCellHeight:indexPath];
    }else{
        return 103;
    }
    return 44;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [[MLXCRestaurantController shareInstance] selectFood:indexPath];
}

@end
