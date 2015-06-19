//
//  Book.m
//  DemoForTest
//
//  Created by wgl7569 on 15-4-8.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "Book.h"

@implementation Book
- (NSString *)description
{
    return [NSString stringWithFormat:@"<%@,%p>{bookname:%@}", [self class],self,self.bookname];
}
@end
