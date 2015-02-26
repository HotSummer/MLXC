//
//  UIImageView+MLXCImageView.m
//  MLXC
//
//  Created by summer.zhu on 26/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "UIImageView+MLXCImageView.h"

@implementation UIImageView (MLXCImageView)

- (void)addHeader
{
    // 本地Hack，添加请求头
    //    NSMutableDictionary *commonHeader = nil;
    //
    //    [commonHeader enumerateKeysAndObjectsUsingBlock:^(id key, id val, BOOL *stop) {
    //        [SDWebImageManager.sharedManager.imageDownloader setValue:val forHTTPHeaderField:key];
    //    }];
}

- (void)sd_setImageWithString:(NSString *)url
{
    [self sd_setImageWithString:url placeholderImage:nil];
}

- (void)sd_setImageWithString:(NSString *)url placeholderImage:(UIImage *)placeholder
{
    [self sd_setImageWithString:url placeholderImage:placeholder completed:nil];
}

- (void)sd_setImageWithString:(NSString *)url completed:(SDWebImageCompletionBlock)completedBlock
{
    [self sd_setImageWithString:url placeholderImage:nil completed:completedBlock];
}

- (void)sd_setImageWithString:(NSString *)url placeholderImage:(UIImage *)placeholder completed:(SDWebImageCompletionBlock)completedBlock
{
    NSURL *t_url = [NSURL URLWithString:url];
    [self addHeader];
    [self setContentMode:UIViewContentModeCenter];
    [self setBackgroundColor:kColor_ImageBGColor];
    [self sd_setImageWithURL:t_url placeholderImage:placeholder completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        
        if(error)
        {
            if(!completedBlock)
            {
                self.image = kErrorImage;
            }
        }
        else
        {
            [self setContentMode:UIViewContentModeScaleToFill];
        }
        
        if(completedBlock)
        {
            completedBlock(image, error, cacheType, imageURL);
        }
        
    }];
}

@end
