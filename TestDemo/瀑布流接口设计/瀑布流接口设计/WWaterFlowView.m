//
//  WWaterFlowView.m
//  瀑布流接口设计
//
//  Created by wgl7569 on 15-2-13.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "WWaterFlowView.h"
#import "WWaterFolwCell.h"
#define WWaterFlowViewDefaultNumberOfClunms 3
#define WWaterFlowViewDefaultCellH 100
#define WWaterFlowViewDefaultMargin 10;
@interface WWaterFlowView ()
@property(nonatomic,strong)NSMutableArray *cellFrames;
@property (nonatomic, strong)NSMutableDictionary *displayingCells;
@property (nonatomic, strong)NSMutableSet *reusableCells;
@end
@implementation WWaterFlowView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(NSMutableArray *)cellFrames{
    if (_cellFrames == nil){
        _cellFrames = [NSMutableArray array];
    }
    return _cellFrames;
}
-(NSMutableDictionary *)displayingCells
{
    if (_displayingCells==nil) {
        _displayingCells=[NSMutableDictionary dictionary];
    }
    return _displayingCells;
}

-(NSMutableSet *)reusableCells
{
    if (_reusableCells==nil) {
        _reusableCells=[NSMutableSet set];
    }
    return _reusableCells;
}

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self){
        
    }
    return self;
}
-(void)willMoveToSuperview:(UIView *)newSuperview{
    [self reloadData];
}
-(void)reloadData{
    NSInteger numberOfCells = [self.wDataSource numberOfCellInWaterFlowView:self];
    NSInteger numberOfColumns = [self.wDataSource numberOfColumnsInWaterFlowView:self];
    CGFloat leftM = [self marginForType:WWaterFlowViewMarginTypeLeft];
    CGFloat columnM  = [self marginForType:WWaterFlowViewMarginTypeColumn];
//    CGFloat rightM = [self marginForType:WWaterFlowViewMarginTypeRight];
    CGFloat topM = [self marginForType:WWaterFlowViewMarginTypeTop];
    CGFloat bottomM = [self marginForType:WWaterFlowViewMarginTypeBottom];
    CGFloat rowM = [self marginForType:WWaterFlowViewMarginTypeRow];
//
//    CGFloat cellW = (self.frame.size.width - leftM -rightM - (numberOfColumns -1)*columnM)/numberOfColumns;
    CGFloat cellW = [self cellWidth];
    CGFloat maxYOfColumns[numberOfColumns];
    for (int i =0;i<numberOfColumns;i++){
        maxYOfColumns[i] = 0.0;
    }
    
    
    for (int i=0;i<numberOfCells;i++){
        CGFloat cellH = [self heightAtIndex:i];
        
        NSInteger cellAtColumn = 0;
        CGFloat maxYOfCellAtColumn = maxYOfColumns[cellAtColumn];
        
        for (int j=0;j<numberOfColumns;j++){
            if (maxYOfColumns[j] < maxYOfCellAtColumn){
                cellAtColumn = j;
                maxYOfCellAtColumn = maxYOfColumns[j];
            }
        }
        
        CGFloat cellX = leftM + cellAtColumn *(cellW +columnM);
        
        CGFloat cellY = 0;
        if (maxYOfCellAtColumn == 0.0){
            cellY =topM;
        }else{
            cellY = maxYOfCellAtColumn + rowM;
        }
        
        CGRect cellFrame = CGRectMake(cellX, cellY, cellW, cellH);
        [self.cellFrames addObject:[NSValue valueWithCGRect:cellFrame]];
        
        maxYOfColumns [cellAtColumn] = CGRectGetMaxY(cellFrame);
        
        
//        WWaterFolwCell *cell = [self.wDataSource waterFlowView:self cellAtIndex:i];
//        cell.frame = cellFrame;
//        [self addSubview:cell];
    }
    CGFloat contentH = maxYOfColumns[0];
    for (int i=1;i<numberOfColumns;i++){
        if (maxYOfColumns[i]>contentH){
            contentH = maxYOfColumns[i];
        }
    }
    contentH += bottomM;
    self.contentSize = CGSizeMake(0, contentH);
}
-(void)layoutSubviews{
    [super layoutSubviews];
    NSInteger numberOfCells = self.cellFrames.count;
    for (int i=0 ;i<numberOfCells; i++){
        CGRect cellFrame = [self.cellFrames[i] CGRectValue];
        WWaterFolwCell *cell = self.displayingCells[@(i)];
        if ([self isInScreen:cellFrame]){
            if (cell == nil){
                cell = [self.wDataSource waterFlowView:self cellAtIndex:i];
                cell.frame = cellFrame;
                [self addSubview:cell];
                self.displayingCells[@(i)] = cell;
            }
        }else{
            if (cell){
                [cell removeFromSuperview];
                [self.displayingCells removeObjectForKey:@(i)];
                [self.reusableCells addObject:cell];
            }
        }
    }
     NSLog(@"%lu",(unsigned long)self.subviews.count);
}
-(id)dequeueReusableCellWithIdentifier:(NSString *)identifier{
    __block WWaterFolwCell *resableCell = nil;
    [self.reusableCells enumerateObjectsUsingBlock:^(WWaterFolwCell *cell, BOOL *stop) {
        if([cell.identifier isEqualToString:identifier]){
            resableCell = cell;
            *stop = YES;
        }
    }];
    if (resableCell){
        [self.reusableCells removeObject:resableCell];
    }
    return resableCell;
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    if ([self.wDelegate respondsToSelector:@selector(waterFlowView:didSelectAtIndex:)]){
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
        __block NSNumber *selectIndex = nil;
        [self.displayingCells enumerateKeysAndObjectsUsingBlock:^(id key, WWaterFolwCell *cell, BOOL *stop) {
            if (CGRectContainsPoint(cell.frame, point)){
                selectIndex = key;
                *stop = YES;
            }
        }];
        if (selectIndex){
            [self.wDelegate waterFlowView:self  didSelectAtIndex:selectIndex.unsignedIntegerValue];
        }
    }
}
-(BOOL)isInScreen:(CGRect)frame
{
    return (CGRectGetMaxY(frame)>self.contentOffset.y&&CGRectGetMaxY(frame)<self.contentOffset.y+self.frame.size.height);
}
-(CGFloat)cellWidth{
    int numberOfColumns = (int)[self numberOfColumns];
    CGFloat leftM = [self marginForType:WWaterFlowViewMarginTypeLeft];
    CGFloat rightM = [self marginForType:WWaterFlowViewMarginTypeRight];
    CGFloat columnM = [self marginForType:WWaterFlowViewMarginTypeColumn];
    return (self.frame.size.width-leftM-rightM-(numberOfColumns-1)*columnM)/numberOfColumns;
}
-(CGFloat)marginForType:(WWaterflowViewMarginType)type{
    if ([self.wDelegate respondsToSelector:@selector(waterFlowView:marginForType:)]){
        return [self.wDelegate waterFlowView:self marginForType:type];
    }else{
        return WWaterFlowViewDefaultMargin;
    }
}
-(CGFloat)heightAtIndex:(NSInteger)index{
    if ([self.wDelegate respondsToSelector:@selector(waterFlowView:heightAtIndex:)]){
        return [self.wDelegate waterFlowView:self heightAtIndex:index];
    }
    else{
        return WWaterFlowViewDefaultCellH;
    }
}
-(NSInteger)numberOfColumns{
    if ([self.wDataSource respondsToSelector:@selector(numberOfColumnsInWaterFlowView:)]){
        return [self.wDataSource numberOfColumnsInWaterFlowView:self];
    }
    return WWaterFlowViewDefaultNumberOfClunms;
}
@end
