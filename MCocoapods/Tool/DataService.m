//
//  DataService.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "DataService.h"

@implementation DataService

+ (void)requestWithBaseUrl:(NSString *)baseUrl UrlStr:(NSString *)urlStr HttpMethod:(NSString *)method Parmars:(NSDictionary *)pramars DidFinisBlock:(FinshBlock)finshBlock DidFailureBlock:(FailureBlock)failureBlock{
    
    if (pramars == nil) {
        pramars = [[NSDictionary alloc] init];
    }
    
    //创建URL
    NSString *newStr = [NSString stringWithFormat:@"%@%@",baseUrl,urlStr];
    
    //创建会话对象
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
//    [manager.operationQueue cancelAllOperations];
    
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"text/html",@"text/javascript",@"text/plain",@"text/json",@"application/json", nil]];
    
    //设置请求数据的解析方式
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //    [manager.requestSerializer setValue: forHTTPHeaderField:];
    
    //设置超时时间
    manager.requestSerializer.timeoutInterval = 30;
    
    if ([method isEqualToString:@"GET"]) {//////////////////////////--------GET请求
        [manager GET:newStr
          parameters:pramars
            progress:^(NSProgress * _Nonnull downloadProgress) {
                
            } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                //请求成功
                NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
                if (finshBlock) {
                    finshBlock(dic);
                }
                
            } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                //请求失败
                if (failureBlock) {
                    failureBlock(error);
                }
                
            }];
        
    }
    
    
    else if ([method isEqualToString:@"POST"]){////////////////////////---------POST请求
        //判断是否有多媒体文件资料上传
        BOOL isFile = NO;
        for (NSString *key in pramars) {
            id value = [pramars objectForKey:key];
            if ([value isKindOfClass:[NSData class]]) {
                //有文件类型的数据
                isFile = YES;
                break;
            }
        }
        
        if (!isFile) {
            ///////没有文件资料
            [manager POST:newStr
               parameters:pramars
                 progress:^(NSProgress * _Nonnull uploadProgress) {
                     NSLog(@"%@",uploadProgress);
                 } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                     NSLog(@"%@",task);
                     //请求成功
                     NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
                     if (finshBlock) {
                         finshBlock(dic);
                     }
                     
                 } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                     //请求失败
                     if (failureBlock) {
                         failureBlock(error);
                     }
                 }];
        }else{
            //////有文件资料上传
            [manager POST:newStr
               parameters:pramars
constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
    //往formData表单中添加数据
    for (NSString *key in pramars) {
        id value = [pramars objectForKey:key];
        if ([value isKindOfClass:[NSData class]]) {
            [formData appendPartWithFileData:value
                                        name:key
                                    fileName:@"userIcon.jpg"
                                    mimeType:@"image/jpeg"];
        }
    }
    
} progress:^(NSProgress * _Nonnull uploadProgress) {
    
} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
    //请求成功
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
    if (finshBlock) {
        finshBlock(dic);
    }
    
    
} failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
    //请求失败
    if (failureBlock) {
        NSLog(@"%@",error);
        failureBlock(error);
    }
    
}];
        }
        
    }
    
    
    
    
    
}

@end
