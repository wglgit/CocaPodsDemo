//
//  WTabBarController.m
//  WenWeiBoTest
//
//  Created by wgl7569 on 15-1-29.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "WTabBarController.h"
#import "MessageViewController.h"
#import "DiscoverViewController.h"
#import "HomeViewController.h"
#import "MeViewController.h"
#import "RootNavigationController.h"

@interface WTabBarController ()

@end

@implementation WTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    HomeViewController *hv = [[HomeViewController alloc]init];
    [self addChildVC:hv withTitle:@"首页" withImage:@"tabbar_home_gray" withSelectImage:@"tabbar_home"];
    MessageViewController *mv = [[MessageViewController alloc]init];
    [self addChildVC:mv withTitle:@"消息" withImage:@"tabbar_financial" withSelectImage:@"tabbar_financial"];
    DiscoverViewController *dv = [[DiscoverViewController alloc]init];
    [self addChildVC:dv withTitle:@"发现" withImage:@"tabbar_loan_gray" withSelectImage:@"tabbar_loan.png"];
    MeViewController *mev = [[MeViewController alloc]init];
    [self addChildVC:mev withTitle:@"我" withImage:@"tabbar_accounts_gray" withSelectImage:@"tabbar_accounts"];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
-(void)addChildVC:(UIViewController*)childVc withTitle:(NSString *)titile withImage:(NSString *)image withSelectImage:(NSString *)selectImage
{
    childVc.view.backgroundColor = WRandomColor;
//    childVc.tabBarItem.title = titile;
//    childVc.navigationItem.title = titile;
    childVc.title =titile;
    childVc.tabBarItem.image = [UIImage imageNamed:image];
    UIImage *selectedImage = [UIImage imageNamed:selectImage];
//    [selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    childVc.tabBarItem.selectedImage  = selectedImage;
    RootNavigationController *rn = [[RootNavigationController alloc]initWithRootViewController:childVc];
    [self addChildViewController:rn];
}
-(BOOL)prefersStatusBarHidden{
    return NO;
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
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
