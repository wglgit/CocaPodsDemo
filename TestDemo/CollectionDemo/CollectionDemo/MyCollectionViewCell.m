//
//  MyCollectionViewCell.m
//  CollectionDemo
//
//  Created by wgl7569 on 15-6-19.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//
#import "UIColor+renderColor.h"
#import "MyCollectionViewCell.h"

@implementation MyCollectionViewCell
- (id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
//        UIImageView *imageV = [[UIImageView alloc]initWithFrame:self.bounds];
//        [imageV setImage:[UIImage imageNamed:@"book"]];
//        [self addSubview:imageV];
        self.backgroundColor = [UIColor randomColor];
    }
    return self;
}
-(UIImage *)copyCellImage{
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, self.opaque, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
@end
