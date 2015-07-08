//
//  MyHeaderViewCollectionReusableView.m
//  CollectionDemo
//
//  Created by wgl7569 on 15-6-19.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "MyHeaderView.h"

@implementation MyHeaderView{
    UILabel *mainLabel;
}
-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        mainLabel  = [[UILabel alloc]init];
        mainLabel.font = [UIFont systemFontOfSize:18];
        [self addSubview:mainLabel];
    }
    return self;
}
-(void)setLabelText:(NSString *)str{
    [mainLabel setText:str];
    [mainLabel sizeToFit];
}
@end
