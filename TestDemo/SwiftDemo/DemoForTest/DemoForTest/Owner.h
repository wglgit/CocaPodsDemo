//
//  Owner.h
//  DemoForTest
//
//  Created by wgl7569 on 14-12-15.
//  Copyright (c) 2014年 wgl7569. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Owner : NSObject
@property (nonatomic , strong) IBOutlet UIView *view;
+(id)viewFromNibNamed:(NSString *)name;
@end
