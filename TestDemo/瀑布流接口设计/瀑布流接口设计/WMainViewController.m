//
//  WMainViewController.m
//  瀑布流接口设计
//
//  Created by wgl7569 on 15-2-13.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "WMainViewController.h"

@interface WMainViewController ()

@end

@implementation WMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    WWaterFlowView *wfv = [[WWaterFlowView alloc]init];
    wfv.frame = self.view.bounds;
    wfv.wDataSource = self;
    wfv.wDelegate =self;
    [self.view addSubview:wfv];
    // Do any additional setup after loading the view.
}
-(NSInteger)numberOfCellInWaterFlowView:(WWaterFlowView *)waterFlowView{
    return 100;
}
-(NSInteger)numberOfColumnsInWaterFlowView:(WWaterFlowView *)waterFlowView{
    return 3;
}
-(WWaterFolwCell *)waterFlowView:(WWaterFlowView *)waterFlowVeiw cellAtIndex:(NSInteger)index{
    static NSString *ID = @"cell";
    WWaterFolwCell *cell = [waterFlowVeiw dequeueReusableCellWithIdentifier:ID];
    if (cell == nil){
        cell = [[WWaterFolwCell alloc]init];
        cell.identifier = ID;
        cell.backgroundColor =YYRandomColor;
        UILabel *label = [[UILabel alloc]init];
        label.tag = 10;
        label.frame = CGRectMake(0, 0, 20, 20);
        [cell addSubview:label];
//        [cell addSubview:[UIButton buttonWithType:UIButtonTypeContactAdd]];
    }
    UILabel *label = (UILabel*)[cell viewWithTag:10];
    label.text = [NSString stringWithFormat:@"%ld",(long)index];
    NSLog(@"%ld_____%p",(long)index,cell);
    return cell;
}


-(CGFloat)waterFlowView:(WWaterFlowView *)waterFlowView heightAtIndex:(NSInteger)index{
    switch (index%3) {
        case 0:
            return 70;
            break;
        case 1:
            return 100;
            break;
        case 2:
            return 80;
            break;
        default:
            return 120;
            break;
    }
}
-(CGFloat)waterFlowView:(WWaterFlowView *)waterFlowVeiw marginForType:(WWaterflowViewMarginType)type{
    switch (type) {
        case WWaterFlowViewMarginTypeTop:
            return 20;
            break;
        case WWaterFlowViewMarginTypeBottom:
        case WWaterFlowViewMarginTypeLeft:
            return 10;
            break;
        case WWaterFlowViewMarginTypeRight:
            return 10;
            break;
        case WWaterFlowViewMarginTypeColumn:
        case WWaterFlowViewMarginTypeRow:
            return 5;
            break;
        default:
            break;
    }
}
-(void)waterFlowView:(WWaterFlowView *)waterFlowVeiw didSelectAtIndex:(NSInteger)index{
    NSLog(@"点击了 %ld",(long)index);
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
