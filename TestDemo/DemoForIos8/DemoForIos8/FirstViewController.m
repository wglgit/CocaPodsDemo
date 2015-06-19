//
//  FirstViewController.m
//  DemoForIos8
//
//  Created by wgl7569 on 14-11-20.
//  Copyright (c) 2014年 wgl7569. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *array = [NSMutableArray arrayWithObjects:@"2", nil];
    [self addDict:&array];
    NSLog(@"%@",array);
    // Do any additional setup after loading the view.
}
-(void)addDict:(NSMutableArray **)array
{
    [*array addObject:@"2"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(IBAction)nextBtnAction:(id)sender{
    UIStoryboard *storyBoare = [UIStoryboard storyboardWithName:@"Storyboard" bundle:nil];
    UIViewController *secondView = [storyBoare instantiateViewControllerWithIdentifier:@"SecondViewController"];
    [self.navigationController pushViewController:secondView animated:YES];
    
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
