//
//  ViewController.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/26.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "ViewController.h"
#import "DataConvert.h"
#import "PermUserEntity.h"
#import "DepartmentModel.h"
#import "RequestManager.h"
#import "GetUserPermissionApi.h"
#import "SecondViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - 事件
- (IBAction)btnClick:(id)sender {
    
//    [self sendUseBlock];
    [self sendUseProtocal];
}

- (IBAction)turnClick:(id)sender {
    SecondViewController *vc = [[SecondViewController alloc] init];
    [self presentViewController:vc animated:YES completion:^{
        
    }];
}

#pragma mark - 私有方法

// 使用Block请求
- (void)sendUseBlock
{
    GetUserPermissionApi *api = [[GetUserPermissionApi alloc]init];
    api.staffNos = @[@"Ceshibj2015120166"];
    [_manager sendRequest:api sucBlock:^(id result) {
        
        PermUserEntity *perUser = [DataConvert convertDic:result toEntity:[PermUserEntity class]];
        DepartmentModel *depart = perUser.PermUserInfos[0];
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"提示"
                                                      message:depart.identify.uName
                                                     delegate:nil
                                            cancelButtonTitle:@"cancle"
                                            otherButtonTitles:@"ok", nil];
        [alert show];
    } falBlock:^(NSError *error) {
        
    }];
}

// 使用Protocal发送请求
- (void)sendUseProtocal
{
    GetUserPermissionApi *api = [[GetUserPermissionApi alloc]init];
    api.staffNos = @[@"Ceshibj2015120166"];
    [_manager sendRequest:api];
}

#pragma mark - 网络请求结果 ResponseDelegate
//在项目中保证该回调放在文件最底部

- (void)respSuc:(id)data andRespClass:(id)cls
{
    if([cls isEqual:[PermUserEntity class]])
    {
        NSLog(@"第一个界面返回数据：%@",data);
        PermUserEntity *perUser = [DataConvert convertDic:data toEntity:cls];
        DepartmentModel *depart = perUser.PermUserInfos[0];
        
        UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"提示"
                                                      message:depart.identify.uName
                                                     delegate:nil
                                            cancelButtonTitle:@"cancle"
                                            otherButtonTitles:@"ok", nil];
        [alert show];
    }
}

- (void)respFail:(NSError *)error
{
}



@end
