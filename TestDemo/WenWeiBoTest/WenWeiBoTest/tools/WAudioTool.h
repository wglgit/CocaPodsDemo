//
//  WAudioTool.h
//  WenWeiBoTest
//
//  Created by wgl7569 on 15-2-10.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Singleton.h"
@interface WAudioTool : NSObject
singleton_h(WAudioTool)
@property (nonatomic , unsafe_unretained)NSMutableDictionary *musics;
@end
