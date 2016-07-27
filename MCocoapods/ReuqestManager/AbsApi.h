//
//  AbsApi.h
//  MCocoapods
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseApiDelegate.h"

enum RequestMethod
{
    RequestMethodPOST = 1,
    RequestMethodGET = 2
};

@interface AbsApi : NSObject<AbsApiDelegate>

/// 完整的请求url
- (NSString *)getReqUrl;
/// 设置超时时间
- (int)getTimeOut;

@end
