//
//  WWaterFlowView.h
//  瀑布流接口设计
//
//  Created by wgl7569 on 15-2-13.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    WWaterFlowViewMarginTypeTop,
    WWaterFlowViewMarginTypeBottom,
    WWaterFlowViewMarginTypeLeft,
    WWaterFlowViewMarginTypeRight,
    WWaterFlowViewMarginTypeColumn,
    WWaterFlowViewMarginTypeRow
}WWaterflowViewMarginType;

@class WWaterFlowView,WWaterFolwCell;
@protocol WWaterFlowViewDataSource <NSObject>

@required
-(NSInteger)numberOfCellInWaterFlowView:(WWaterFlowView*)waterFlowView;
-(WWaterFolwCell*)waterFlowView :(WWaterFlowView *)waterFlowVeiw cellAtIndex:(NSInteger)index;
@optional
-(NSInteger)numberOfColumnsInWaterFlowView:(WWaterFlowView *)waterFlowView;
@end

@protocol WWaterFlowViewDelegate <NSObject>

@optional
-(CGFloat)waterFlowView:(WWaterFlowView *)waterFlowView heightAtIndex :(NSInteger)index;
-(void)waterFlowView:(WWaterFlowView *)waterFlowVeiw didSelectAtIndex:(NSInteger)index;
-(CGFloat)waterFlowView:(WWaterFlowView *)waterFlowVeiw marginForType:(WWaterflowViewMarginType)type;

@end
@interface WWaterFlowView : UIScrollView
@property (nonatomic ,weak)id<WWaterFlowViewDataSource> wDataSource;
@property (nonatomic ,weak)id<WWaterFlowViewDelegate> wDelegate;
-(void)reloadData;
-(CGFloat)cellWidth;
-(id)dequeueReusableCellWithIdentifier:(NSString *)identifier;
@end
