//
//  JSCallOCViewController.m
//  JSCoreDemo
//
//  Created by 123456 on 17/3/20.
//  Copyright © 2017年 123456. All rights reserved.
//

#import "JSCallOCViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>
#import "Globle.h"



@interface JSCallOCViewController ()
@property (nonatomic, strong) JSContext *jsContext;
@property(nonatomic,strong)NSMutableArray * actionArray;
@property(nonatomic,strong)Globle * globle;
@end

@implementation JSCallOCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createComponentThroughJSScripts];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 通过下发JS脚本创建原生的UILabel标签与UIButton控件
- (void)createComponentThroughJSScripts {
    //创建JS运行环境
    self.jsContext = [JSContext new];
    //绑定桥接器
    self.globle =  [Globle new];
    self.globle.ownerController = self;
    //    self.jsContext[@"Globle"] = self.globle;
    [self.jsContext setObject:self.globle forKeyedSubscript:@"Globle"];
    self.actionArray = [NSMutableArray array];
    [self render];
}

//界面渲染解释器
-(void)render{
    NSString * path = [[NSBundle mainBundle] pathForResource:@"main" ofType:@"js"];
    NSData * jsData = [[NSData alloc]initWithContentsOfFile:path];
    NSString * jsCode = [[NSString alloc]initWithData:jsData encoding:NSUTF8StringEncoding];
    JSValue * jsVlaue = [self.jsContext evaluateScript:jsCode];
    NSLog(@"value-----:%@", jsVlaue);
    for (int i=0; i<jsVlaue.toArray.count; i++) {
        JSValue * subValue = [jsVlaue objectAtIndexedSubscript:i];
        if ([[subValue objectForKeyedSubscript:@"typeName"].toString isEqualToString:@"Label"]) {
            UILabel * label = [UILabel new];
            label.frame = CGRectMake(subValue[@"rect"][@"x"].toDouble, subValue[@"rect"][@"y"].toDouble, subValue[@"rect"][@"width"].toDouble, subValue[@"rect"][@"height"].toDouble);
            label.text = subValue[@"text"].toString;
            label.textColor = [UIColor colorWithRed:subValue[@"color"][@"r"].toDouble green:subValue[@"color"][@"g"].toDouble blue:subValue[@"color"][@"b"].toDouble alpha:subValue[@"color"][@"a"].toDouble];
            label.backgroundColor = [UIColor colorWithRed:subValue[@"backgroundColor2"][@"r"].toDouble green:subValue[@"backgroundColor2"][@"g"].toDouble blue:subValue[@"backgroundColor2"][@"b"].toDouble alpha:subValue[@"backgroundColor2"][@"a"].toDouble];
            [self.view addSubview:label];
        }else if ([[subValue objectForKeyedSubscript:@"typeName"].toString isEqualToString:@"Button"]){
            UIButton * button = [UIButton buttonWithType:UIButtonTypeSystem];
            button.frame = CGRectMake(subValue[@"rect"][@"x"].toDouble, subValue[@"rect"][@"y"].toDouble, subValue[@"rect"][@"width"].toDouble, subValue[@"rect"][@"height"].toDouble);
            [button setTitle:subValue[@"text"].toString forState:UIControlStateNormal];
            button.tag = self.actionArray.count;
            [button addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.actionArray addObject:subValue[@"callFunc"]];
            [self.view addSubview:button];
            
        }
    }
}
//按钮转换方法
-(void)buttonAction:(UIButton *)btn{
    JSValue * action  = self.actionArray[btn.tag];
    //执行JS方法
    [action callWithArguments:nil];
}




@end
