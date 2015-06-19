//
//  View5.m
//  DemoForTest
//
//  Created by wgl7569 on 14-12-15.
//  Copyright (c) 2014年 wgl7569. All rights reserved.
//

#import "View5.h"

@implementation View5

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
+(id)loadFromNib{
    return [self loadFromNibNamed:NSStringFromClass(self)];
}
@end
