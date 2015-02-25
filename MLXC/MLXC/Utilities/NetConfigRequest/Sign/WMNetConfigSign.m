//
//  WMNetConfigSign.m
//  NetConfigRequest
//
//  Created by summer.zhu on 4/2/15.
//  Copyright (c) 2015年 summer.zhu. All rights reserved.
//

#import "WMNetConfigSign.h"
#import <CommonCrypto/CommonDigest.h>

@interface WMNetConfigSign ()

/**
 *  加签算法
 *
 *  @param string 加签字符串
 *
 *  @return 加签后的数值
 */
- (NSString *)sha1:(NSString *)string;

@end

@implementation WMNetConfigSign

//给body中的参数使用
- (NSString *)signString:(NSDictionary *)dic{
    return @"";
}

//给header中的参数使用
- (NSString *)headerSignString:(NSDictionary *)dic{
    if (!dic ||  [dic count] == 0) return @"";
    
    NSMutableDictionary *mutableDic = [NSMutableDictionary dictionaryWithDictionary:dic];
    [mutableDic removeObjectForKey:@"apiSecrect"];
    [mutableDic removeObjectForKey:@"userSecret"];
    
    NSSortDescriptor *descriptor = [NSSortDescriptor sortDescriptorWithKey:nil ascending:YES];
    NSArray *sortedKeys = [[mutableDic allKeys] sortedArrayUsingDescriptors:[NSArray arrayWithObjects:descriptor, nil]];
    NSMutableString *signString = [NSMutableString stringWithString:@""];
    for (NSString *key in sortedKeys) {
        NSString *value =[mutableDic objectForKey:key];
        [signString appendFormat:@"%@",value];
    }
    
    NSString *result = @"";
    NSString *userSecret = dic[@"userSecret"];
    if (userSecret.length > 0) {
        result = [NSString stringWithFormat:@"%@&%@%@", dic[@"apiSecrect"], dic[@"userSecret"], signString];
    }else{
        result = [NSString stringWithFormat:@"%@%@", dic[@"apiSecrect"], signString];
    }
    
    return [self sha1:result];
}

- (NSString *)sha1:(NSString *)string{
    NSData *data = [string dataUsingEncoding:NSUTF8StringEncoding];
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
}

@end
