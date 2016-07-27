//
//  RequestManager.h
//  MCocoapods
//
//  Created by 燕文强 on 16/7/27.
//  Copyright © 2016年 燕文强. All rights reserved.
//

#import "BaseServiceManager.h"

@protocol ResponseDelegate <NSObject>

- (void)respSuc:(id)data;
- (void)respFail:(NSError *)error;

@end

@interface RequestManager : BaseServiceManager

@property (nonatomic,strong) id<ResponseDelegate> delegate;

+ (id)initManagerWithDelegate:(id<ResponseDelegate>)delegate;
- (void)sendRequest:(AbsApi<BaseApiDelegate>*)api;

@end
