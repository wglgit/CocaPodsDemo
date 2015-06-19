//
//  DiscoverViewController.m
//  WenWeiBoTest
//
//  Created by wgl7569 on 15-1-29.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "DiscoverViewController.h"

@interface DiscoverViewController ()

@end

@implementation DiscoverViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    WTextField *w = [WTextField SearchBar];
    w.frame =CGRectMake(0, 100, 300, 35);
    self.navigationItem.titleView = w;
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
