//
//  MLXCFoodListCell.m
//  MLXC
//
//  Created by summer.zhu on 26/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCFoodListCell.h"
#import "MLXCRestaurantController.h"

@interface MLXCFoodListCell ()

@property(nonatomic, weak) IBOutlet UIImageView *imageviewSelect;
@property(nonatomic, weak) IBOutlet UILabel *lblFoodMessage;
@property(nonatomic, weak) IBOutlet UIButton *btnShowImage;

- (IBAction)didPressedBtnExtend:(id)sender;

@end

@implementation MLXCFoodListCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFood:(MLXCRestaurantFood *)food{
    _food = food;
    if (_food) {
        UIImage *imageSel = nil;
        if (_food.bSelect) {
            imageSel = [UIImage imageNamed:@"hasinvoice_selected.png"];
        }else{
            imageSel = [UIImage imageNamed:@"hasinvoice_normal.png"];
        }
        _imageviewSelect.image = imageSel;
        
        _lblFoodMessage.text = [_food foodInfo];
        
        UIImage *imageExtend = nil;
        if (_food.bExtend) {
            imageExtend = [UIImage imageNamed:@"tipIcon_up.png"];
        }else{
            imageExtend = [UIImage imageNamed:@"tipIcon_down.png"];
        }
        [_btnShowImage setImage:imageExtend forState:UIControlStateNormal];
    }
}

- (IBAction)didPressedBtnExtend:(id)sender{
    _food.bExtend = !_food.bExtend;
    
    UIImage *imageExtend = nil;
    if (_food.bExtend) {
        imageExtend = [UIImage imageNamed:@"tipIcon_up.png"];
    }else{
        imageExtend = [UIImage imageNamed:@"tipIcon_down.png"];
    }
    [_btnShowImage setImage:imageExtend forState:UIControlStateNormal];
    
    [[MLXCRestaurantController shareInstance] updateFoodImageRow:_indexPath];
}

@end
