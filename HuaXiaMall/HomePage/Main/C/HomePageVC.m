//
//  HomePageVC.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/9.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "HomePageVC.h"
#import "SearchBoxView.h"
#import "HPActivityCenterCVCell.h"
#import "FlashSaleCVCell.h"//限时限购
#import "OfflineCourseCVCell.h"
#import "SnapUpCVCell.h"//抢购专场
#import "VideoCourseViewController.h"
#import "HeaderCollectionReusableView.h"
#import "CXSearchController.h"
#import "HomePageNavBarView.h"
#import "TimeLimitSnapUpVC.h"
@interface HomePageVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching, GoodsRecCViewCellDelegate, HPActivityCenterCVCellDelegate, OfflineCourseCVCellDelegate, HomePageNavBarViewDeleagte, UITabBarControllerDelegate, UIWebViewDelegate, FlashSaleCVCellDelegate>

@property (nonatomic, strong)UICollectionView *collectionView;

//搜搜框样式
@property (nonatomic, strong)SearchBoxView * searchBoxView;
@property (nonatomic, strong) SearchBoxView *searchBoxViewOne;
/**
 *导航条上的左边按钮
 */
@property (nonatomic, strong)UIButton *LeftBtn;
/**
 *导航条上的右边按钮
 */
@property (nonatomic, strong)UIButton *rightBtn;
/**
 *可变数组
 */
@property (nonatomic, strong)NSMutableArray *hotCourseArray;

@end

@implementation HomePageVC
- (NSMutableArray *)hotCourseArray {
    if (!_hotCourseArray) {
        _hotCourseArray = [NSMutableArray array];
    }
   return _hotCourseArray;
}
- (void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}
- (void)viewDidAppear:(BOOL)animated {
   
}
- (void)viewWillDisappear:(BOOL)animated {
  
}
- (void)viewDidDisappear:(BOOL)animated {
   
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self goodsRecommendDataRequest];
    self.navigationController.navigationBar.barTintColor = kOrange_Color;
    NSLog(@"self.networkStatus%ld",(long)self.networkStatus);
    if (self.networkStatus != 1) {
        [self setCollectionView];
    }
    //得到第一个UIView
    
    HomePageNavBarView *tempView = [[HomePageNavBarView alloc] init];
    tempView.frame = CGRectMake(0, 0, kScreen_widht, 64);
    tempView.delegate = self;
    //添加视图
   [self.view addSubview:tempView];
}

- (void)handleBtn {
    NSString *qq=[NSString stringWithFormat:@"mqq://im/chat?chat_type=wpa&uin=%@&version=1&src_type=web",@"522527150"];
    NSURL *url = [NSURL URLWithString:qq];
    [[UIApplication sharedApplication] openURL:url];
}
/**
 *二维码扫描
 */
- (void)QrCodeScanning {
    
    ScanViewController *VC = [[ScanViewController alloc] init];
    [VC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:VC animated:YES];

}
/**
 *我的消息
 */
- (void)MessageRemind {


}
/**
 *搜索框点击事件
 */
- (void)ClickSearchBox {
    CXSearchController *VC = [[CXSearchController alloc] init];
    [VC setHidesBottomBarWhenPushed:YES];
    [self presentViewController:VC animated:YES completion:nil];
}
//扫一扫按钮
- (void)handleScanningBtn {
    
   
}
#pragma mark  SearchBoxViewDelegate
//搜索界面
- (void)SearchJump {
   
}

