//
//  RelatedVideoVC.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/27.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "RelatedVideoVC.h"
#import "SimilarVideoCourseCVCell.h"
#import "ClassificationView.h"
@interface RelatedVideoVC ()<ClassificationViewDelegate, UICollectionViewDataSourcePrefetching, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>

/**
 *店铺所有商品tableView;
 */
@property (nonatomic, strong)UICollectionView *AllGoodsCView;
/**
 *商品分类
 */
@property (nonatomic, strong)ClassificationView *classificationView;

@end

@implementation RelatedVideoVC
- (void)viewWillAppear:(BOOL)animated  {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(self.view.frame.size.width, 64)] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}
- (NSString *)description {
    return @"同类视频";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAllGoodsView];

    self.view.backgroundColor = MColor(242, 242, 242);
}

- (void)setAllGoodsView {
    
    self.classificationView = [[ClassificationView alloc] init];
    _classificationView.delegate = self;
    [self.view addSubview:_classificationView];
    _classificationView.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view,0).heightIs(43).widthIs(kScreen_widht);
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //添加页眉
    layout.minimumInteritemSpacing = 3;
    layout.minimumLineSpacing = 3;
    self.AllGoodsCView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(self.classificationView.frame), kScreen_widht, kScreen_heigth-43-64-40.5)collectionViewLayout:layout];//43是规格选择view 40.5是分页选择view 64 是导航条
    _AllGoodsCView.showsVerticalScrollIndicator = NO;
    _AllGoodsCView.showsHorizontalScrollIndicator = NO;
    _AllGoodsCView.dataSource = self;
    _AllGoodsCView.delegate = self;
    _AllGoodsCView.showsVerticalScrollIndicator = NO;
    self.AllGoodsCView.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:_AllGoodsCView];
   
    [self.AllGoodsCView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [_AllGoodsCView registerNib:[UINib nibWithNibName:@"SimilarVideoCourseCVCell" bundle:nil] forCellWithReuseIdentifier:@"SimilarVideoCourseCVCell"];
    
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return 20;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SimilarVideoCourseCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SimilarVideoCourseCVCell" forIndexPath:indexPath];
    return cell;
}

//cell点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    OfflineCourseDetailsVC *VC = [[OfflineCourseDetailsVC alloc] init];
    [VC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:VC animated:YES];
}

//返回每个cell的布局左右上下间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return  UIEdgeInsetsMake(10, 10, 0, 10);
    
}
//单独返回每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((kScreen_widht- kFit(30))/2, 139);
    
}
//单独返回每一个页眉视图的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeMake(0, 0);
}

@end
