XPC使用过程：
1、新建App工程
   Xcode -> File -> New -> Project... -> macOS -> Application -> App -> click Next
   填写Product Name(XPCDemo) -> 选择或者不选择Team账号 -> click Next -> click create， 创建一个工程

2、创建xpc service
   选中project -> 显示targets栏 -> 点击"+"号
   选择macOS -> 筛选框中输入xpc -> 选择XPC Service -> click Next
   填写Product Name -> 设置 Bundle Identifer -> click Finish完成创建

3、检查和设置
   创建完成后，检查下TARGETS -> XPCDemo -> Build Phases中，有增加一项 Embed XPC Services
   这个功能现在在我的Xcode 11.0是自动添加的，但很早以前的版本好像还要自己添加才行

   检查或设置xpc的bundle identifer，在调用xpc时使用

4、文件说明：
    XPC 创建后，在工程中会生成4个文件，
    XPCServiceProtocol.h声明一些函数，
        调用XPC的时候，调用Protocol中声明的方法，Protocol是内外使用方法的桥梁
    XPCService.h继承协议
    XPCService.m中实现这些协议方法
    main.m自主生成，初级功能不用管
    
5、XPC启动和方法调用
    在XPCServiceProtocol.h中也给出了如何使用xpc的一个示例代码
    示例中给出了建立连接、运行方法、清除连接的方法
    
    A）ViewController.h中import XPCServiceProtocol.h和XPCService.h
    B) ViewController.m中声明XPC连接变量
        @interface ViewController(){
            NSXPCConnection *_connectionToService; //私有变量
        }
        @end
    C)viewDidLoad方法中建立连接
        //建立xpc连接并启动
        _connectionToService = [[NSXPCConnection alloc] initWithServiceName:@"com.company.XPCService"];
        _connectionToService.remoteObjectInterface = [NSXPCInterface interfaceWithProtocol:@protocol(XPCServiceProtocol)];
        [_connectionToService resume];
    D)XPC执行方法：
        [[_connectionToService remoteObjectProxy] upperCaseString:@"hello" withReply:^(NSString *aString) {
            NSLog(@"Result string was: %@", aString);
        }];
    
    E) CSDN链接：https://blog.csdn.net/auspark/article/details/105651022

