//
//  ViewController.m
//  DemoAutoLayout
//
//  Created by wgl7569 on 14-12-24.
//  Copyright (c) 2014年 wgl7569. All rights reserved.
//

#import "ViewController.h"
#import "MyProgressView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView *leftView = [[UIView alloc]init];
    [leftView setBackgroundColor:[UIColor whiteColor]];
    UIView *rightView= [[UIView alloc]init];
    [rightView setBackgroundColor:[UIColor redColor]];
    UIView *bottomView = [[UIView alloc]init];
    [bottomView setBackgroundColor:[UIColor blackColor]];
    MyProgressView *progressView = [[MyProgressView alloc]initWithFrame:CGRectMake(20, 100, 300, 10)];
    progressView.targeValue = 10;
    [progressView setProgress:5];
    [self.view addSubview:progressView];
    
//    UIView *view = [[UIView alloc]init];
//    view.center = self.view.center;
//    view.bounds  = CGRectMake(0, 0, 1, 1);
//    [self.view addSubview:view];
//    [self.view addSubview:leftView];
//    [self.view addSubview:rightView];
//    [self.view addSubview:bottomView];
//    
//    rightView.translatesAutoresizingMaskIntoConstraints = NO;
//    leftView.translatesAutoresizingMaskIntoConstraints = NO;
//    bottomView.translatesAutoresizingMaskIntoConstraints = NO;
//    NSDictionary *metrics = @{@"blan":@10};
//    NSDictionary *dict = NSDictionaryOfVariableBindings(leftView,rightView,bottomView);
//    NSArray *array1 = [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-blan-[leftView(==rightView)]-[view]-[rightView]-blan-|" options:0 metrics:metrics views:NSDictionaryOfVariableBindings(leftView,rightView,view)];
//    NSArray *array5 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[leftView(==rightView)]-10-|" options:0 metrics:nil views:NSDictionaryOfVariableBindings(leftView,rightView)];
//    NSArray *array2 = [NSLayoutConstraint constraintsWithVisualFormat:@"|-[bottomView(>=10)]-|" options:0 metrics:metrics views:dict];
//    NSArray *array3 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[leftView(==bottomView)]-[bottomView]-blan-|" options:0 metrics:metrics views:dict];
//    NSArray *array4 = [NSLayoutConstraint constraintsWithVisualFormat:@"V:|-20-[rightView(==bottomView)]-[bottomView]-blan-|" options:0 metrics:metrics views:dict];
//    [self.view addConstraints:array1];
//    [self.view addConstraints:array5];
//    [self.view addConstraints:array2];
//    [self.view addConstraints:array3];
//    [self.view addConstraints:array4];

    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
