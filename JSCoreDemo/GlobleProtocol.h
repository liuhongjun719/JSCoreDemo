//
//  GlobleProtocol.h
//  JSCoreDemo
//
//  Created by 123456 on 17/3/20.
//  Copyright © 2017年 123456. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <JavaScriptCore/JavaScriptCore.h>

@protocol GlobleProtocol <JSExport>
-(void)changeBackgroundColor:(JSValue *)value;

@end
