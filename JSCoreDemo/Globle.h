//
//  Globle.h
//  JSCoreDemo
//
//  Created by 123456 on 17/3/20.
//  Copyright © 2017年 123456. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "GlobleProtocol.h"

@interface Globle : NSObject<GlobleProtocol>
@property(nonatomic,weak)UIViewController * ownerController;

@end
