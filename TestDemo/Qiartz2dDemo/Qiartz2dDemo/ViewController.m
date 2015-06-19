//
//  ViewController.m
//  Qiartz2dDemo
//
//  Created by wgl7569 on 15-4-16.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//
#import "ViewController.h"
#import "ImageView.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor = [UIColor grayColor];
//    ImageView *im = [[ImageView alloc]initWithFrame:self.view.bounds];
//    [self.view addSubview:im];
    CGSize size = CGSizeMake(self.view.frame.size.width, 35);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    
    
    CGContextRef rtf = UIGraphicsGetCurrentContext();
    CGFloat heigh = 35;
    CGContextAddRect(rtf, CGRectMake(0, 0, self.view.frame.size.width, heigh));
    [[UIColor whiteColor]set];
    CGContextFillPath(rtf);
    
    CGFloat lineWidth = 2;
    CGFloat lineY = heigh - lineWidth;
    CGFloat lineX = 0;
    CGContextMoveToPoint(rtf, lineX, lineY);
    CGContextAddLineToPoint(rtf, self.view.frame.size.width, lineY);
    [[UIColor orangeColor] set];
    CGContextStrokePath(rtf);
    
    
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIColor *color=[UIColor colorWithPatternImage:image];
    self.view.backgroundColor=color;
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
