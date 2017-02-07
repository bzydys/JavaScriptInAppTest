//
//  RootViewController.m
//  
//
//  Created by Lee on 17/2/7.
//
//

#import "RootViewController.h"
#import "JsCallNativeViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)jsCallNative:(id)sender {
    
    [self.navigationController pushViewController:[JsCallNativeViewController new] animated:YES];
    
}
- (IBAction)nativeCallJS:(id)sender {
    
    self.context = [[JSContext alloc] init];
    [self.context evaluateScript:[self loadJsFile:@"test"]];
    
    JSValue *function = [self.context objectForKeyedSubscript:@"showTitle"];
    JSValue *title = [function callWithArguments:nil];
    self.title = [title toString];
    
}

- (NSString *)loadJsFile:(NSString*)fileName{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"js"];
    NSString *jsScript = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return jsScript;
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
