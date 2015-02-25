//
//  MLXCMainCell.m
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCMainCell.h"

@interface MLXCMainCell ()

@property(nonatomic, weak) IBOutlet UILabel *lblFunction;

@end

@implementation MLXCMainCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setFunctionName:(NSString *)functionName{
    _functionName = functionName;
    
    _lblFunction.text = _functionName;
}

@end
