//
//  NSString+Additions.m
//  Leqian
//
//  Created by 姜耀鹏 on 14-12-12.
//  Copyright (c) 2014年 姜耀鹏. All rights reserved.
//

#import "NSString+Additions.h"
//#import "NSString+MD5A ddition.h"
//#import "UIDevice+IdentifierAddition.h"
//#import "NSString+Security.h"
//#import "CommonUtils.h"
//#import "RSAEncrypt.h"

#ifdef __IPHONE_6_0
    # define LINE_BREAK_WORD_WRAP NSLineBreakByWordWrapping
#else
    # define LINE_BREAK_WORD_WRAP UILineBreakModeWordWrap
#endif

//#if __IPHONE_OS_VERSION_MIN_REQUIRED > __IPHONE_6_0
//    # define LINE_BREAK_WORD_WRAP NSLineBreakByWordWrapping
//#else
//    # define LINE_BREAK_WORD_WRAP UILineBreakModeWordWrap
//
//#endif

@implementation NSString (Additions)

+ (NSString *)stringWithComma:(NSString *)pointString
{
    NSString *sign = nil;
    if ([pointString hasPrefix:@"-"]||[pointString hasPrefix:@"+"]) {
        sign = [pointString substringToIndex:1];
        pointString = [pointString substringFromIndex:1];
    }
    NSArray *pointArray = [pointString componentsSeparatedByString:@"."];
    NSString *pointString1 = pointArray[0];
    NSString *pointLast = [pointString substringFromIndex:[pointString1 length]];
    NSString *pointFront = [pointString substringToIndex:[pointString1 length]];
    
    NSInteger commaNum = ([pointFront length]-1)/3;
    NSMutableArray *arr = [NSMutableArray array];
    for (int i = 0; i < commaNum+1; i++) {
        NSInteger index = [pointFront length] - (i+1)*3;
        NSInteger leng = 3;
        if(index < 0)
        {
            leng = 3+index;
            index = 0;
            
        }
        NSRange range = {index,leng};
        NSString *stq = [pointFront substringWithRange:range];
        [arr addObject:stq];
    }
    NSMutableArray *arr2 = [NSMutableArray array];
    for (NSInteger i = [arr count]-1; i>=0; i--) {
        
        [arr2 addObject:arr[i]];
    }
    NSString *commaString = [[arr2 componentsJoinedByString:@","] stringByAppendingString:pointLast];
    if (sign) {
        commaString = [sign stringByAppendingString:commaString];
    }
    return commaString;
}


@end
