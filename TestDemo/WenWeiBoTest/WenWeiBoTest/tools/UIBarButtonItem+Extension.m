//
//  UIBarButtonItem+Extension.m
//  WenWeiBoTest
//
//  Created by wgl7569 on 15-2-2.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"


@implementation UIBarButtonItem (Extension)
+(UIBarButtonItem*)initWithImage:(NSString *)image withHighImage:(NSString *)highImage withTarget:(id)target withAction:(SEL)action{
    UIButton *btn = [[UIButton alloc]init];
    [btn setBackgroundImage: [UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    btn.size = btn.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc]initWithCustomView:btn];
}
@end
