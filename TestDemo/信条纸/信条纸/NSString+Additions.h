//
//  NSString+Additions.h
//  Leqian
//
//  Created by 姜耀鹏 on 14-12-12.
//  Copyright (c) 2014年 姜耀鹏. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Additions)

//获得一个经过md5加密的字符串 
//+ (NSString *)getMacStrFromArray:(NSArray *)array;

+ (NSString *)jsonStringWithDictionary:(NSDictionary *)dictionary;

+ (NSString *)jsonStringWithArray:(NSArray *)array;

+ (NSString *)jsonStringWithString:(NSString *) string;

+ (NSString *)jsonStringWithObject:(id) object;

+ (NSString *)randomString;



//去掉左右空格
+ (NSString *)RemoveSpaceLeftRight:(NSString *)str;


//- (CGSize)getStringSizeWithFont:(UIFont *)font;

/*
 将yyyy-MM-dd的日期格式 转化为 M/dd 的日期格式
 */
-(NSString *)formateChartDate;

/*
 2014-05-31 日期 格式化 为 05-31 的日期格式
 */
-(NSString *)yieldDateFormate;

/*
 2014-06-10 15:19:03 返回 2014-06-10 或者 15:19:03
 */
-(NSString *)divieDate:(BOOL)isShowFirst;

+ (NSString *)jsonWithObject:(id)value;//将Json值解出来



+ (NSString *)stringWithComma:(NSString *)pointString;//金额每三位加逗号

+ (NSData *)RSASet:(NSString *)string;

@end
