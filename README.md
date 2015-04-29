# AlipaySDK
AlipaySDK(iOS 2.1.2)
初始化


最近ios项目需要集成支付宝无线支付，才发现支付宝放出的支付宝支付集成SDK下载地址真心难找，为了大家方便我就把地址贴出了吧~你可以去下载官方版：

     https://b.alipay.com/order/productDetail.htm?productId=2014110308141993&tabId=4#ps-tabinfo-hash 


官方给出的SDK主要有几点没有完善：

1.一堆头文件找不到，Openssl这个库引入不对；

2.对支付结果数据也没有给出解析；

下面是我附上的一个可执行版本：

你只需要把APViewController.m 文件中的：

    NSString *partner = @"";
    NSString *seller = @"";
    NSString *privateKey = @"";

参数修改为你们项目用到的商户的唯一的parnter和seller。以及私钥就可以直接演示使用了。 