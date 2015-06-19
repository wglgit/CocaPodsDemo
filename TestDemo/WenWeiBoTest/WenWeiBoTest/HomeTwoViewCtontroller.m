//
//  HomeTwoViewCtontroller.m
//  WenWeiBoTest
//
//  Created by wgl7569 on 15-2-2.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "HomeTwoViewCtontroller.h"
#import "HomeThreeViewController.h"

@interface HomeTwoViewCtontroller ()

@end

@implementation HomeTwoViewCtontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"设置" style:UIBarButtonItemStyleDone target:self action:nil];
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [btn setTitle:@"jump" forState:UIControlStateNormal];
    btn.frame = CGRectMake(0, 100, 40, 20);
    btn.center = self.view.center;
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
    // Dispose of any resources that can be recreated.
}
-(void)btnAction
{
    HomeThreeViewController *htv = [[HomeThreeViewController alloc]init];
    htv.title = @"three";
    [self.navigationController pushViewController:htv animated:YES];
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
