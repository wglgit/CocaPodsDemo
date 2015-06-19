//
//  ProgressView.m
//  Leqian
//
//  Created by 姜耀鹏 on 14/12/23.
//  Copyright (c) 2014年 姜耀鹏. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

- (id)initWithFrame:(CGRect)frame
{
    NSLog(@"%@",NSStringFromCGRect(frame));
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor redColor];
        self.layer.cornerRadius = 1.0f;
        self.layer.masksToBounds = YES;
        self.opaque = NO;
        self.iView = [[UIView alloc] init];
        _iView.frame = self.bounds;
        _iView.layer.cornerRadius = 1.0f;
        _iView.layer.masksToBounds = YES;
        _iView.opaque = NO;
        [self addSubview:_iView];
    }
    return self;
}

- (void)starViewAddWithNumber:(float)number
{
    CGRect frame = self.frame;
    _iView.frame = CGRectMake(0, 0, frame.size.width * number / 100, frame.size.height);
}

@end
