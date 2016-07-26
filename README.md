# AF_MCocoapods
AF_MCocoapods

1.添加header		[manager.requestSerializer setValue: forHTTPHeaderField:];
2.manager  cancelAll request		[manager.operationQueue cancelAllOperations];	
3.set timeOut		manager.requestSerializer.timeoutInterval = 30;


BaseRequestApi
1.getBaseHeader			//请求基础header
2.getBaseBody			//亲求基础body
2.getRootUrl				//请求rootUrl
3.getPath					//请求url后半部分
4.getRequestMethod		//请求方式
5.setTimeOut				//设置超时时间
