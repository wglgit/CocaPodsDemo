//
//  WMainViewController.h
//  瀑布流接口设计
//
//  Created by wgl7569 on 15-2-13.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WWaterFlowView.h"
#import "WWaterFolwCell.h"

@interface WMainViewController : UIViewController<WWaterFlowViewDelegate,WWaterFlowViewDataSource>
@end
