//
//  LiveView.m
//  CocaPodsDemo
//
//  Created by wgl7569 on 15-5-29.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "LiveView.h"
@implementation LiveView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)addSubviews
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.redBoxView];
    [self addSubview:self.blueBoxView];
}
- (void)defineLayout
{
    __weak __typeof(&*self)ws = self;
    [self.redBoxView mas_updateConstraints:^(MASConstraintMaker* make){
//        make.centerY.mas_equalTo(ws.mas_centerY);
//        make.left.mas_equalTo(ws.mas_left).width.offset(10);
//        make.right.equalTo(ws.blueBoxView.mas_left).with.offset(-10);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(ws.blueBoxView);
        make.top.equalTo(@(ws.redBoxView.cas_marginTop));
        make.left.equalTo(@(ws.redBoxView.cas_marginLeft));
        make.width.equalTo(@(ws.redBoxView.cas_sizeWidth));
        make.height.equalTo(@(ws.redBoxView.cas_sizeHeight));
    }];
    [self.blueBoxView mas_updateConstraints:^(MASConstraintMaker *make){
        make.top.equalTo(@(ws.blueBoxView.cas_marginTop));
        make.right.equalTo(@(ws.blueBoxView.cas_marginRight));
        make.width.equalTo(@(ws.blueBoxView.cas_sizeWidth));
        make.height.equalTo(@(ws.blueBoxView.cas_sizeHeight));
//        make.centerY.mas_equalTo(ws.mas_centerY);
//        make.left.equalTo(ws.redBoxView.mas_right).width.offset(10);
//        make.right.equalTo(ws.mas_right).with.offset(-10);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(ws.redBoxView);


    }];
}
#pragma mark - Lazy initialization
- (UIView*)redBoxView
{
    if (!_redBoxView) {
        _redBoxView = [UIView new];
        _redBoxView.cas_styleClass = @"redBox";
        _redBoxView.backgroundColor = [UIColor redColor];
    }
    return _redBoxView;
}
- (UIView*)blueBoxView
{
    if (!_blueBoxView) {
        _blueBoxView = [UIView new];
        _blueBoxView.cas_styleClass = @"blueBox";
        _blueBoxView.backgroundColor = [UIColor blueColor];
    }
    return _blueBoxView;
}
@end
