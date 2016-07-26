//
//  DataService.h
//  MCocoapods
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "SDWebImageCompat.h"

typedef void (^FinshBlock)(id result);//请求成功的block
typedef void (^FailureBlock)(NSError *error);//请求失败的block


@interface DataService : NSObject

+ (void)requestWithBaseUrl:(NSString *)baseUrl
                    UrlStr:(NSString *)urlStr       //url
                HttpMethod:(NSString *)method        //请求方式
                   Parmars:(NSDictionary *)pramars //请求参数
             DidFinisBlock:(FinshBlock)finshBlock //请求成功
           DidFailureBlock:(FailureBlock)failureBlock;//请求失败


@end