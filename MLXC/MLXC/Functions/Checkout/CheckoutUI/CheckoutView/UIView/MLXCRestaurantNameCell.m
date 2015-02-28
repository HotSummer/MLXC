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
        _lblNumber.text = [NSString stringWithFormat:@"%d", (int)[_foodList foodsNumber]];
    }
}

@end
