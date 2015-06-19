//
//  MyProgressView.h
//  DemoAutoLayout
//
//  Created by wgl7569 on 14-12-25.
//  Copyright (c) 2014年 wgl7569. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyProgressView : UIView
@property (nonatomic,strong) UIView *blackView;
@property (nonatomic,strong) UIView *foreView;
@property (nonatomic) CGFloat targeValue;
@property (nonatomic) CGFloat currentValue;
@property (nonatomic , strong) NSTimer *progressTimer;

-(void)setProgress:(CGFloat)vlaue;

@end
