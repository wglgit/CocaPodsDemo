//
//  ViewController.m
//  CollectionDemo
//
//  Created by wgl7569 on 15-6-19.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "ViewController.h"
#import "MyFlowLayout.h"
#import "MyCollectionViewCell.h"
#import "MyHeaderView.h"
#import "BookShelf.h"
@interface ViewController ()
{
    UICollectionView *collection;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    MyFlowLayout *flowLayout = [[MyFlowLayout alloc]init];
    [flowLayout registerClass:[BookShelf class] forDecorationViewOfKind:@"bookShelf"];
    collection = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    collection.frame = CGRectMake(0, 20, self.view.bounds.size.width, self.view.bounds.size.height - 20);
    [collection registerClass:[MyCollectionViewCell class] forCellWithReuseIdentifier:@"myCell"];
    [collection registerClass:[MyHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"headerView"];
    [collection registerClass:[MyHeaderView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView"];
        [collection setBackgroundColor:[UIColor clearColor]];
    collection.delegate = self;
    collection.dataSource = self;
    [self.view addSubview:collection];
    // Do any additional setup after loading the view, typically from a nib.
}
-(CGFloat)widthForSection:(NSInteger)section{
    UICollectionViewFlowLayout *layout = (id)collection.collectionViewLayout;
    CGFloat availableWith = layout.collectionViewContentSize.width - (layout.sectionInset.left + layout.sectionInset.right);
    int itemsAcross = floorf((availableWith +layout.minimumInteritemSpacing)/(layout.itemSize.width + layout.minimumInteritemSpacing));
    int itemCount = (int)[layout.collectionView numberOfItemsInSection:section];
    int rows = ceil(itemCount / (float)itemsAcross);
    CGFloat itemsInRow = ceil((double)itemCount/rows);
    return itemsInRow *(layout.itemSize.width + layout.minimumInteritemSpacing )+ (layout.sectionInset.right +layout.sectionInset.left);
    
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(MyFlowLayout *)collectionViewLayout referenceSizeForDecorationViewForRow:(NSInteger)row inSection:(NSInteger)section{
    if (section == 0){
        return CGSizeMake([self widthForSection:section], 100);
    }else{
        return CGSizeMake(collectionViewLayout.collectionViewContentSize.width, 113);
    }
}
-(UIOffset)collectionView:(UICollectionView *)collectionView layout:(MyFlowLayout *)collectionViewLayout decorationViewAdjustmentForRow:(NSInteger)row insection:(NSInteger)section{
    return UIOffsetMake(0, -30);
}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
//    return CGSizeMake(240, 25);
//}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    return CGSizeMake(240, 25);
//}
//-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    MyHeaderView *headerView;
//    if ([kind isEqualToString:UICollectionElementKindSectionHeader]){
//        headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headerView" forIndexPath:indexPath];
//        [headerView setLabelText:@"头"];
//    }
//    else if ([kind isEqualToString:UICollectionElementKindSectionFooter]){
//        headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"headerView" forIndexPath:indexPath];
//        [headerView setLabelText:@"足"];
//    }
//    return headerView;
//}
//-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section  == 0){
//        return CGSizeMake(55, 55);
//    }
//    else{
//        return CGSizeMake(75, 35);
//    }
//}
//-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
//    if (section == 0){
//        return UIEdgeInsetsMake(20, 15, 15, 25);
//    }
//    else{
//        return UIEdgeInsetsMake(15, 15, 15, 15);
//    }
//}
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
//    if (section == 0){
//        return 10.0f;
//    }
//    else{
//        return 20.0f;
//    }
//}
//-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
//    if (section == 0){
//        return 10.0f;
//    }
//    else{
//        return 20.0f;
//    }
//}
//-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    [collectionView deleteItemsAtIndexPaths:[NSArray arrayWithObject:indexPath]];
//}
// section 数
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//每个section 中 cell 数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 20;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"myCell" forIndexPath:indexPath];
    if (indexPath.section == 0){
//        cell.backgroundColor = [UIColor redColor];
    }
    if (indexPath.section == 1){
        cell.backgroundColor = [UIColor orangeColor];
    }
//    UIView *selectBGView = [[UIView alloc]init];
//    selectBGView.frame = cell.bounds;
//    selectBGView.backgroundColor = [UIColor blueColor];
//    cell.selectedBackgroundView = selectBGView;
    return cell;
}
-(BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
-(void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    [cell setBackgroundColor:[UIColor purpleColor]];
}
-(void)collectionView:(UICollectionView *)collectionView didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath{
//    MyCollectionViewCell *cell = (MyCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    [cell setBackgroundColor:[UIColor yellowColor]];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
