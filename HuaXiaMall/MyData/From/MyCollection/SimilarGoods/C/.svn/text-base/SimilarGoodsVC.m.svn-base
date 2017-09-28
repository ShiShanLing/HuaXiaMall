

//
//  SimilarGoodsVC.m
//  EntityConvenient
//
//  Created by 石山岭 on 2017/1/10.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "SimilarGoodsVC.h"
#import "GoodsRecCViewCell.h"

@interface SimilarGoodsVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching>

@property (nonatomic, strong)UICollectionView *collectionView;

@end

@implementation SimilarGoodsVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title  =@"商品";
    UIImage *returnimage = [UIImage imageNamed:@"return_black"];
    returnimage = [returnimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:returnimage style:UIBarButtonItemStylePlain target:self action:@selector(handleReturn)];//自定义导航条按钮
    self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
    
    
    //集合视图布局及创建
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 3;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, kScreen_heigth) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    [self.collectionView registerClass:[GoodsRecCViewCell class] forCellWithReuseIdentifier:@"GoodsRecCViewCell"];
    
}
- (void)handleReturn {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 10;
}
#pragma mark -- cell编辑
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
        GoodsRecCViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsRecCViewCell" forIndexPath:indexPath];
    return cell;
    
}
//cell单击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}
//返回每个cell的布局左右上下间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
        return  UIEdgeInsetsMake(0 , 0, 0, 0);
}
//返回cell的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
   
        return CGSizeMake((kScreen_widht-3)/2, kFit(259));
}

@end
