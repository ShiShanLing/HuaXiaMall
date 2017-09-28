//
//  ShopGoodsListVC.m
//  EntityConvenient
//
//  Created by 石山岭 on 2017/2/27.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "ShopGoodsListVC.h"
#import "ClassificationView.h"
#import "AllGoodsCViewCell.h"

static int layout;

@interface ShopGoodsListVC ()<ClassificationViewDelegate, UICollectionViewDataSourcePrefetching, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate>
/**
 *店铺所有商品tableView;
 */
@property (nonatomic, strong)UICollectionView *AllGoodsCView;
/**
 *商品分类
 */
@property (nonatomic, strong)ClassificationView *classificationView;


/**
 *存放商品的数组
 */
@property (nonatomic, strong)NSMutableArray *goodsArray;

@end

@implementation ShopGoodsListVC

- (NSMutableArray *)goodsArray {
    if (!_goodsArray) {
        _goodsArray = [NSMutableArray array];
    }
    return _goodsArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self storeGoodsDataRequest];
    [self setAllGoodsView];
}

//店铺商品数据请求
- (void)storeGoodsDataRequest{
    
}

- (void)AnalyticalstoreGoodsData:(NSDictionary *)data {
    
    
}

- (void)setAllGoodsView {
    self.classificationView = [[ClassificationView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, kFit(43))];
    _classificationView.delegate = self;
    [self.view addSubview:_classificationView];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //添加页眉
    layout.minimumInteritemSpacing = 3;
    layout.minimumLineSpacing = 3;
    self.AllGoodsCView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 43, kScreen_widht, kScreen_heigth-kFit(43)-64-41)collectionViewLayout:layout];//43是规格选择view 41是分页选择view 64 是导航条
    _AllGoodsCView.showsVerticalScrollIndicator = NO;
    _AllGoodsCView.showsHorizontalScrollIndicator = NO;
    _AllGoodsCView.dataSource = self;
    _AllGoodsCView.delegate = self;
    _AllGoodsCView.showsVerticalScrollIndicator = NO;
    self.AllGoodsCView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_AllGoodsCView];
    
    [self.AllGoodsCView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.AllGoodsCView registerClass:[AllGoodsCViewCell class] forCellWithReuseIdentifier:@"AllGoodsCViewCell"];
    [self.AllGoodsCView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"AllHeader"];//注册也页眉视图
    [self.AllGoodsCView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"AllFooterView"];//注册页脚视图
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark  UICollectionViewDelegate
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (_goodsArray.count == 0) {
        return 10;
    }else {
        return _goodsArray.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor yellowColor];
        return cell;
        
   }

//cell点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    GoodsDetailsVController *VC = [[GoodsDetailsVController alloc] init];
    GoodsDetailsModel *model = self.goodsArray[indexPath.row];
    VC.goodsID = model.goodsId;
    [VC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:VC animated:YES];
}

//返回每个cell的布局左右上下间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
            return  UIEdgeInsetsMake(3, 3, 0, 3);
    
}
//单独返回每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((kScreen_widht-9)/2, 260);
    
}
//单独返回每一个页眉视图的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
        return CGSizeMake(0.01, 0.01);
}

#pragma mark -- ClassificationViewDelegate

- (void)btn_classification:(UIButton *)btn {
    if (btn.tag == 11004) {
        
        if (layout == 0) {
            layout = 1;
        }else {
            layout = 0;
        }
        [self.AllGoodsCView reloadData];
        
    }
}
//系统提示的弹出窗
- (void)timerFireMethod:(NSTimer*)theTimer {//弹出框
    UIAlertView *promptAlert = (UIAlertView*)[theTimer userInfo];
    [promptAlert dismissWithClickedButtonIndex:0 animated:NO];
    promptAlert =NULL;
}
- (void)showAlert:(NSString *) _message{//时间
    UIAlertView *promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:_message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:@selector(timerFireMethod:)
                                   userInfo:promptAlert
                                    repeats:YES];
    [promptAlert show];
}


@end
