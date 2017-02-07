//
//  JsCallNativeViewController.m
//  
//
//  Created by Lee on 17/2/7.
//
//

#import "JsCallNativeViewController.h"

@interface JsCallNativeViewController ()<UIWebViewDelegate>
{
    UIWebView *_webView;
}

@end

@implementation JsCallNativeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    _webView.delegate = self;
    [self.view addSubview:_webView];
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"html"];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL fileURLWithPath:path]];
    [_webView loadRequest:request];
    
    // Do any additional setup after loading the view.
}

#pragma mark - UIWebViewDelegate

- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    self.title = [webView stringByEvaluatingJavaScriptFromString:@"document.title"];
    self.context = [webView valueForKeyPath:@"documentView.webView.mainFrame.javaScriptContext"];
    // 打印异常
    self.context.exceptionHandler =
    ^(JSContext *context, JSValue *exceptionValue)
    {
        context.exception = exceptionValue;
        NSLog(@"%@", exceptionValue);
    };
    
    // 以 JSExport 协议关联 native 的方法
    self.context[@"native"] = self;
    
    self.context[@"alert"] =
    ^(NSString *str)
    {
        UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"msg from js" message:str delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        [alert show];
    };


}

#pragma mark - JSExport Methods
-(void)handleLogin:(NSString *)userName psd:(NSString *)psd wer:(NSString *)wer{
    
    NSLog(@"%@---%@", userName, psd);
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
