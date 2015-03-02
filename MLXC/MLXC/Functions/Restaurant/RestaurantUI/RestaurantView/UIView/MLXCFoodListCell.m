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
@property(nonatomic, weak) IBOutlet UILabel *lblNumberTag;
@property(nonatomic, weak) IBOutlet UILabel *lblNumber;
@property(nonatomic, weak) IBOutlet UIView *viewChangeNumber;

- (IBAction)didPressedBtnExtend:(id)sender;
- (IBAction)didPressedBtnMinus:(id)sender;
- (IBAction)didPressedBtnAdd:(id)sender;

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
        
        [self showNumber:_food.bSelect];
        
        _lblFoodMessage.text = [_food foodInfo];
        
        if (_food.foodImages.count > 0) {
            _btnShowImage.hidden = NO;
        }else{
            _btnShowImage.hidden = YES;
            UIImage *imageExtend = nil;
            if (_food.bExtend) {
                imageExtend = [UIImage imageNamed:@"tipIcon_up.png"];
            }else{
                imageExtend = [UIImage imageNamed:@"tipIcon_down.png"];
            }
            [_btnShowImage setImage:imageExtend forState:UIControlStateNormal];
        }
        
    }
}

- (void)showNumber:(BOOL)bShow{
    if (bShow) {
        _lblNumberTag.hidden = NO;
        _viewChangeNumber.hidden = NO;
        _lblNumber.text = [NSString stringWithFormat:@"%d", (int)_food.foodNumber];
    }else{
        _lblNumberTag.hidden = YES;
        _viewChangeNumber.hidden = YES;
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

- (IBAction)didPressedBtnMinus:(id)sender{
    _food.foodNumber --;
    if (_food.foodNumber < 1) {
        _food.foodNumber = 1;
    }
    
    if (_food.bSelect) {
        _lblNumber.text = [NSString stringWithFormat:@"%d", (int)_food.foodNumber];
    }
    
    [[MLXCRestaurantController shareInstance] updatePrice];
}

- (IBAction)didPressedBtnAdd:(id)sender{
    _food.foodNumber ++;
    
    if (_food.bSelect) {
        _lblNumber.text = [NSString stringWithFormat:@"%d", (int)_food.foodNumber];
    }
    
    [[MLXCRestaurantController shareInstance] updatePrice];
}

@end
