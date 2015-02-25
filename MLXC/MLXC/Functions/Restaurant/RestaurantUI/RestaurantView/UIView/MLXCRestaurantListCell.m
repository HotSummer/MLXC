//
//  MLXCRestaurantListCell.m
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCRestaurantListCell.h"

@interface MLXCRestaurantListCell ()

@property(nonatomic, weak) IBOutlet UILabel *lblRestaurantName;
@property(nonatomic, weak) IBOutlet UILabel *lblRestaurantPrice;
@property(nonatomic, weak) IBOutlet UILabel *lblRestaurantAddress;
@property(nonatomic, weak) IBOutlet UIImageView *imageviewRestaurant;

@end

@implementation MLXCRestaurantListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setRestaurant:(MLXCRestaurant *)restaurant{
    _restaurant = restaurant;
    
    if (_restaurant) {
        _lblRestaurantName.text = _restaurant.restaurantName;
        _lblRestaurantPrice.text = _restaurant.restaurantPrice;
        _lblRestaurantAddress.text = _restaurant.restaurantAddress;
    }
}

@end
