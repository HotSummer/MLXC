//
//  MLXCRestaurantFoodCell.m
//  MLXC
//
//  Created by summer.zhu on 2/3/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCRestaurantFoodCell.h"
#import "MLXCCheckoutController.h"

@interface MLXCRestaurantFoodCell ()

@property(nonatomic, weak) IBOutlet UILabel *foodName;
@property(nonatomic, weak) IBOutlet UILabel *foodNumber;

- (IBAction)didPressedBtnMinus:(id)sender;
- (IBAction)didPressedBtnAdd:(id)sender;
- (IBAction)didPressedBtnDelete:(id)sender;

@end

@implementation MLXCRestaurantFoodCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFood:(MLXCCheckoutFood *)food{
    _food = food;
    
    _foodName.text = [_food foodInfo];
    _foodNumber.text = [NSString stringWithFormat:@"%d", (int)_food.foodNumber];
}

- (IBAction)didPressedBtnMinus:(id)sender{
    [[MLXCCheckoutController shareInstance] changeFood:MinusFood food:_food];
}

- (IBAction)didPressedBtnAdd:(id)sender{
    [[MLXCCheckoutController shareInstance] changeFood:AddFood food:_food];
}

- (IBAction)didPressedBtnDelete:(id)sender{
    [[MLXCCheckoutController shareInstance] changeFood:DeleteFood food:_food];
}

@end