//消息按钮
- (void)handleMessageBtn {
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (void)setCollectionView {
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //添加页眉
    // [layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.minimumInteritemSpacing = kFit(3);
    layout.minimumLineSpacing = kFit(3);
    layout.headerReferenceSize = CGSizeMake(kScreen_widht, kFit(0));
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, kTopSpacing, kScreen_widht, kScreen_heigth-kTopSpacing) collectionViewLayout:layout];
    _collectionView .dataSource = self;
    _collectionView.delegate = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    _collectionView.backgroundColor = MColor(238, 238, 238);
    [_collectionView registerClass:[HPActivityCenterCVCell class] forCellWithReuseIdentifier:@"HPActivityCenterCVCell"];
    [_collectionView registerClass:[GoodsRecCViewCell class] forCellWithReuseIdentifier:@"GoodsRecCViewCell"];
    [_collectionView registerClass:[FlashSaleCVCell class] forCellWithReuseIdentifier:@"FlashSaleCVCell"];
    [_collectionView registerClass:[OfflineCourseCVCell class] forCellWithReuseIdentifier:@"OfflineCourseCVCell"];
    [_collectionView registerClass:[SnapUpCVCell class] forCellWithReuseIdentifier:@"SnapUpCVCell"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionElementKindSectionHeader"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionElementKindSectionFooter"];
    
    [_collectionView registerNib:[UINib nibWithNibName:@"HeaderCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderCollectionReusableView"];
    [self.view addSubview:_collectionView];
    
    NSMutableArray * arrayM = [NSMutableArray arrayWithCapacity:0];
    for (int i = 0; i < 12; i ++) {
        UIImage * image = [UIImage imageNamed:[NSString stringWithFormat:@"%d",i + 1]];
        [arrayM addObject:image];
    }
    
    MJRefreshGifHeader * header = [MJRefreshGifHeader headerWithRefreshingBlock:^{
        [self goodsRecommendDataRequest];
        
    }];
    header.lastUpdatedTimeLabel.hidden = YES;
    header.stateLabel.hidden = YES;
    
    // 设置普通状态下的动画图片  -->  静止的一张图片
    NSArray * normalImagesArray = @[[UIImage imageNamed:@"1"]];
    [header setImages:normalImagesArray forState:MJRefreshStateIdle];
    
    // 设置即将刷新状态的动画图片
    [header setImages:arrayM forState:MJRefreshStatePulling];
    
    // 设置正在刷新状态的动画图片
    [header setImages:arrayM forState:MJRefreshStateRefreshing];
    
    // 设置header
    self.collectionView.mj_header = header;
    
    MJRefreshAutoGifFooter * footer = [MJRefreshAutoGifFooter footerWithRefreshingBlock:^{
        [self goodsRecommendDataRequest];
    }];
    [footer setImages:arrayM forState:MJRefreshStatePulling];
    [footer setImages:arrayM forState:MJRefreshStateRefreshing];
    // 设置header
    self.collectionView.mj_footer = footer;
    
}



- (void)StopRefresh {
    [self.collectionView endRefresh];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 4;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if(section == 1||section == 2){
        return 1;
    }else {
        return _hotCourseArray.count;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HPActivityCenterCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HPActivityCenterCVCell" forIndexPath:indexPath];
        cell.delegate = self;
        NSArray *pathArray = @[
                           @"lbt1.jpeg",
                           @"lbt2.jpeg",
                           @"lbt3.jpeg",
                           ];
        SZCirculationImageView *shufflingView = [[SZCirculationImageView alloc] initWithFrame:CGRectMake(0, 0, cell.width,kFit(116)) andImageNamesArray:pathArray andTitles:nil];
        shufflingView.titleViewStatus = SZTitleViewBottomOnlyPageControl;
        shufflingView.pauseTime = 2.0;
        UIImageView *moomImage = [[UIImageView alloc] init];
        moomImage.image = [UIImage imageNamed:@"moon"];
        [shufflingView addSubview:moomImage];
        moomImage.sd_layout.leftSpaceToView(shufflingView, 0).rightSpaceToView(shufflingView, 0).bottomSpaceToView(shufflingView, 0).heightIs(10);
        [cell addSubview:shufflingView];
        return cell;
    }else if (indexPath.section == 1) {
        FlashSaleCVCell  *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FlashSaleCVCell" forIndexPath:indexPath];
        cell.delegate = self;
        return cell;
    }else if(indexPath.section == 2){
        OfflineCourseCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"OfflineCourseCVCell" forIndexPath:indexPath];
        cell.delegate = self;
        return cell;
    }else {
        GoodsDetailsModel *model = self.hotCourseArray[indexPath.row];
        GoodsRecCViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsRecCViewCell" forIndexPath:indexPath];
        cell.delegate= self;
        cell.model = model;
        return cell;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 3) {
        GoodsDetailsModel *model = self.hotCourseArray[indexPath.row];
        GoodsDetailsVController *VC = [[GoodsDetailsVController alloc] init];
        [VC setHidesBottomBarWhenPushed:YES];
        VC.goodsID = model.goodsId;
        [self.navigationController pushViewController:VC animated:YES];
    }
}
//返回每个cell的布局左右上下间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 0||section == 1||section == 2||section == 2) {
        return   UIEdgeInsetsMake(0, 0, 0, 0);
    }else {
        return  UIEdgeInsetsMake(0, 0, kFit(3), 0);
    }
}
//单独返回每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0 ) {
        return CGSizeMake((kScreen_widht), kFit(247));
    }else if ( indexPath.section == 1) {
        return CGSizeMake((kScreen_widht), 180);
    }else if ( indexPath.section == 2) {
        return CGSizeMake((kScreen_widht), kFit(326));
    }else {
        return CGSizeMake((kScreen_widht-kFit(3))/2, kFit(260));
    }
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeMake(kScreen_widht, 0.01);
    }else if (section == 3){
        return CGSizeMake(kScreen_widht, kFit(34));
    } else {
        return CGSizeMake(kScreen_widht, 10);
    }
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(kScreen_widht, 0.01);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    if (kind == UICollectionElementKindSectionHeader){
        if (indexPath.section == 3) {
            HeaderCollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HeaderCollectionReusableView" forIndexPath:indexPath];
            headerView.backgroundColor = MColor(238, 238, 238);
            reusableview = headerView;
        }else {
            UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionElementKindSectionHeader" forIndexPath:indexPath];
            
            reusableview = headerView;
        }
    }
    
    if (kind == UICollectionElementKindSectionFooter){
        
        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionElementKindSectionFooter" forIndexPath:indexPath];
        reusableview = footerview;
    }
    return reusableview;
}
#pragma mark  FlashSaleCVCellDelegate
- (void)goodsChoose:(NSIndexPath *)indexPath {

    GoodsDetailsVController *VC = [[GoodsDetailsVController alloc] init];
    [VC setHidesBottomBarWhenPushed:YES];
    VC.goodsID = @"fbe59487809b4cd89c235c777eb08b07";
    [self.navigationController pushViewController:VC animated:YES];

}
- (void)viewMore {

    TimeLimitSnapUpVC *VC = [[TimeLimitSnapUpVC alloc] init];
    [VC  setHidesBottomBarWhenPushed:YES];
    
    [self.navigationController pushViewController:VC animated:YES];

}
#pragma mark  GoodsRecCViewCellDelegate

