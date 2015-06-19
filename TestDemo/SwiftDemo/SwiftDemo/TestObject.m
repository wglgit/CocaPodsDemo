//
//  TestObject.m
//  SwiftDemo
//
//  Created by wgl7569 on 15-3-31.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject
-(NSString *)sayHello:(NSString *)greeting withName:(NSString *)name{
    NSString *str = [NSString stringWithFormat:@"%@,%@",name,greeting];
    return str;
}
@end
