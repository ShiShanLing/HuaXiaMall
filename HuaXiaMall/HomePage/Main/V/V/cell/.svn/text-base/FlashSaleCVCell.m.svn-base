//
//  FlashSaleCVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/11.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "FlashSaleCVCell.h"

#import "HLimitTimeGoodsCVCell.h"
@interface FlashSaleCVCell ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching, UICollectionViewDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;


@property(nonatomic, strong)NSMutableArray *modelArray;


@end

@implementation FlashSaleCVCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.contentView.backgroundColor = [UIColor whiteColor];
        
        UIView *titleView = [[UIView alloc] init];
        titleView.backgroundColor = [UIColor whiteColor];
        [self.contentView addSubview:titleView];
        titleView.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(34);
        
        UILabel *segmentationLabel = [[UILabel alloc] init];
        segmentationLabel.backgroundColor = MColor(242, 242, 242);
        [titleView addSubview:segmentationLabel];
        segmentationLabel.sd_layout.leftSpaceToView(titleView, 0).bottomSpaceToView(titleView, 0).heightIs(kFit(1)).rightSpaceToView(titleView, 0);
        
        UIButton *iconBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [iconBtn setImage:[UIImage imageNamed:@"xsxg"] forState:(UIControlStateNormal)];
        [titleView addSubview:iconBtn];
        iconBtn.sd_layout.leftSpaceToView(titleView, kFit(10)).centerYEqualToView(titleView).widthIs(kFit(20)).heightIs(kFit(20));
        
        UIImageView *iconImage =[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"xsxgText"]];
        [titleView addSubview:iconImage];
        iconImage.sd_layout.leftSpaceToView(iconBtn, kFit(10)).centerYEqualToView(titleView).widthIs(kFit(50)).heightIs(kFit(14));
        
        // 封装后
        self.CountDownView = [CZCountDownView shareCountDown];
        _CountDownView.frame = CGRectMake(100, 100, 61, 15);
        _CountDownView.timestamp = 10000;
        _CountDownView.timerStopBlock = ^{
            NSLog(@"时间停止");
        };
        
        [titleView addSubview:_CountDownView];
        _CountDownView.sd_layout.leftSpaceToView(iconImage, kFit(10)).centerYEqualToView(titleView).widthIs(61).heightIs(15);

        UIButton *arrowBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [arrowBtn setImage:[UIImage imageNamed:@"qbddjt"] forState:(UIControlStateNormal)];
        [arrowBtn addTarget:self action:@selector(handleMoreMore) forControlEvents:(UIControlEventTouchUpInside)];
        [titleView addSubview:arrowBtn];
        arrowBtn.sd_layout.rightSpaceToView(titleView, 0).centerYEqualToView(titleView).widthIs(30).heightIs(34);
        UIButton *MoreMoreBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [MoreMoreBtn setTitle:@"查看更多" forState:(UIControlStateNormal)];
        MoreMoreBtn.titleLabel.font = MFont(kFit(14));
        [MoreMoreBtn setTitleColor:[UIColor blackColor] forState:(UIControlStateNormal)];
        [MoreMoreBtn addTarget:self action:@selector(handleMoreMore) forControlEvents:(UIControlEventTouchUpInside)];
        [titleView addSubview:MoreMoreBtn];
        MoreMoreBtn.sd_layout.rightSpaceToView(arrowBtn, -5).centerYEqualToView(titleView).widthIs(60).heightIs(34);
        
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(119, 146);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 5;
        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, (35), kScreen_widht,146) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollsToTop = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"HLimitTimeGoodsCVCell" bundle:nil] forCellWithReuseIdentifier:@"HLimitTimeGoodsCVCell"];
        [self.contentView addSubview:_collectionView];
        _collectionView.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(titleView,kFit(0)).rightSpaceToView(self.contentView, 0).heightIs(147);
        
    }
    return self;
}

- (void)handleMoreMore {
    
    if ([_delegate respondsToSelector:@selector(viewMore)]) {
        [_delegate viewMore];
    }
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    //NSLog(@"numberOfItemsInSection%lu", (unsigned long)self.modelArray.count);
    return 8;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    HLimitTimeGoodsCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HLimitTimeGoodsCVCell" forIndexPath:indexPath];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([_delegate respondsToSelector:@selector(goodsChoose:)]) {
        [_delegate goodsChoose:indexPath];
    }
    
    
}

- (void)setStoreArray:(NSMutableArray *)storeArray {
    self.modelArray = [NSMutableArray arrayWithArray:storeArray];
    [self.collectionView reloadData];
    
}

#pragma mark - UICollectionViewDelegateFlowLayout

//在这个方法里面给cell赋值

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    
}


@end
