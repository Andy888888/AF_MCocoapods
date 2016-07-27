//
//  BaseViewController.h
//  MCocoapods
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RequestManager.h"

@interface BaseViewController : UIViewController<ResponseDelegate>
{
    RequestManager *_manager;
}

@end
