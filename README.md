# AF_MCocoapods
AF_MCocoapods

感谢王雅琦，李慧娟一起验证，给于修改建议。

1.添加header		[manager.requestSerializer setValue: forHTTPHeaderField:];
===
2.manager  cancelAll request		[manager.operationQueue cancelAllOperations];	
---
3.set timeOut		manager.requestSerializer.timeoutInterval = 30;


`[BaseRequestApi]`<br>
---
    1.getBaseHeader     //请求基础header<br>
    2.getBaseBody       //请求基础body<br>
    3.getRootUrl				//请求rootUrl<br>
    4.getPath           //请求url后半部分<br>
    5.getRequestMethod  //请求方式<br>
    6.setTimeOut				//设置超时时间<br>
