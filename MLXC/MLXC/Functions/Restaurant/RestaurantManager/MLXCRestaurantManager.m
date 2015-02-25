//
//  MLXCRestaurantManager.m
//  MLXC
//
//  Created by summer.zhu on 25/2/15.
//  Copyright (c) 2015年 summer. All rights reserved.
//

#import "MLXCRestaurantManager.h"
#import "MLXCRestaurantInput.h"
#import "ReflectHeader.h"

@implementation MLXCRestaurantManager

DEFINE_SINGLETON(MLXCRestaurantManager);

- (void)loadRestaurantList:(ResponseBlock)block{
    [[NetConfigManager shareInstance] request:@"" requestObject:nil responseObject:nil response:^(int code, NSString *message, id content, NSError *error) {
        if (mock) {
            NSArray *mockData = [MLXCRestaurantInput restaurantList];
            self.restaurantList = (MLXCRestaurantList *)[Reflection objectFromContent:mockData className:@"MLXCRestaurantList"];
            block(200, nil, self.restaurantList, nil);
        }else{
            
        }
    }];
}

- (void)clearRestaurantListData{
    self.restaurantList = nil;
}

@end
