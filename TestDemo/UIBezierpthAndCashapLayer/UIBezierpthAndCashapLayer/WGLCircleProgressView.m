//
//  WGLCircleProgressView.m
//  UIBezierpthAndCashapLayer
//
//  Created by wgl7569 on 15-7-3.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "WGLCircleProgressView.h"
@interface WGLCircleProgressView(){
    UIBezierPath *_tackPath;
    CAShapeLayer *_tackLayer;
    UIBezierPath *_pressPath;
    CAShapeLayer *_pressLayer;
}
@end
@implementation WGLCircleProgressView
-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        [self setBackgroundColor:[UIColor grayColor]];
        _tackLayer = [CAShapeLayer new];
        [self.layer addSublayer:_tackLayer];
        _tackLayer.fillColor = nil;
        _tackLayer.frame = self.bounds;
        
        
        _pressLayer = [CAShapeLayer new];
        [self.layer addSublayer:_pressLayer];
        _pressLayer.fillColor = nil;
        _pressLayer.lineCap = kCALineCapRound;
        _pressLayer.frame = self.bounds;
        
        self.pressWith = 5;
    }
    return self;
}
-(void)setTrack{
    _tackPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:(self.bounds.size.width - _pressWith)/2 startAngle:0 endAngle:M_PI *2 clockwise:YES];
    _tackLayer.path = _tackPath.CGPath;
}
-(void)setPressgress{
    _pressPath = [UIBezierPath bezierPathWithArcCenter:self.center radius:(self.bounds.size.width - _pressWith)/2 startAngle:-M_PI_2 *2 endAngle:(M_PI * 2) * _press - M_PI_2 clockwise:YES];
    _pressLayer.path = _pressPath.CGPath;
}
- (void)setPressWith:(CGFloat)pressWith{
    _pressWith = pressWith;
    _tackLayer.lineWidth = _pressWith;
    _pressLayer.lineWidth = _pressWith;
    [self setTrack];
    [self setPressgress];
}
- (void)setTrackColor:(UIColor *)trackColor{
    _tackLayer.strokeColor = trackColor.CGColor;
}
-(void)setPressColor:(UIColor *)pressColor{
    _pressLayer.strokeColor = pressColor.CGColor;
}
- (void)setPress:(CGFloat)press{
    _press = press;
    [self setPressgress];
}
- (void)setPress:(float)progress ainimate:(BOOL)ainimate{
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
