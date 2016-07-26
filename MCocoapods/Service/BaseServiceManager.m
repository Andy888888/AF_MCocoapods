//
//  BaseServiceManager.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "BaseServiceManager.h"


@implementation BaseServiceManager

+ (id)shareManager
{
    return [[BaseServiceManager alloc]init];
}

- (void)sendRequest:(id<BaseApiDelegate>)delegate
           sucBlock:(ResponseSuccessBlock)sucBlock
           falBlock:(ResponseFailureBlock)falBlock;
{
    int requestMethod = [delegate getRequestMethod];
//    RequestMethodPOST
    if(requestMethod == RequestMethodPOST){
        [self postRequest:delegate sucBlock:sucBlock falBlock:falBlock];
    }else{
        [self getRequest:delegate sucBlock:sucBlock falBlock:falBlock];
    }
}

- (void)postRequest:(id<BaseApiDelegate>)delegate
           sucBlock:(ResponseSuccessBlock)sucBlock
           falBlock:(ResponseFailureBlock)falBlock;
{
    NSString *rootUrl = [delegate getRootUrl];
    NSString *path = [delegate getPath];
    int timeOut = [delegate getTimeOut];
    NSDictionary *bodyDic = [delegate getBaseBody];
    
    //创建URL
    NSString *requestUrl = [NSString stringWithFormat:@"%@%@",rootUrl,path];
    
    //创建会话对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    //设置超时时间
    manager.requestSerializer.timeoutInterval = timeOut;
    [self setAcceptableContentTypes:manager];
    //设置请求数据的解析方式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
//    [manager.requestSerializer setValue: forHTTPHeaderField:];
    
    
    [manager POST:requestUrl
       parameters:bodyDic
         progress:^(NSProgress * _Nonnull uploadProgress) {
             NSLog(@"%@",uploadProgress);
         } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
             NSLog(@"%@",task);
             //请求成功
             NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
             if (sucBlock) {
                 sucBlock(dic);
             }
             
         } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
             //请求失败
             if (falBlock) {
                 falBlock(error);
             }
         }];
}

- (void)getRequest:(id<BaseApiDelegate>)delegate
          sucBlock:(ResponseSuccessBlock)sucBlock
          falBlock:(ResponseFailureBlock)falBlock;
{
    
}

- (void)setAcceptableContentTypes:(AFHTTPSessionManager *)manager
{
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/html",@"text/javascript",@"text/plain",@"text/json",@"application/json", nil]];
}















@end
