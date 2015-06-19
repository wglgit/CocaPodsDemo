//
//  HomeViewController.m
//  WenWeiBoTest
//
//  Created by wgl7569 on 15-1-29.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTwoViewCtontroller.h"

@interface HomeViewController ()
@property (nonatomic,weak) NSString* str1;
@property (nonatomic,unsafe_unretained) NSString* str2;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    self.str1 = @"11111";
    self.str2 = self.str1;
    self.str1 = nil;
    WLog(@"%p",_str2);
    
    
    
    
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource  = self;
    [self.view addSubview:tableView];
    if([tableView respondsToSelector:@selector(setSeparatorInset:)]){
        [tableView setSeparatorInset:UIEdgeInsetsZero];
    }
   if ([tableView respondsToSelector:@selector(setLayoutMargins:)]){
        [tableView setLayoutMargins:UIEdgeInsetsZero];
    }
       // Do any additional setup after loading the view.
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (!cell){
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.textLabel.text =@"点我";
    }
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    HomeTwoViewCtontroller *vc = [[HomeTwoViewCtontroller alloc]init];
    [self.navigationController pushViewController:vc animated:NO];
    
}
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]){
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
