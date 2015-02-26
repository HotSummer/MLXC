//
//  UIImageView+MLXCImageView.h
//  MLXC
//
//  Created by summer.zhu on 26/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImageView+WebCache.h"

@interface UIImageView (MLXCImageView)

- (void)addHeader;

- (void)sd_setImageWithString:(NSString *)url;

- (void)sd_setImageWithString:(NSString *)url placeholderImage:(UIImage *)placeholder ;

- (void)sd_setImageWithString:(NSString *)url completed:(SDWebImageCompletionBlock)completedBlock;

- (void)sd_setImageWithString:(NSString *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock ;

@end
