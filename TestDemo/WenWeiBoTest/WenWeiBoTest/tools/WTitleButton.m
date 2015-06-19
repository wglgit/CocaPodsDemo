//
//  WTitleButton.m
//  WenWeiBoTest
//
//  Created by wgl7569 on 15-2-3.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "WTitleButton.h"

@implementation WTitleButton
-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        self.imageView.contentMode = UIViewContentModeCenter;
        self.adjustsImageWhenHighlighted = NO;
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        
    }
    return  self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageY = 0;
    CGFloat imageW = self.height;
    CGFloat imageH = imageW;
    CGFloat imageX = self.width - imageW;
    return CGRectMake(imageX, imageY, imageW, imageH);
}
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleX = 0;
    CGFloat titleY = 0;
    CGFloat titleH = self.height;
    CGFloat titleW = self.width - titleH;
    return CGRectMake(titleX, titleY, titleW, titleH);
}
@end
