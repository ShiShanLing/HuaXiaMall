//
//  GroupBuyingVC.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/22.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "GroupBuyingVC.h"
#import "GroupBuyCRView.h"
#import "GroupBuyBooksCVCell.h"
#import "GroupBuyVideoCVCell.h"
@interface GroupBuyingVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching>

@property (nonatomic, strong)UICollectionView *collectionView;

@end

@implementation GroupBuyingVC

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] init];
    }
    return _collectionView;
}

-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:NO];
}
- (void)viewWillDisappear:(BOOL)animated {

    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self ConfigurationNavigationBar];
    [self setCollectionView];
    NSArray *array=@[@"精选",
                     @"文学",
                     @"科学",
                     @"社会",
                     @"文学",
                     @"科学",
                     @"社会",
                     @"文学",
                     @"科学",
                     @"社会",
                     @"文学",
                     @"科学",
                     @"社会",
                     @"   "
                     ];
    
    CBHeaderChooseViewScrollView*headerView=[[CBHeaderChooseViewScrollView alloc]initWithFrame:CGRectMake(0, 64, kScreen_widht, 40)];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    
    
    
    [headerView setUpTitleArray:array titleColor:nil titleSelectedColor:nil titleFontSize:0];
    __weak GroupBuyingVC *VC = self;
    headerView.btnChooseClickReturn = ^(NSInteger x) {
        NSLog(@"点击了第%ld个按钮",x+1);

        [VC.collectionView reloadData];
    };

}


//配置导航条
- (void)ConfigurationNavigationBar {
    self.navigationController.navigationBar.barTintColor = kOrange_Color;
    [self ConfigurationNavigationBar:@"团购特惠" titleSize:kFit(18) NavigationBarColor:kOrange_Color titleColor:nil];
    [self navigationBarAddButton:@"0" imageName:@"fanhui"];
    [self navigationBarAddButton:@"1" imageName:@"gdxx"];
    
}
-(void)handleReturn {
    
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (void)setCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //添加页眉
    // [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.sectionInset = UIEdgeInsetsMake(-20, 10, 0, 10);//设置页眉的高度
    layout.minimumInteritemSpacing = kFit(3);
    layout.minimumLineSpacing = kFit(3);
    layout.headerReferenceSize = CGSizeMake(kScreen_widht, kFit(15));
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 40 + kTopSpacing, kScreen_widht, kScreen_heigth-40-kTopSpacing) collectionViewLayout:layout];
    _collectionView .dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = MColor(242, 242, 242);
    _collectionView.showsVerticalScrollIndicator = NO;
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [_collectionView registerClass:[GroupBuyBooksCVCell class] forCellWithReuseIdentifier:@"GroupBuyBooksCVCell"];
    [_collectionView registerClass:[GroupBuyVideoCVCell class] forCellWithReuseIdentifier:@"GroupBuyVideoCVCell"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionElementKindSectionFooter"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionElementKindSectionHeader"];
    [_collectionView registerClass:[GroupBuyCRView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"GroupBuyCRView"];
    [self.view addSubview:_collectionView];
    
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
   
    return 3;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0 || section == 2) {
        return 1;
    }else {
        return 4;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
        NSArray *pathArray = @[
                               @"http://i4.cqnews.net/news/attachement/jpg/site82/2016-08-23/9143505007648195979.jpg",
                               @"http://www.people.com.cn/mediafile/pic/20160830/95/17946987410935083075.jpg",
                               @"http://p.nanrenwo.net/uploads/allimg/160912/8388-160912092346-50.jpg",
                               @"http://upload.cbg.cn/2016/0728/1469695681806.jpg",
                               @"http://image.cnpp.cn/upload/images/20160905/09380421552_400x300.jpg",
                               @"http://cnews.chinadaily.com.cn/img/attachement/jpg/site1/20160729/0023ae82c931190560502f.jpg",
                               ];
        
        SZCirculationImageView *shufflingView = [[SZCirculationImageView alloc] initWithFrame:CGRectMake(0, 0, cell.width,kFit(129)) andImageURLsArray:pathArray andTitles:nil];
        shufflingView.titleViewStatus = SZTitleViewBottomOnlyPageControl;
        shufflingView.pauseTime = 2.0;
        [cell addSubview:shufflingView];
        return cell;
    }else if(indexPath.section == 1) {
        GroupBuyBooksCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GroupBuyBooksCVCell" forIndexPath:indexPath];
        cell.backgroundColor = [UIColor whiteColor];
        return cell;
    }else {
        GroupBuyVideoCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GroupBuyVideoCVCell" forIndexPath:indexPath];
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}
//返回每个cell的布局左右上下间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    if (section == 1) {
        return  UIEdgeInsetsMake(0, 0, kFit(3), 0);
    }else {
        return  UIEdgeInsetsMake(0, 0, 0, 0);
        
    }
    
}
//单独返回每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return CGSizeMake(kScreen_widht, kFit(129));
    }else if(indexPath.section == 2){
        return CGSizeMake(kScreen_widht, kFit(271));
    }else{
        return CGSizeMake((kScreen_widht-kFit(3))/2, kFit(258));
    }
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 1) {
        return CGSizeMake(kScreen_widht, kFit(38));
    }else {
        return CGSizeMake(kScreen_widht, kFit(0.01));
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    
    return CGSizeMake(kScreen_widht, 0.01);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        if (indexPath.section == 1) {
            GroupBuyCRView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"GroupBuyCRView" forIndexPath:indexPath];
            reusableview = headerView;
        }else {
        
            UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionElementKindSectionHeader" forIndexPath:indexPath];
            
            reusableview = footerview;
        }
       
    }
    
    if (kind == UICollectionElementKindSectionFooter){
        
        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionElementKindSectionFooter" forIndexPath:indexPath];
        
        reusableview = footerview;
        
    }
    return reusableview;
}

@end
