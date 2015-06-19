//
//  WAudioTool.m
//  WenWeiBoTest
//
//  Created by wgl7569 on 15-2-10.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "WAudioTool.h"
@implementation WAudioTool
-(id)init{
    static id obj = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if ((obj = [super init])!=nil){
            
        }
    });
    self = obj;
    return self;
}
singleton_m(WAudioTool);
@end
