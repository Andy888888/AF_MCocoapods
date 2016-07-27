//
//  AbsApi.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "AbsApi.h"

@implementation AbsApi

/// 完整的请求url
- (NSString *)getReqUrl
{
    NSString *reqUrl = [NSString stringWithFormat:@"%@%@",[self getRootUrl],[self getPath]];
    return reqUrl;
}

/// 设置超时时间
- (int)getTimeOut
{
    return 10;
}

- (NSString *)getRootUrl
{
    return nil;
}

- (NSString *)getPath
{
    return nil;
}



@end
