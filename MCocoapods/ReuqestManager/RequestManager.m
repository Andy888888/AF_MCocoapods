//
//  RequestManager.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "RequestManager.h"

@implementation RequestManager

+ (id)initManagerWithDelegate:(id<ResponseDelegate>)delegate
{
    RequestManager *manager = [[RequestManager alloc]init];
    manager.delegate = delegate;
    return manager;
}

- (void)sendRequest:(AbsApi<BaseApiDelegate>*)api
{
    int requestMethod = [api getRequestMethod];
    if(requestMethod == RequestMethodPOST){
        [self postRequest:api];
    }else{
        [self getRequest:api];
    }
}


- (void)postRequest:(AbsApi<BaseApiDelegate>*)api
{
    NSString *requestUrl = [api getReqUrl];
    NSDictionary *bodyDic = [api getBaseBody];
    Class cls = [api getRespClass];
    
    NSLog(@"********[请求地址：%@]",requestUrl);
    NSLog(@"********[请求参数：%@]",bodyDic);
    
    AFHTTPSessionManager *manager = [self createAFHttpManagerForApi:api];
    
    [manager POST:requestUrl
       parameters:bodyDic
         progress:^(NSProgress * _Nonnull uploadProgress) {
             NSLog(@"%@",uploadProgress);
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             //请求成功
             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
             if (self.delegate) {
                 [self.delegate respSuc:dic andRespClass:cls];
             }
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             //请求失败
             if (self.delegate) {
                 [self.delegate respFail:error];
             }
         }];
}

- (void)getRequest:(AbsApi<BaseApiDelegate>*)api
{
    NSString *requestUrl = [api getReqUrl];
    NSDictionary *paramDic = [api getBaseBody];
    Class cls = [api getRespClass];
    
    NSLog(@"********[请求地址：%@]",requestUrl);
    NSLog(@"********[请求参数：%@]",paramDic);
    
    AFHTTPSessionManager *manager = [self createAFHttpManagerForApi:api];
    
    [manager GET:requestUrl
      parameters:paramDic
        progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            //请求成功
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            if (self.delegate) {
                [self.delegate respSuc:dic andRespClass:cls];
            }
            
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            //请求失败
            if (self.delegate) {
                [self.delegate respFail:error];
            }
        }];
}

@end
