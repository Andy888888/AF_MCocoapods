//
//  BaseServiceManager.h
//  MCocoapods
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "BaseApiDelegate.h"
#import "AFHTTPSessionManager.h"
#import "AbsApi.h"

typedef void (^ResponseSuccessBlock)(id result);//请求响应成功的block
typedef void (^ResponseFailureBlock)(NSError *error);//请求响应失败的block

@interface BaseServiceManager : NSObject

@property (nonatomic,strong) NSMutableArray *queueHttpManager;

+ (id)initManager;

- (void)sendRequest:(AbsApi<BaseApiDelegate>*)api
           sucBlock:(ResponseSuccessBlock)sucBlock
           falBlock:(ResponseFailureBlock)failBlock;
- (AFHTTPSessionManager *)createAFHttpManagerForApi:(AbsApi<BaseApiDelegate>*)api;
- (void)cancelAllRequest;

@end
