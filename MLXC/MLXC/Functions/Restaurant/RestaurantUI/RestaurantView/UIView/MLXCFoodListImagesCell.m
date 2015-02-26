//
//  MLXCFoodListImagesCell.m
//  MLXC
//
//  Created by summer.zhu on 26/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCFoodListImagesCell.h"

@interface MLXCFoodListImagesCell ()

@property(nonatomic, weak) IBOutlet UIScrollView *scrollFoodImages;

@end

@implementation MLXCFoodListImagesCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFood:(MLXCRestaurantFood *)food{
    _food = food;
}

@end
