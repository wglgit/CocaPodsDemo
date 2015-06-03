//
//  LiveView.h
//  CocaPodsDemo
//
//  Created by wgl7569 on 15-5-29.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//
#import "NSArray+MASAdditions.h"
#import "View+MASAdditions.h"
#import "UIView+ClassyLayoutProperties.h"
#import "UIView+CASAdditions.h"
#import "SHPAbstractView.h"
@interface LiveView : SHPAbstractView
@property (strong, nonatomic) UIView *redBoxView;
@property (strong, nonatomic) UIView *blueBoxView;
@end
