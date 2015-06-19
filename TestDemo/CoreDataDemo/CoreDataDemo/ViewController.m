//
//  ViewController.m
//  CoreDataDemo
//
//  Created by wgl7569 on 15-1-15.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "ViewController.h"
#import "CoreDataObject.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CoreDataObject *coreData = [[CoreDataObject alloc]init];
    NSMutableArray *array = [[NSMutableArray alloc]init];
    for (int i =0 ;i<9;i++){
        NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
        [dict setObject:@"title" forKey:@"title"];
        [dict setObject:@"title" forKey:@"content"];
        [array addObject:dict];
    }
    [coreData insertCoreData:array];
    NSMutableArray *returnA = [coreData selectData:0 andOffset:1];
//    [coreData deleteData];
    for(News *info in returnA){
        NSLog(@"%@,%lu",info.title,(unsigned long)[returnA count]);
    }
//    NSTimeZone *zone = [NSTimeZone systemTimeZone];
//    NSInteger interval = [zone secondsFromGMTForDate:dateNow];
//    NSDate *localDate = [dateNow dateByAddingTimeInterval:interval ];
//    NSLog(@"%@",localDate);
//    NSString *timeS = [NSString stringWithFormat:@"%ld",(long)[localDate timeIntervalSince1970]];
//    NSLog(@"%@",timeS);
//    NSDate *cTimeSp = [NSDate dateWithTimeIntervalSince1970:[timeS intValue]];
//    NSLog(@"%@",cTimeSp);
    NSDate *dateNow = [NSDate date];
    NSDateFormatter *formatter1 = [[NSDateFormatter alloc]init];
    [formatter1 setAMSymbol:@"AM"];
    [formatter1 setPMSymbol:@"PM"];
    [formatter1 setDateFormat:@"yyyy-MM-dd HH:mm:ss z"];
    NSString *dateString = [formatter1 stringFromDate:dateNow];
    NSLog(@"dateString = %@",dateString);
    
    
    NSDateFormatter *formatter2 = [[NSDateFormatter alloc]init];
    [formatter2 setTimeZone:[NSTimeZone timeZoneForSecondsFromGMT:0]];
    [formatter2 setAMSymbol:@"AM"];
    [formatter2 setPMSymbol:@"PM"];
    [formatter2 setDateFormat:@"yyyy-MM-dd HH:mm:ss z"];
    NSDate *zDate = [formatter2 dateFromString:dateString];
    //    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    //    NSInteger inter = [zone secondsFromGMTForDate:nil];
    //    NSDate *date = [zDate dateByAddingTimeInterval:inter];
    NSLog(@"zDate = %@",zDate);
    
    UIImage *image ;
    [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    NSDateFormatter *formatter3 = [[NSDateFormatter alloc]init];
    [formatter3 setAMSymbol:@"AM"];
    [formatter3 setPMSymbol:@"PM"];
    [formatter3 setDateFormat:@"yyyy-MM-dd HH:mm:ss z"];
    NSString *zzStr = [formatter3 stringFromDate:zDate];
    NSLog(@"zzStr = %@",zzStr);
    //得到本地时间，避免时区问题
    NSTimeZone *zone = [NSTimeZone systemTimeZone];
    NSInteger interval = [zone secondsFromGMTForDate:date];
//    NSDate *localeDate = [date dateByAddingTimeInterval:interval];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
