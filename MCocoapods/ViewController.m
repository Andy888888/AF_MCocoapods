//
//  ViewController.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "ViewController.h"
#import "DataService.h"
#import "DataConvert.h"
#import "PermUserEntity.h"
#import "DepartmentModel.h"
#import "RequestManager.h"
#import "GetUserPermissionApi.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (IBAction)btnClick:(id)sender {
    
//    [self sendOld];
//    [self sendFun];
    [self sendUseProtocal];
}

- (void)sendOld
{
        NSArray *arr = @[@"Ceshibj2015120166"];
    
        NSDictionary *paramars = @{@"UserNumbers":arr,
                                   @"IsMobileRequest":@"YES"};
    
        [DataService requestWithBaseUrl:@"http://10.5.10.42:9016/api/"
                                 UrlStr:@"WebApiPermisstion/get_user_permisstion"
                             HttpMethod:@"POST"
                                Parmars:paramars
                          DidFinisBlock:^(id result) {
    
                              PermUserEntity *perUser = [DataConvert convertDic:result toEntity:[PermUserEntity class]];
                              DepartmentModel *depart = perUser.PermUserInfos[0];
                              UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"提示"
                                                                            message:depart.identify.uName
                                                                           delegate:nil cancelButtonTitle:@"cancle" otherButtonTitles:@"ok", nil];
                              [alert show];
    
                              NSLog(@"%@",perUser);
    
                          } DidFailureBlock:^(NSError *error) {
                              NSLog(@"错误了");
                          }];
}

- (void)sendUseBlock
{
    GetUserPermissionApi *api = [[GetUserPermissionApi alloc]init];
    [_manager sendRequest:api sucBlock:^(id result) {
        
        PermUserEntity *perUser = [DataConvert convertDic:result toEntity:[PermUserEntity class]];
        DepartmentModel *depart = perUser.PermUserInfos[0];
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"提示"
                                                      message:depart.identify.uName
                                                     delegate:nil cancelButtonTitle:@"cancle" otherButtonTitles:@"ok", nil];
        [alert show];
    } falBlock:^(NSError *error) {
        
    }];
}

- (void)sendUseProtocal
{
    GetUserPermissionApi *api = [[GetUserPermissionApi alloc]init];
    [_manager sendRequest:api];
}

- (void)respSuc:(id)data
{
    PermUserEntity *perUser = [DataConvert convertDic:data toEntity:[PermUserEntity class]];
    DepartmentModel *depart = perUser.PermUserInfos[0];
    
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"提示"
                                                  message:depart.identify.uName
                                                 delegate:nil cancelButtonTitle:@"cancle" otherButtonTitles:@"ok", nil];
    [alert show];
}

- (void)respFail:(NSError *)error
{
    
}


























@end
