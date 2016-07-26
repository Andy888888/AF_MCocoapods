//
//  BaseApiDelegate.h
//  MCocoapods
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import <UIKit/UIKit.h>

enum RequestMethod
{
    RequestMethodPOST = 1,
    RequestMethodGET = 2
};

@protocol BaseApiDelegate <NSObject>

/// 必须实现
@required
/// 请求基础header
- (NSDictionary *)getBaseHeader;
/// 请求基础body
- (NSDictionary *)getBaseBody;
/// 请求rootUrl
- (NSString *)getRootUrl;
/// 请求url后半部分
- (NSString *)getPath;
/// 请求方式
- (int)getRequestMethod;
/// 设置超时时间
- (int)getTimeOut;


//可选实现
@optional


@end
