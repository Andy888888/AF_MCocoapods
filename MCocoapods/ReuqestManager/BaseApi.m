//
//  BaseApi.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "BaseApi.h"

@implementation BaseApi

#pragma mark - AbsApiDelegate 重写

- (NSString *)getRootUrl
{
    return @"http://10.5.10.42:9016/api/";
}


#pragma mark - BaseApiDelegate 必须实现

/*  虽然是必须实现，但是在BaseApi中却是可选实现的  */

/// 请求基础body
- (NSDictionary *)getBaseBody
{
    return nil;
}
/// 请求方式
- (int)getRequestMethod
{
    return RequestMethodPOST;
}


#pragma mark - BaseApiDelegate 可选实现

/*  虽然是可选，但是在BaseApi中却是必须实现的  */

/// 请求基础header
- (NSDictionary *)getBaseHeader
{
    return nil;
}



@end
