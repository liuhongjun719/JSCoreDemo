//
//  Globle.m
//  JSCoreDemo
//
//  Created by 123456 on 17/3/20.
//  Copyright © 2017年 123456. All rights reserved.
//

#import "Globle.h"

@implementation Globle
-(void)changeBackgroundColor:(JSValue *)value{
    self.ownerController.view.backgroundColor = [UIColor colorWithRed:value[@"r"].toDouble green:value[@"g"].toDouble blue:value[@"b"].toDouble alpha:value[@"a"].toDouble];
}

@end
