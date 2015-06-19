//
//  Person.h
//  DemoForTest
//
//  Created by wgl7569 on 15-4-8.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Book;
@interface Person : NSObject
@property(nonatomic,copy)NSString *name;
@property(nonatomic,assign) int age;
@property(nonatomic,strong)Book *book;
@end