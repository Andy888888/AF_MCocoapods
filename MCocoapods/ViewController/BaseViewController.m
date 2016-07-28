//
//  BaseViewController.m
//  MCocoapods
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _manager = [RequestManager initManagerWithDelegate:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)dealloc
{
    _manager.delegate = nil;
    _manager = nil;
    NSLog(@"%@页面销毁, manager = %@",self,_manager);
}

- (void)respSuc:(id)data
{
}

- (void)respFail:(NSError *)error
{
}


@end
