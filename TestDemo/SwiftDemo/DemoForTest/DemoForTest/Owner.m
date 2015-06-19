//
//  Owner.m
//  DemoForTest
//
//  Created by wgl7569 on 14-12-15.
//  Copyright (c) 2014年 wgl7569. All rights reserved.
//

#import "Owner.h"

@implementation Owner
+(id)viewFromNibNamed:(NSString *)name
{
    Owner *owner = [self new];
    [[NSBundle mainBundle]loadNibNamed:name owner:owner options:nil];
    return owner.view;
}
@end
