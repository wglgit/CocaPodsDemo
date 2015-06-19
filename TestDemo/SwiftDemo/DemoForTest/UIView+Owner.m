//
//  UIView+Owner.m
//  DemoForTest
//
//  Created by wgl7569 on 14-12-15.
//  Copyright (c) 2014年 wgl7569. All rights reserved.
//

#import "UIView+Owner.h"
@class Owner;

@implementation UIView (Owner)
+(id)loadFromNibNamed:(NSString*) nibName {
    
    return [Owner viewFromNibNamed:nibName];
    
}

@end
