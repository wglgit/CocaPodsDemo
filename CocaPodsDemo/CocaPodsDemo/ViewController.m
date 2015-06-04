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
    
    
    
//    UIView *sv1 = [UIView new];
//    sv1.backgroundColor = [UIColor redColor];
//    [sv addSubview:sv1];
//    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(sv).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//    }];
    
    UIView *sv2 = [UIView new];
    UIView *sv3 = [UIView new];

    sv2.backgroundColor = [UIColor redColor];
    sv3.backgroundColor = [UIColor redColor];

    [sv addSubview:sv2];
    [sv addSubview:sv3];
    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(sv.mas_left).with.offset(10);
        make.right.equalTo(sv3.mas_left).with.offset(-10);
        make.height.mas_equalTo(@150);
        make.width.equalTo(sv3);
    }];
    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(sv.mas_centerY);
        make.left.equalTo(sv2.mas_right).with.offset(10);
        make.right.equalTo(sv.mas_right).with.offset(-10);
        make.height.mas_equalTo(@150);
        make.width.mas_equalTo(sv2);
    }];
//    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(sv.mas_centerY);
//        make.left.equalTo(sv.mas_left).with.offset(padding1);
//        make.right.equalTo(sv3.mas_left).with.offset(-padding1);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(sv3);
//    }];
//    
//    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(sv.mas_centerY);
//        make.left.equalTo(sv2.mas_right).with.offset(padding1);
//        make.right.equalTo(sv.mas_right).with.offset(-padding1);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(sv2);
//    }];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
