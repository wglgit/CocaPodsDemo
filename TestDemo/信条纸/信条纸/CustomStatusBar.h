//
//  CustomStatusBar.h
//  信条纸
//
//  Created by lq on 15/8/18.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomStatusBar : UIWindow
{
    UILabel *_statusMsgLabel;
}
- (void)showStatusMessage:(NSString *)message;
-(void)hide;
@end
