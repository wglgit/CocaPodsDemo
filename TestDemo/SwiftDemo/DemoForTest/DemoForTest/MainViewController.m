//
//  MainViewController.m
//  DemoForTest
//
//  Created by wgl7569 on 14-12-15.
//  Copyright (c) 2014年 wgl7569. All rights reserved.
//

#import "MainViewController.h"
#import "Owner.h"
#import "UIView+Owner.h"
#import "View5.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"View1" owner:nil options:nil];
    UIView *view1= [views lastObject];
    CGRect rect = view1.frame;
    rect.origin.y += 40;
    view1.frame = rect;
    [self.view addSubview:view1];
    
    [[NSBundle mainBundle]loadNibNamed:@"View2" owner:self options:nil];
    rect = self.view2.frame;
    rect.origin.y = view1.frame.origin.y + view1.frame.size.height;
    NSLog(@"%@",NSStringFromCGRect(rect));
    self.view2.frame = rect;
    [self.view addSubview: self.view2];
    
    Owner *owner = [Owner new];
    [[NSBundle mainBundle]loadNibNamed:@"View3" owner:owner options:nil];
    rect = owner.view.frame;
    rect.origin.y += _view2.frame.origin.y + _view2.frame.size.height;
    owner.view.frame = rect;
    [self.view addSubview:owner.view];
    
    UIView *view4  = [UIView loadFromNibNamed:@"View4"];
    rect = view4.frame;
    rect.origin.y = owner.view.frame.origin.y + owner.view.frame.size.height;
    view4.frame = rect;
    [self.view addSubview:view4];
    
    View5 *view5 = [View5 loadFromNib];
    rect = view5.frame;
    rect.origin.y = view4.frame.origin.y + view4.frame.size.height;
    view5.frame = rect;
    [self.view addSubview:view5];
    
    UIView *view6 = [[UIViewController alloc]initWithNibName:@"View6" bundle:nil].view;
    rect = view6.frame;
    rect.origin.y = view5.frame.origin.y + view5.frame.size.height;
    view6.frame = rect;
    [self.view addSubview:view6];
    // Do any additional setup after loading the view.
    
    UIApplication *app = [UIApplication sharedApplication];
    app.networkActivityIndicatorVisible = YES;
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
-(BOOL)prefersStatusBarHidden{
    return NO;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
