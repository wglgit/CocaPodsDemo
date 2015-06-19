//
//  UIBarButtonItem+Extension.h
//  WenWeiBoTest
//
//  Created by wgl7569 on 15-2-2.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+(UIBarButtonItem *)initWithImage:(NSString *)image withHighImage:(NSString *)highImage withTarget:(id)target withAction:(SEL)action;

@end
