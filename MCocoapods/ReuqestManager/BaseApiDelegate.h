//
//  BaseApiDelegate.h
//  MCocoapods
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BaseApiDelegate <NSObject>

/// 必须实现
@required

/// 请求基础body
- (NSDictionary *)getBaseBody;
/// 请求方式
- (int)getRequestMethod;


//可选实现
@optional

/// 请求基础header
- (NSDictionary *)getBaseHeader;


@end

@protocol AbsApiDelegate <NSObject>

/// 必须实现
@required

/// 请求rootUrl
- (NSString *)getRootUrl;
/// 请求url后半部分
- (NSString *)getPath;


@end
