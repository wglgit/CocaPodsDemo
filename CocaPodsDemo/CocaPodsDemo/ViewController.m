//
//  ViewController.m
//  CocaPodsDemo
//
//  Created by wgl7569 on 2015/5/22.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
#import "ViewController.h"

@interface ViewController (){
    UICollectionView *collectionview;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    WS(ws);
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
    
    collectionview = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
    [collectionview registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    [collectionview registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView"];
    [collectionview registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"headView"];
    collectionview.delegate = self;
    collectionview.dataSource = self;
    [self.view addSubview:collectionview];
    [collectionview mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(ws.view);
        make.edges.equalTo(ws.view).with.insets(UIEdgeInsetsMake(40, 0, 0, 0));
    }];
//    NSMutableString *string = [NSMutableString stringWithString: @"origion"];
////    NSString *stringCopy = [string copy];
//    NSMutableString *mStringCopy = [string copy];
//    NSMutableString *stringMCopy = [string mutableCopy];
////    [mStringCopy appendString:@"mm"];//error
//    [string appendString:@" origion!"];
//    [stringMCopy appendString:@"!!"];

//    LiveView *liveView = [[LiveView alloc]initWithFrame:self.view.bounds];
//    self.view = liveView;
    
//    WS(ws);
//    UIView *sv = [UIView new];
//    sv.backgroundColor = [UIColor blackColor];
//    [self.view addSubview:sv];
//    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(ws.view);
//        make.size.mas_equalTo(CGSizeMake(300, 300));
//    }];
    
    
    
//    UIView *sv1 = [UIView new];
//    sv1.backgroundColor = [UIColor redColor];
//    [sv addSubview:sv1];
//    [sv1 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(sv).width.insets(UIEdgeInsetsMake(10, 10, 10, 10));
//    }];
    
//    UIView *sv2 = [UIView new];
//    UIView *sv3 = [UIView new];
//
//    sv2.backgroundColor = [UIColor redColor];
//    sv3.backgroundColor = [UIColor redColor];
//
//    [sv addSubview:sv2];
//    [sv addSubview:sv3];
//    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(sv.mas_centerY);
//        make.left.equalTo(sv.mas_left).with.offset(10);
//        make.right.equalTo(sv3.mas_left).with.offset(-10);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(sv3);
//    }];
//    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.equalTo(sv.mas_centerY);
//        make.left.equalTo(sv2.mas_right).with.offset(10);
//        make.right.equalTo(sv.mas_right).with.offset(-10);
//        make.height.mas_equalTo(@150);
//        make.width.mas_equalTo(sv2);
//    }];
    
//    UIScrollView *scrollView  = [UIScrollView new];
//    scrollView.backgroundColor  = [UIColor whiteColor];
//    [sv addSubview:scrollView];
//    [scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(5, 6, 6, 6));
//    }];
//    UIView *container = [UIView new];
////    container.backgroundColor = [UIColor greenColor];
//    [scrollView addSubview:container];
//    [container mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.edges.equalTo(scrollView);
//        make.width.equalTo(scrollView);
//    }];
//    int count = 10;
//    UIView *listView  = nil;
//    for (int i = 0; i < count ;i++){
//        UIView *subView = [UIView new];
//        [container addSubview:subView];
//        subView.backgroundColor = [UIColor colorWithHue:( arc4random() % 256 / 256.0 )
//                                          saturation:( arc4random() % 128 / 256.0 ) + 0.5
//                                          brightness:( arc4random() % 128 / 256.0 ) + 0.5
//                                               alpha:1];
//        [subView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.left.and.right.equalTo(container);
//            make.height.equalTo(@(20*i));
//            if (listView){
//                make.top.equalTo(listView.mas_bottom);
//            }
//            else{
//                make.top.equalTo(container.mas_top);
//            }
//
//        }];
//        listView = subView;
//        
//    }
//    [container mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.bottom.equalTo(listView.mas_bottom);
//    }];
//    
//    [sv2 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(sv.mas_centerY);
//        make.left.equalTo(sv.mas_left).with.offset(padding1);
//        make.right.equalTo(sv3.mas_left).with.offset(-padding1);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(sv3);
//    }];
//    
//    [sv3 mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(sv.mas_centerY);
//        make.left.equalTo(sv2.mas_right).with.offset(padding1);
//        make.right.equalTo(sv.mas_right).with.offset(-padding1);
//        make.height.mas_equalTo(@150);
//        make.width.equalTo(sv2);
//    }];
    
    
    
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{
    return CGSizeMake(240, 25);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section{
    return CGSizeMake(100, 25);
}
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    UICollectionReusableView *headView;
    if ([kind isEqual:UICollectionElementKindSectionHeader]){
        headView = [collectionview dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"headView" forIndexPath:indexPath];
        [headView setBackgroundColor:[UIColor blackColor]];
    }
    else if ([kind isEqual:UICollectionElementKindSectionFooter]){
        headView = [collectionview dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"headView" forIndexPath:indexPath];
        [headView setBackgroundColor:[UIColor brownColor]];
    }
    return headView;
}
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 32;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 2;
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellName = @"cell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellName forIndexPath:indexPath];
    if (indexPath.section == 0){
        [cell setBackgroundColor:[UIColor orangeColor]];
    }else{
        [cell setBackgroundColor:[UIColor greenColor]];
    }
    UILongPressGestureRecognizer *lpg = [[UILongPressGestureRecognizer alloc]init];
    [lpg addTarget:self action:@selector(longPress:)];
    [cell addGestureRecognizer:lpg];
    return cell;
}
- (void)longPress:(id)sender{
    UICollectionViewCell *cell = (UICollectionViewCell *)[collectionview cellForItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
    cell.hidden = YES;
}
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if(indexPath.section == 0 && indexPath.row == 1){
        return CGSizeMake(50, 50);
    }
    return CGSizeMake(120, 200);
}
-(CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayou minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 0){
        return 0;
    }
    return 0;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    if (section == 0){
        return 10.0f;
    }
    return 20.0f;
}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    if (section == 0){
        return UIEdgeInsetsMake(53, 25, 15, 25);
    }
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
}
- (void)collectionView:(UICollectionView *)collectionView didHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell  = [collectionview cellForItemAtIndexPath:indexPath];
    [cell setBackgroundColor:[UIColor purpleColor]];

}
- (void)collectionView:(UICollectionView *)colView  didUnhighlightItemAtIndexPath:(NSIndexPath *)indexPath
{
//    UICollectionViewCell* cell = [colView cellForItemAtIndexPath:indexPath];
//    
//    [cell setBackgroundColor:[UIColor yellowColor]];
}

- (void)collectionView:(UICollectionView *)collectionView didDeselectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath{
    return YES;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
