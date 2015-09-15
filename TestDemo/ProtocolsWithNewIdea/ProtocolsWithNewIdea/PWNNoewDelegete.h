//
//  PWNNoewDelegete.h
//  ProtocolsWithNewIdea
//
//  Created by lq on 15/9/8.
//  Copyright (c) 2015年 lq. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol PWNNoewProtocols <NSObject>
//@property (nonatomic, weak)id <PWNNoewDelegete> delegate;
- (void) showDetailTest;
@end


@protocol PWNNoewDelegete <NSObject>
-(void) setDetailTest:(id <PWNNoewProtocols>) pares;
@end
