//
//  BooksCourseVC.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/22.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "BooksCourseVC.h"

static NSInteger courseType;

@interface BooksCourseVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching>

@property (nonatomic, strong)UICollectionView *collectionView;

@end

@implementation BooksCourseVC

- (UICollectionView *)collectionView {
    
    if (!_collectionView) {
        _collectionView = [[UICollectionView alloc] init];
    }
    return _collectionView;
}

-(void)viewWillAppear:(BOOL)animated {
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
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
    courseType = 1;
    CBHeaderChooseViewScrollView*headerView=[[CBHeaderChooseViewScrollView alloc]initWithFrame:CGRectMake(0, 64, kScreen_widht, 40)];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    
    
    
    [headerView setUpTitleArray:array titleColor:nil titleSelectedColor:nil titleFontSize:0];
    __weak BooksCourseVC *VC = self;
    headerView.btnChooseClickReturn = ^(NSInteger x) {
        NSLog(@"点击了第%ld个按钮",x+1);
        courseType = x + 1;
        [VC.collectionView reloadData];
    };
    //搜索按钮
    UIButton*additionalBut = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [additionalBut setImage:[UIImage imageNamed:@"ss"] forState:(UIControlStateNormal)];
    additionalBut.backgroundColor = [UIColor whiteColor];
    additionalBut.layer.borderWidth = 1;
    [additionalBut addTarget:self action:@selector(handleAdditionalBut) forControlEvents:(UIControlEventTouchUpInside)];
    additionalBut.layer.borderColor = MColor(242, 242, 242).CGColor;
    [self.view addSubview:additionalBut];
    additionalBut.sd_layout.rightSpaceToView(self.view, 0).topSpaceToView(self.view,64).autoHeightRatio(1).widthIs(40);
}
//搜索
- (void)handleAdditionalBut {
    
    
}

//配置导航条
- (void)ConfigurationNavigationBar {
    self.navigationController.navigationBar.barTintColor = kOrange_Color;
    [self ConfigurationNavigationBar:@"精选书籍" titleSize:kFit(18) NavigationBarColor:kOrange_Color titleColor:nil];
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
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 40+kTopSpacing, kScreen_widht, kScreen_heigth-40-kTopSpacing) collectionViewLayout:layout];
    _collectionView .dataSource = self;
    _collectionView.delegate = self;
    _collectionView.backgroundColor = MColor(242, 242, 242);
    _collectionView.showsVerticalScrollIndicator = NO;
    [_collectionView registerClass:[GoodsRecCViewCell class] forCellWithReuseIdentifier:@"GoodsRecCViewCell"];
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionElementKindSectionFooter"];
    [_collectionView registerNib:[UINib nibWithNibName:@"HotModuleCRView" bundle:[NSBundle mainBundle]] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HotModuleCRView"];
    [self.view addSubview:_collectionView];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 3;
    
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 4;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    GoodsRecCViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsRecCViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}
//返回每个cell的布局左右上下间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    
    return  UIEdgeInsetsMake(0, 0, kFit(3), 0);
    
}
//单独返回每一个cell的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    return CGSizeMake((kScreen_widht-kFit(3))/2, kFit(258));
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    return CGSizeMake(kScreen_widht, kFit(72));
    
}

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeMake(kScreen_widht, 0.01);
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionReusableView *reusableview = nil;
    
    if (kind == UICollectionElementKindSectionHeader){
        
        HotModuleCRView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"HotModuleCRView" forIndexPath:indexPath];
        headerView.backgroundColor = MColor(242, 242, 242);
        headerView.titleLabel.text = @"精选书籍 ▶";
        reusableview = headerView;
    }
    
    if (kind == UICollectionElementKindSectionFooter){
        
        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"UICollectionElementKindSectionFooter" forIndexPath:indexPath];
        
        reusableview = footerview;
        
    }
    return reusableview;
}


/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
