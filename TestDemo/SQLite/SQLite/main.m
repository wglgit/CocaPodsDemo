//
//  main.m
//  SQLite
//
//  Created by wgl7569 on 15-1-28.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import <Cocoa/Cocoa.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSArray *names=@[@"张一",@"张二",@"张三",@"张四"];
        NSMutableString *sql=[NSMutableString string];
        
        for (int i=0; i<200; i++) {
            int ID=i+1;
            //这里的警告为无符号类型转换
            NSString *name=names[arc4random_uniform(names.count)];
            name=[name stringByAppendingFormat:@"-%d",arc4random_uniform(200)];
            //生成随机数，范围以20为中心上下波动10
            int age=arc4random_uniform(20)+10;
            [sql appendFormat:@"INSERT INTO t_student (id,name,age) VALUES (%d,'%@',%d);\n",ID,name,age];
        }
        //把sql写入到文件中
        [sql writeToFile:@"/Users/wgl7569/wgl.sqlite" atomically:YES encoding:NSUTF8StringEncoding error:nil];
        NSLog(@"\n%@",sql);
    }
    return 0;
}
