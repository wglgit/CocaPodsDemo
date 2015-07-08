//
//  WGLCircleProgressView.h
//  UIBezierpthAndCashapLayer
//
//  Created by wgl7569 on 15-7-3.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WGLCircleProgressView : UIView
@property (nonatomic , strong) UIColor *pressColor;
@property (nonatomic , strong) UIColor *trackColor;
@property (nonatomic) CGFloat press;
@property (nonatomic) CGFloat pressWith;
- (void)setPress :(float)progress ainimate:(BOOL)ainimate;
@end
