//
//  RootNavigationController.m
//  WenWeiBoTest
//
//  Created by wgl7569 on 15-1-30.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "RootNavigationController.h"
#import "UIBarButtonItem+Extension.h"
@interface RootNavigationController ()


@end

@implementation RootNavigationController
+(void)initialize
{
    [self setupNavigationBarTheme];
    [self setupBarButtonTheme];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBackgroundColor:[UIColor orangeColor]];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    // Dispose of any resources that can be recreated.
}
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count > 0){
        viewController.hidesBottomBarWhenPushed = YES;
        viewController.navigationItem.leftBarButtonItem = [UIBarButtonItem initWithImage:@"back.png" withHighImage:@"back.png" withTarget:self withAction:@selector(back)];
        viewController.navigationItem.rightBarButtonItem = [UIBarButtonItem initWithImage:@"home_icon.png" withHighImage:@"home_icon.png" withTarget:self withAction:@selector(more)];
    }
    [super pushViewController:viewController animated:animated];
    
}
+(void)setupNavigationBarTheme
{
    UINavigationBar *appearance = [UINavigationBar appearance];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSForegroundColorAttributeName] = [UIColor grayColor];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [appearance setTitleTextAttributes:textAttrs];

}
+(void)setupBarButtonTheme{
    UIBarButtonItem *appance = [UIBarButtonItem appearance];
    NSMutableDictionary *textAttrs = [NSMutableDictionary dictionary];
    textAttrs[NSFontAttributeName] = [UIFont systemFontOfSize:15];
    textAttrs[NSForegroundColorAttributeName] = [UIColor greenColor];
    [appance setTitleTextAttributes:textAttrs forState:UIControlStateNormal];
    NSMutableDictionary *highTextAttrs = [NSMutableDictionary dictionaryWithDictionary:textAttrs];
    highTextAttrs[NSForegroundColorAttributeName] = [UIColor orangeColor];
    [appance setTitleTextAttributes:highTextAttrs forState:UIControlStateHighlighted];
}
-(void)back
{
    [self popViewControllerAnimated:YES];
}
-(void)more
{
    [self popToRootViewControllerAnimated:YES];
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
