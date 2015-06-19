//
//  ProgressView.h
//  Leqian
//
//  Created by 姜耀鹏 on 14/12/23.
//  Copyright (c) 2014年 姜耀鹏. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIProgressView

@property (nonatomic, strong)UIView *iView;

- (void)starViewAddWithNumber:(float)number;

@end
