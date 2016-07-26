//
//  BaseApi.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "BaseApi.h"

@implementation BaseApi

/// 请求基础header
- (NSDictionary *)getBaseHeader
{
    return nil;
}
/// 请求基础body
- (NSDictionary *)getBaseBody
{
    return nil;
}
/// 请求rootUrl
- (NSString *)getRootUrl
{
    return @"http://10.5.10.42:9016/api/";
}
/// 请求url后半部分
- (NSString *)getPath
{
    return @"";
}
/// 请求方式
- (int)getRequestMethod
{
    return RequestMethodPOST;
}
/// 设置超时时间
- (int)getTimeOut
{
    return 10;
}

@end
