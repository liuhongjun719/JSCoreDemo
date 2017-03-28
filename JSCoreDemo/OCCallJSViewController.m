//
//  OCCallJSViewController.m
//  JSCoreDemo
//
//  Created by 123456 on 17/3/20.
//  Copyright © 2017年 123456. All rights reserved.
//

#import "OCCallJSViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface OCCallJSViewController ()
@property (weak, nonatomic) IBOutlet UITextField *numberTextField;
@property (strong, nonatomic) JSContext *context;
@end

@implementation OCCallJSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.context = [[JSContext alloc] init];
    [self.context evaluateScript:[self loadJsFile:@"test"]];
}
- (NSString *)loadJsFile:(NSString*)fileName
{
    NSString *path = [[NSBundle mainBundle] pathForResource:fileName ofType:@"js"];
    NSString *jsScript = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
    return jsScript;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showNumberAction:(id)sender {
    NSNumber *inputNumber = [NSNumber numberWithInteger:[self.numberTextField.text integerValue]];
    JSValue *function = [self.context objectForKeyedSubscript:@"factorial"];
    JSValue *result = [function callWithArguments:@[inputNumber]];
    self.numberTextField.text = result.toString;
}



@end
