//
//  MLXCRestaurantNameCell.m
//  MLXC
//
//  Created by summer.zhu on 27/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCRestaurantNameCell.h"

@interface MLXCRestaurantNameCell ()

@property(nonatomic, weak) IBOutlet UILabel *lblName;
@property(nonatomic, weak) IBOutlet UILabel *lblNumber;
@property(nonatomic, weak) IBOutlet UILabel *lblPhone;

- (IBAction)didPressedBtnPhone:(id)sender;

@end

@implementation MLXCRestaurantNameCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFoodList:(MLXCCheckoutFoodList *)foodList{
    _foodList = foodList;
    
    if (_foodList) {
        _lblName.text = _foodList.restaurantName;
        _lblNumber.text = [NSString stringWithFormat:@"份数：%d", (int)[_foodList foodsNumber]];
        _lblPhone.text = [NSString stringWithFormat:@"预订电话：%@", _foodList.restaurantPhone];
    }
}

- (IBAction)didPressedBtnPhone:(id)sender{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:_foodList.restaurantPhone]];
}

@end
