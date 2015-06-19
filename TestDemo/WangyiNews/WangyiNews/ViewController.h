//
//  ViewController.h
//  WangyiNews
//
//  Created by iHope on 14-1-10.
//  Copyright (c) 2014年 任海丽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsCell.h"
#import "CoreDateManager.h"
@interface ViewController : UIViewController
{
    
    IBOutlet UITableView *newsTableView;
    CoreDateManager *coreManager;
}
@property (nonatomic, strong) NSMutableArray *resultArray;

@end
