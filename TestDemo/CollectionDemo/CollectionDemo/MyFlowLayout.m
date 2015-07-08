//
//  MyFlowLayout.m
//  CollectionDemo
//
//  Created by wgl7569 on 15-6-19.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "MyFlowLayout.h"

@implementation MyFlowLayout
- (id<MyFlowLayoutDelegate>)delegate {
    return (id<MyFlowLayoutDelegate>)self.collectionView.delegate;
}
- (id)init{
    if (self = [super init]){
        _scrollingTriggerEdgeInsets = UIEdgeInsetsMake(50.0f, 50.0f, 50.0f, 50.0f);
        [self addObserver:self forKeyPath:@"collectionView" options:NSKeyValueObservingOptionNew context:nil];
    }
    return self;
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    [self setepCollectionView];
}
-(void)setepCollectionView{
    _longGestureRecongnizer = [[UILongPressGestureRecognizer alloc]initWithTarget:self action:@selector(longPressAction:)];
    _longGestureRecongnizer.delegate = self;
    for (UIGestureRecognizer *gestureRecognizer in self.collectionView.gestureRecognizers){
        if ([gestureRecognizer isEqual:[UILongPressGestureRecognizer class]]){
            [gestureRecognizer requireGestureRecognizerToFail:_longGestureRecongnizer];
        }
    }
    [self.collectionView addGestureRecognizer:_longGestureRecongnizer];
    _panGestureRecongnizer = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGestureRecognizerAciont:)];
    _panGestureRecongnizer.delegate = self;
    [self.collectionView addGestureRecognizer:_panGestureRecongnizer];
    
}
-(void)longPressAction:(id)sender{
    UILongPressGestureRecognizer *longGesture = (UILongPressGestureRecognizer *)sender;
    switch (longGesture.state) {
        case UIGestureRecognizerStateBegan:
        {
            NSIndexPath *currentIndexPath = [self.collectionView indexPathForItemAtPoint:[longGesture locationInView:self.collectionView]];
            self.selectIndexPath = currentIndexPath;
            UICollectionViewCell *collectionCell = [self.collectionView cellForItemAtIndexPath:currentIndexPath];
            self.currentView = [[UIView alloc]initWithFrame:collectionCell.frame];
            collectionCell.highlighted = YES;
            UIImageView *hightLightImage = [[UIImageView alloc]initWithImage:[(MyCollectionViewCell *)collectionCell copyCellImage]];
            hightLightImage.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
            hightLightImage.alpha = 1.0f;
            collectionCell.highlighted = NO;
            UIImageView *imageView = [[UIImageView alloc]initWithImage:[(MyCollectionViewCell *)collectionCell copyCellImage]];
            imageView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
            imageView.alpha = 0.0f;
            
            [self.currentView addSubview:imageView];
            [self.currentView addSubview:hightLightImage];
            [self.collectionView addSubview:self.currentView];
            
            self.currentViewCenter = self.currentView.center;
            __weak typeof(self) wSelf = self;
            [UIView animateWithDuration:.3 delay:.0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                wSelf.currentView.transform = CGAffineTransformMakeScale(1.1f, 1.1f);
                hightLightImage.alpha = 0.0f;
                imageView.alpha = 1.0f;
            } completion:^(BOOL finished) {
                [hightLightImage removeFromSuperview];
                
            }];
            NSLog(@"%s",__FUNCTION__);
            [self invalidateLayout];
        }
            break;
        case UIGestureRecognizerStateCancelled:
        case UIGestureRecognizerStateEnded:{
            NSIndexPath *currentIndexpath = self.selectIndexPath;
            if (currentIndexpath){
                self.selectIndexPath = nil;
                self.currentViewCenter = CGPointZero;
                UICollectionViewLayoutAttributes *layoutAttributes = [self layoutAttributesForItemAtIndexPath:currentIndexpath];
                __weak typeof(self) wSelf = self;
                [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
                    wSelf.currentView.transform = CGAffineTransformMakeScale(1.0, 1.0);
                    wSelf.currentView.center = layoutAttributes.center;
                    
                } completion:^(BOOL finished) {
                    [wSelf.currentView removeFromSuperview];
                    wSelf.currentView = nil;
                    [wSelf invalidateLayout];
                }];
            }
        }
            break;
        default:
            break;
    }
}
- (void)invalidateLayoutIfNecessary{
    NSIndexPath *newIndexPath = [self.collectionView indexPathForItemAtPoint:self.currentView.center];
    NSIndexPath *previousIndexPath = self.selectIndexPath;
    if ((newIndexPath == nil)||[newIndexPath isEqual:previousIndexPath]){
        return;
    }
    self.selectIndexPath = newIndexPath;
    __weak typeof(self) wSelf = self;
    [self.collectionView performBatchUpdates:^{
        [wSelf.collectionView deleteItemsAtIndexPaths:@[ previousIndexPath ]];
        [wSelf.collectionView insertItemsAtIndexPaths:@[ newIndexPath ]];
    } completion:^(BOOL finished) {
        
    }];
}
-(void)panGestureRecognizerAciont:(id)sender{
    UIPanGestureRecognizer *panGesture = (UIPanGestureRecognizer *)sender;
    switch (panGesture.state) {
        case UIGestureRecognizerStateBegan:
        case UIGestureRecognizerStateChanged:{
            self.panTranslationInCollectionView = [panGesture translationInView:self.collectionView];
            CGPoint viewCenter = self.currentView.center = CGPointMake(self.currentViewCenter.x + self.panTranslationInCollectionView.x, self.currentViewCenter.y + self.panTranslationInCollectionView.y);
            [self invalidateLayoutIfNecessary];
//            switch (self.scrollDirection) {
//                case UICollectionViewScrollDirectionVertical:
//                    if (viewCenter.y < (CGRectGetMaxY(self.collectionView.bounds) - self.scrollingTriggerEdgeInsets.top)){
//                        
//                    }
//                    break;
//                    
//                default:
//                    break;
//            }
            
        }
            break;
            
        default:
            break;
    }
}
- (void)invalidatesScrollTimer {
    if (!self.displayLink.paused) {
        [self.displayLink invalidate];
    }
    self.displayLink = nil;
}
- (void)setupScrollTimerInDirection:(LXScrollingDirection)direction{
    if (!self.displayLink.paused){
        LXScrollingDirection oldDirection = [self.displayLink.LX_userInfo[kLXScrollingDirectionKey]integerValue];
        if (direction == oldDirection){
            return;
        }
    }
    [self invalidatesScrollTimer];
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(handleScroll:)];
    self.displayLink.LX_userInfo = @{kLXScrollingDirectionKey:@(direction)};
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    
}
- (void)handleScroll:(CADisplayLink *)displayLink{
    
}
-(void)prepareLayout{
    [super prepareLayout];
    self.minimumLineSpacing = 50;
    self.itemSize = CGSizeMake(100, 140);
    self.sectionInset = UIEdgeInsetsMake(10, 20, 20, 20);
    NSMutableDictionary *aDictionary = [NSMutableDictionary dictionary];
    int sectionCount = (int)[self.collectionView numberOfSections];
    CGFloat y = 0;
    CGFloat availableWith = self.collectionViewContentSize.width - (self.sectionInset.left + self.sectionInset.right);
    int itemAcross = floorf((availableWith + self.minimumInteritemSpacing)/(self.itemSize.width + self.minimumInteritemSpacing));
    for (int section = 0 ; section < sectionCount ; section++ ){
        y += self.headerReferenceSize.height;
        y += self.sectionInset.top;
        int itemCount = (int)[self.collectionView numberOfItemsInSection:section];
        int rows = ceil(itemCount/(float)itemAcross);
        for (int row = 0;row < rows ;row ++){
            y += self.itemSize.height;
            UIOffset adjustment = UIOffsetZero;
            if ([self.delegate respondsToSelector:@selector(collectionView:layout:decorationViewAdjustmentForRow:insection:)]){
                adjustment = [self.delegate collectionView:self.collectionView layout:self decorationViewAdjustmentForRow:row insection:section];
            }
            CGSize bookShelfSize = [self.delegate collectionView:self.collectionView layout:self referenceSizeForDecorationViewForRow:row inSection:section];
            aDictionary[[NSIndexPath indexPathForItem:row inSection:section]] = [NSValue valueWithCGRect:CGRectMake(adjustment.horizontal ,y + adjustment.vertical,bookShelfSize.width,bookShelfSize.height)];
            if (row < rows -1)
                y += self.minimumLineSpacing;
        }
    }
    bookShelfDiction = [NSDictionary dictionaryWithDictionary:aDictionary];
}
-(void)applyLayoutAttributes:(UICollectionViewLayoutAttributes *)layoutAttributes{
    if ([layoutAttributes.indexPath isEqual:self.selectIndexPath]){
        layoutAttributes.hidden = YES;
    }
}
-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect{
    NSArray *array = [super layoutAttributesForElementsInRect:rect];
        NSMutableArray *newArray = [array mutableCopy];
    [array enumerateObjectsUsingBlock:^(UICollectionViewLayoutAttributes *butes, NSUInteger idx, BOOL *stop) {
        switch (butes.representedElementCategory) {
            case UICollectionElementCategoryCell:
                [self applyLayoutAttributes:butes];
                break;
                
            default:
                break;
        }
    }];
    [bookShelfDiction enumerateKeysAndObjectsUsingBlock:^(id key, id shelftRect, BOOL *stop) {
        if (CGRectIntersectsRect([shelftRect CGRectValue], rect)){
            UICollectionViewLayoutAttributes *shelfAttributes = [self layoutAttributesForDecorationViewOfKind:@"bookShelf" atIndexPath:key];
            [newArray addObject:shelfAttributes];
        }
    }];
    return newArray;
}
- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewLayoutAttributes *layoutAttributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    switch (layoutAttributes.representedElementCategory) {
        case UICollectionElementCategoryCell:
                [self applyLayoutAttributes:layoutAttributes];
            break;
        default:
            break;
    }
    return layoutAttributes;
}
-(UICollectionViewLayoutAttributes *)layoutAttributesForDecorationViewOfKind:(NSString *)elementKind atIndexPath:(NSIndexPath *)indexPath{
    id bookShelft = bookShelfDiction[indexPath];
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:elementKind withIndexPath:indexPath];
    attributes.frame = [bookShelft CGRectValue];
    attributes.zIndex = -1;
    return attributes;
}
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer{
    if ([self.panGestureRecongnizer isEqual:gestureRecognizer]){
        return (self.selectIndexPath != nil);
    }
    return YES;
}
-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer{
    if ([self.longGestureRecongnizer isEqual:gestureRecognizer]){
        return [self.panGestureRecongnizer isEqual:otherGestureRecognizer];
    }
    if ([self.panGestureRecongnizer isEqual:gestureRecognizer]){
        return [self.longGestureRecongnizer isEqual:otherGestureRecognizer];
    }
    return NO;
}
@end


