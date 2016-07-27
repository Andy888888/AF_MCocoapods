//
//  SecondViewController.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "SecondViewController.h"
#import "DataConvert.h"
#import "RequestManager.h"
#import "SecondApi.h"


@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor orangeColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = CGRectMake(100, 230, 180, 40);
    [btn setTitle:@"请求量化数据" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];

    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn2.frame = CGRectMake(100, 300, 180, 40);
    [btn2 setTitle:@"返回" forState:UIControlStateNormal];
    [btn2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn2 addTarget:self action:@selector(btnClick2:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn2];
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
}


#pragma mark - 事件

- (void)btnClick:(UIButton *)btn{
    SecondApi *secondApi = [[SecondApi alloc] init];
    
    secondApi.departKeyid = @"15020410-3847-1d0a-ec93-f8b2565b90c9";
    secondApi.endDate = @"2016-07-27";
    secondApi.startDate = @"2016-07-27";
    secondApi.userKeyId = @"bf87f61a-dd9a-c226-fed5-08d3aaeb1b59";
    
    [_manager sendRequest:secondApi];
}

- (void)btnClick2:(UIButton *)btn{

    [self dismissViewControllerAnimated:YES completion:^{
        
    }];

}


- (void)respSuc:(id)data{
    NSLog(@"第二个界面返回数据：%@",data);
    UIAlertView *alert =[[UIAlertView alloc]initWithTitle:@"请求成功"
                                                  message:nil
                                                 delegate:nil
                                        cancelButtonTitle:@"cancle"
                                        otherButtonTitles:@"ok", nil];
    [alert show];

}

- (void)respFail:(NSError *)error{
    NSLog(@"%@",error);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
