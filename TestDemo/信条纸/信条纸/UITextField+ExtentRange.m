//
//  UITextField+ExtentRange.m
//  信条纸
//
//  Created by lq on 15/9/10.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "UITextField+ExtentRange.h"

@implementation UITextField (ExtentRange)
- (NSRange)textRange{
    UITextPosition *beginning = self.beginningOfDocument;
    UITextRange *selectRange = self.selectedTextRange;
    UITextPosition *selectionStr = selectRange.start;
    UITextPosition *selectionEnd = selectRange.end;
    const NSInteger location = [self offsetFromPosition:beginning toPosition:selectionStr];
    const NSInteger length = [self offsetFromPosition:selectionStr toPosition:selectionEnd];
    return NSMakeRange(location, length);
}
- (void)setSlectRange:(NSRange)range{
    UITextPosition *beginLocation = self.beginningOfDocument;
    UITextPosition *startLocation = [self positionFromPosition:beginLocation offset:range.location];
    UITextPosition *endLocation = startLocation;
    UITextRange *selectionRange = [self textRangeFromPosition:startLocation toPosition:endLocation];
    [self setSelectedTextRange:selectionRange];
}
@end
