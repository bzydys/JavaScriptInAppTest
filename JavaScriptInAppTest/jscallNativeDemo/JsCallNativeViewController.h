//
//  JsCallNativeViewController.h
//  
//
//  Created by Lee on 17/2/7.
//
//

#import <UIKit/UIKit.h>
#import <JavaScriptCore/JavaScriptCore.h>


@protocol TestJSExport <JSExport>

-(void)handleLogin:(NSString *)userName psd:(NSString *)psd wer:(NSString *)wer;

@end

@interface JsCallNativeViewController : UIViewController<TestJSExport>
@property (strong, nonatomic) JSContext *context;
@end
