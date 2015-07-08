//
//  MyFlowLayout.h
//  CollectionDemo
//
//  Created by wgl7569 on 15-6-19.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCollectionViewCell.h"
#import <objc/runtime.h>
typedef NS_ENUM(NSInteger, LXScrollingDirection) {
    LXScrollingDirectionUnknown = 0,
    LXScrollingDirectionUp,
    LXScrollingDirectionDown,
    LXScrollingDirectionLeft,
    LXScrollingDirectionRight
};
@class MyFlowLayout;
@protocol MyFlowLayoutDelegate <UICollectionViewDelegateFlowLayout>
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(MyFlowLayout *)collectionViewLayout referenceSizeForDecorationViewForRow:(NSInteger)row inSection:(NSInteger)section;
-(UIOffset)collectionView:(UICollectionView *)collectionView layout:(MyFlowLayout *)collectionViewLayout decorationViewAdjustmentForRow:(NSInteger)row insection :(NSInteger)section;
@end
@interface MyFlowLayout : UICollectionViewFlowLayout <UIGestureRecognizerDelegate>
{
    NSDictionary* bookShelfDiction;
}
@property (nonatomic , strong) UIPanGestureRecognizer *panGestureRecongnizer;
@property (nonatomic , strong) UILongPressGestureRecognizer *longGestureRecongnizer;
@property (nonatomic , strong) NSIndexPath *selectIndexPath;
@property (nonatomic , strong) UIView *currentView;
@property (nonatomic , assign) CGPoint currentViewCenter;
@property (assign, nonatomic) CGPoint panTranslationInCollectionView;
@property (assign, nonatomic) UIEdgeInsets scrollingTriggerEdgeInsets;
@property (strong, nonatomic) CADisplayLink *displayLink;
@property (nonatomic ,weak)id <MyFlowLayoutDelegate>delegate;
@end
static NSString * const kLXScrollingDirectionKey = @"LXScrollingDirection";
static NSString * const kLXCollectionViewKeyPath = @"collectionView";
@interface CADisplayLink (LX_userInfo)
@property (nonatomic, copy) NSDictionary *LX_userInfo;
@end

@implementation CADisplayLink (LX_userInfo)
- (void) setLX_userInfo:(NSDictionary *) LX_userInfo {
    objc_setAssociatedObject(self, "LX_userInfo", LX_userInfo, OBJC_ASSOCIATION_COPY);
}

- (NSDictionary *) LX_userInfo {
    return objc_getAssociatedObject(self, "LX_userInfo");
}
@end
