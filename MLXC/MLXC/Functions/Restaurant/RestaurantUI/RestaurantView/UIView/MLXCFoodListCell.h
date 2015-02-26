//
//  MLXCFoodListCell.h
//  MLXC
//
//  Created by summer.zhu on 26/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MLXCRestaurantFood.h"

@interface MLXCFoodListCell : UITableViewCell

@property(nonatomic, strong) MLXCRestaurantFood *food;
@property(nonatomic, strong) NSIndexPath *indexPath;

@end
