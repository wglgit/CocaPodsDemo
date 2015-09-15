//
//  UITextField+ExtentRange.h
//  信条纸
//
//  Created by lq on 15/9/10.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITextField (ExtentRange)
- (NSRange)textRange;
- (void)setSlectRange:(NSRange)range;
@end
