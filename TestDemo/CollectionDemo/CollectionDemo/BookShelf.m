//
//  BookShelf.m
//  CollectionDemo
//
//  Created by wgl7569 on 15-6-25.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "BookShelf.h"

@implementation BookShelf
-(id)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]){
        UIImageView *imageV = [[UIImageView alloc]initWithFrame:self.bounds];
        [imageV setImage:[UIImage imageNamed:@"bookshelf"]];
        [self addSubview:imageV];
    }
    return self;
}
@end
