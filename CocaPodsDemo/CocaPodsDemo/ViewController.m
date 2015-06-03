//
//  ViewController.m
//  CocaPodsDemo
//
//  Created by wgl7569 on 2015/5/22.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSMutableString *string = [NSMutableString stringWithString: @"origion"];
////    NSString *stringCopy = [string copy];
//    NSMutableString *mStringCopy = [string copy];
//    NSMutableString *stringMCopy = [string mutableCopy];
////    [mStringCopy appendString:@"mm"];//error
//    [string appendString:@" origion!"];
//    [stringMCopy appendString:@"!!"];

//    LiveView *liveView = [[LiveView alloc]initWithFrame:self.view.bounds];
//    self.view = liveView;
    
    WS(ws);
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(ws.view);
        make.size.mas_equalTo(CGSizeMake(300, 300));
    }];
    
    
    
    UIView *sv1 = [UIView new];
    sv1.backgroundColor = [UIColor redColor];
    [sv addSubview:sv1];
    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
