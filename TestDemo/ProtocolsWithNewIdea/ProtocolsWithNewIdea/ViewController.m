//
//  ViewController.m
//  ProtocolsWithNewIdea
//
//  Created by lq on 15/9/8.
//  Copyright (c) 2015年 lq. All rights reserved.
//

#import "ViewController.h"
extern NSString *golbstr;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%@",golbstr);
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setDetailTest:(id<PWNNoewProtocols>)pares{
    [pares showDetailTest];
}
@end
