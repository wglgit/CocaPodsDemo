//
//  MyProgressView.m
//  DemoAutoLayout
//
//  Created by wgl7569 on 14-12-25.
//  Copyright (c) 2014年 wgl7569. All rights reserved.
//

#import "MyProgressView.h"

@implementation MyProgressView

-(id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]){
        _blackView = [[UIView alloc]initWithFrame:self.bounds];
        _blackView.clipsToBounds = YES;
        _blackView.layer.cornerRadius = self.frame.size.height/2;
        [_blackView setBackgroundColor:[UIColor grayColor]];
        [self addSubview:_blackView];
        
        _foreView = [[UIView alloc]initWithFrame:CGRectMake(0-self.frame.size.width, 0, self.frame.size.width, self.frame.size.height)];
        _foreView.layer.cornerRadius = self.frame.size.height/2;
        [_foreView setBackgroundColor:[UIColor greenColor]];
        [_blackView addSubview:_foreView];
        _currentValue = 0.0;
    }
    return self;
}
-(void)setProgress:(CGFloat)value
{
    if (0 == value){
        self.currentValue = 0;
    }
    _currentValue = value;
    if (!_progressTimer){
        _progressTimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(moveProgress) userInfo:nil repeats:NO];
    }
}
-(void)moveProgress
{
    _foreView.frame = CGRectMake(0-self.frame.size.width*(_currentValue/_targeValue), 0, _foreView.frame.size.width, _foreView.frame.size.height);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
