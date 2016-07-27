//
//  GetUserPermissionApi.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "GetUserPermissionApi.h"
#import "BaseApiDelegate.h"

@implementation GetUserPermissionApi

- (NSDictionary *)getBaseBody
{
    NSArray *arr = @[@"Ceshibj2015120166"];
    return @{@"UserNumbers":arr,
             @"IsMobileRequest":@"YES"};
}

-(NSString *)getPath
{
    return @"WebApiPermisstion/get_user_permisstion";
}


@end
