//
//  ViewController.m
//  信条纸
//
//  Created by wgl7569 on 15-7-1.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "ViewController.h"
#import "CustomStatusBar.h"
#import "信条纸-Bridging-Header.h"
#import "信条纸-swift.h"
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
    
    
    UIButton *btn =[ UIButton buttonWithType:UIButtonTypeContactAdd];
    btn.frame = CGRectMake(100, 100, 40, 40);
    [self.view addSubview:btn];
    [btn addTarget:self action:@selector(addBtnAction) forControlEvents:UIControlEventTouchUpInside];
    
    
    
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
//    CustomStatusBar *cs = [[CustomStatusBar alloc]init];
//    [cs showStatusMessage:@"22222222"];
//    [self setRefreshWindow];

    
}
-(void)addBtnAction{
    SwiftViewController *sv = [[SwiftViewController alloc]init];
    [self presentViewController:sv animated:YES completion:^{
        
    }];
}
-(void)setRefreshWindow{
    CGRect frame = CGRectMake(0.0, 0.0, 320.0, 20.0);
    UIWindow *statusbarWindow = [[UIWindow alloc] initWithFrame:frame];
    [statusbarWindow setBackgroundColor:[UIColor blackColor]];
    [statusbarWindow setWindowLevel:UIWindowLevelStatusBar+1.0f];
    
    // 添加自定义子视图
    UIImageView *customView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 0, 120, 18)];
    customView.image=[UIImage imageNamed:@"数据刷新栏.png"];
    
    UILabel *label=[[UILabel alloc] initWithFrame:CGRectMake(100, 0, 100, 20)];
    label.backgroundColor=[UIColor clearColor];
    label.text=@"数据正在刷新";
    [customView addSubview:label];
    [statusbarWindow addSubview:customView];
    [statusbarWindow makeKeyAndVisible];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
