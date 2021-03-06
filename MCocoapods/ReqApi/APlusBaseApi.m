//
//  APlusBaseApi.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "APlusBaseApi.h"

@implementation APlusBaseApi

- (NSString *)getRootUrl
{
    return @"http://10.5.10.42:9016/api/";
}

- (NSDictionary *)getBaseHeader
{
    return nil;
}


- (NSMutableDictionary *)getBaseFieldMapping
{
    NSMutableDictionary *mdic = [[NSMutableDictionary alloc]initWithDictionary:@{
                                                                                 @"IsMobileRequest":@"YES"
                                                                                 }];
    return mdic;
}

- (NSMutableDictionary *)getBaseFieldWithOthers:(NSDictionary *)dic
{
    NSMutableDictionary *mdic = [self getBaseFieldMapping];
    [mdic addEntriesFromDictionary:dic];
    return mdic;
}

@end
