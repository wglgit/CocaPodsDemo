//
//  ViewController.m
//  信条纸
//
//  Created by wgl7569 on 15-7-1.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.、
    CGSize size = CGSizeMake(self.view.frame.size.width,26);
    UIGraphicsBeginImageContextWithOptions(size, NO, 0);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGFloat height = 26;
    CGContextAddRect(ctx,CGRectMake(0, 0, self.view.frame.size.width, height));
    [[UIColor brownColor]set];
    CGContextFillPath(ctx);
    
    
    CGFloat linWideth = 2;
    CGFloat lineY = height - linWideth;
    CGFloat lineX = 0;
    CGContextMoveToPoint(ctx, lineX, lineY);
    CGContextAddLineToPoint(ctx, 375, lineY);
    [[UIColor blackColor]set];
    CGContextStrokePath(ctx);
    
    UIImage *image  = UIGraphicsGetImageFromCurrentImageContext();
    UIColor *color = [UIColor colorWithPatternImage:image];
    self.view.backgroundColor = color;
    
    
//    CGSize size = CGSizeMake(self.view.frame.size.width, 35);
//    UIGraphicsBeginImageContextWithOptions(size , NO, 0);
//    
//    // 2.画矩形
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    CGFloat height = 35;
//    CGContextAddRect(ctx, CGRectMake(0, 0, self.view.frame.size.width, height));
//    [[UIColor whiteColor] set];
//    CGContextFillPath(ctx);
//    
//    // 3.画线条
//    
//    CGFloat lineWidth = 2;
//    CGFloat lineY = height - lineWidth;
//    CGFloat lineX = 0;
//    CGContextMoveToPoint(ctx, lineX, lineY);
//    CGContextAddLineToPoint(ctx, 375, lineY);
//    [[UIColor blackColor] set];
//    CGContextStrokePath(ctx);
//    
//    
//    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
//    UIColor *color=[UIColor colorWithPatternImage:image];
//    self.view.backgroundColor=color;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