- (void)ShareGoodsSubscript:(NSIndexPath *)indexPath {
    ShareIntroduceVC *VC = [[ShareIntroduceVC alloc] init];
    [VC setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:VC animated:YES];
}

#pragma mark  HPActivityCenterCVCellDelegate

- (void)HotModuleClickEvent:(NSInteger)index {
    
    switch (index) {
        case 100:{
            VideoCourseViewController *VC = [[VideoCourseViewController alloc] init];
            [VC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 101:{
            BooksCourseVC *VC = [[BooksCourseVC alloc] init];
            [VC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 102:{
            GroupBuyingVC *VC = [[GroupBuyingVC alloc] init];
            [VC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:VC animated:YES];
        }
            break;
        case 103:{
            
        }
            break;
        case 104:{
            
        }
            break;
        default:
            break;
    }
}
#pragma mark OfflineCourseCVCellDelegate
- (void)videoCourseClickEvent:(NSInteger)index {
    if (index>=2) {
        VideoDetailsVC *VC = [[VideoDetailsVC alloc] init];
        [VC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:VC animated:YES];
    }else {
        OfflineCourseDetailsVC *VC = [[OfflineCourseDetailsVC alloc]init];
        [VC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:VC animated:YES];
        
    }
}
//商品推荐数据请求
- (void)goodsRecommendDataRequest{
    
    NSString *str=[NSString stringWithFormat:@"%@/goods/api/findRecommendGoods", kSHY_100];
    NSLog(@"goodsRecommendDataRequest%@", str);
    __block HomePageVC *VC = self;
    
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session GET:str parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSString *stateStr = [NSString stringWithFormat:@"%@", responseObject[@"result"]];
        [_collectionView.mj_footer endRefreshing];
        [_collectionView.mj_header endRefreshing];
        if ([stateStr isEqualToString:@"1"]) {
            [VC AnalyticalRecommendGoodsData:responseObject];
        }else {
            [VC showAlert:responseObject[@"msg"] time:1.0];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [_collectionView.mj_footer endRefreshing];
        [_collectionView.mj_header endRefreshing];
        [VC showAlert:@"推荐商品数据获取失败" time:1.0];
        NSLog(@"error%@", error);
    }];
}
//商品推荐数据解析
- (void)AnalyticalRecommendGoodsData:(NSDictionary *)data {
    [self.hotCourseArray removeAllObjects];
    NSArray *array = data[@"data"];
     [self managedContext];
        for (NSDictionary *dataDic in array) {//获取商品
        //创建实体描述对象
        NSEntityDescription *des = [NSEntityDescription entityForName:@"GoodsDetailsModel" inManagedObjectContext:self.managedContext];
        //根据描述 创建实体对象
        GoodsDetailsModel *GDModel = [[GoodsDetailsModel alloc] initWithEntity:des insertIntoManagedObjectContext:self.managedContext];
        NSDictionary *goodsDetailsDic = dataDic[@"goods"];
        for (NSString *key in goodsDetailsDic) {//获取商品里面参数
            [GDModel setValue:goodsDetailsDic[key] forKey:key];
        }
        [self.hotCourseArray addObject:GDModel];
    }
    [self.collectionView reloadData];
}

- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    if ([viewController isKindOfClass:[DailyStudyViewController class]]) {
        LogInViewController *VC = [[LogInViewController alloc] init];
        UINavigationController *NAVC = [[UINavigationController alloc] initWithRootViewController:VC];
        [self presentViewController:NAVC animated:YES completion:nil];
    }
    if ([viewController isKindOfClass:[ShoppingCartViewController class]]) {
        
    }
    if ([viewController isKindOfClass:[MyViewController class]]) {
        
    }

}

@end
