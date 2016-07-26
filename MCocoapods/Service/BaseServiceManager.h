//
//  BaseServiceManager.h
//  MCocoapods
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseApiDelegate.h"
#import "AFHTTPSessionManager.h"

typedef void (^ResponseSuccessBlock)(id result);//请求响应成功的block
typedef void (^ResponseFailureBlock)(NSError *error);//请求响应失败的block

@interface BaseServiceManager : NSObject

+ (id)shareManager;


- (void)sendRequest:(id<BaseApiDelegate>)delegate
           sucBlock:(ResponseSuccessBlock)sucBlock
           falBlock:(ResponseFailureBlock)falBlock;

@end
