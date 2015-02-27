//
//  MLXCFoodListImagesCell.m
//  MLXC
//
//  Created by summer.zhu on 26/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCFoodListImagesCell.h"
#import "UIImageView+MLXCImageView.h"

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
    
    //移除之前的图片
    UIView *viewImages = [_scrollFoodImages viewWithTag:1];
    if (viewImages) {
        [viewImages removeFromSuperview];
    }
    
    //添加图片
    NSArray *foodImages = food.foodImages;
    UIView *viewNewImages = [[UIView alloc] initWithFrame:CGRectMake(0, 0, foodImages.count*100, _scrollFoodImages.frame.size.height)];
    viewNewImages.tag = 1;
    _scrollFoodImages.contentSize = CGSizeMake(foodImages.count*100, _scrollFoodImages.frame.size.height);
    [_scrollFoodImages addSubview:viewNewImages];
    
    for (NSInteger i=0; i<foodImages.count; i++) {
        NSString *imageUrl = foodImages[i];
        
        UIImageView *imageview = [[UIImageView alloc] initWithFrame:CGRectMake(100*i+5, 5, 90, 90)];
        [imageview sd_setImageWithString:imageUrl placeholderImage:kPlaceHolderImage];
        [viewNewImages addSubview:imageview];
    }
}

@end
