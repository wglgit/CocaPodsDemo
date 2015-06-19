//
//  WTextField.m
//  WenWeiBoTest
//
//  Created by wgl7569 on 15-2-3.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "WTextField.h"

@implementation WTextField
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self){
       
        self.background = [UIImage imageNamed:@"日期选择框"];
        self.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
        UIImageView *leftImage = [[UIImageView alloc]init];
        leftImage.image = [UIImage imageNamed:@"关闭"];
        self.leftView = leftImage;
        leftImage.width = leftImage.image.size.width+10;
        leftImage.height = leftImage.width;
        self.leftViewMode = UITextFieldViewModeAlways;
        leftImage.contentMode = UIViewContentModeCenter;
        self.clearButtonMode = UITextFieldViewModeAlways;
    }
    return  self;
}
+(instancetype)SearchBar{
    return [[self alloc]init];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
