
//
//  MyGoodsCollVC.m
//  EntityConvenient
//
//  Created by 石山岭 on 2017/1/7.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "MyGoodsCollVC.h"
#import "GoodsCollCVCell.h"
#import "GoodsCollEditorView.h"
#import "GoodsEditorTVCell.h"//编辑状态的cell
#import "SimilarGoodsVC.h"
static int editorState;

@interface MyGoodsCollVC ()<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching, GoodsCollCVCellDelegate, GoodsCollEditorViewDelegate>

@property (nonatomic, strong)UIView *backImageView1;
@property (nonatomic, strong)GoodsCollEditorView *PopView;
@property (nonatomic, strong)UICollectionView *collectionView;
/**
 *编辑室的时候下放的
 */
@property (nonatomic, strong)UIView *deleteView;

@property (nonatomic, strong)NSMutableArray *DataArray;

@end

@implementation MyGoodsCollVC

- (NSMutableArray *)DataArray {

    if (_DataArray) {
        _DataArray = [NSMutableArray array];
    }
    return _DataArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"收藏的宝贝";
    //导航条配置
    UIImage *returnimage = [UIImage imageNamed:@"return_black"];
    returnimage = [returnimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:returnimage style:UIBarButtonItemStylePlain target:self action:@selector(handleReturn)];//自定义导航条按钮
    self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;

    //模拟商品展示的选中状态
    NSArray *Array = @[@"0", @"0", @"0", @"0", @"0", @"0", @"0"];
    self.DataArray = [NSMutableArray arrayWithArray:Array];
  //添加自定义的按钮
    UIButton *rightBtn = [UIButton buttonWithType:(UIButtonTypeCustom)];
    rightBtn.frame = CGRectMake(0, 0, 54, 30);
    [rightBtn setTitleColor:MColor(51, 51, 51) forState:(UIControlStateNormal)];
    [rightBtn setTitleColor:MColor(51, 51, 51) forState:(UIControlStateSelected)];
    [rightBtn setTitle:@"编辑" forState:(UIControlStateNormal)];
    [rightBtn setTitle:@"完成" forState:(UIControlStateSelected)];
    [rightBtn addTarget:self action:@selector(handleRightBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    rightBtn.titleLabel.font = MFont(kFit(18));
    UIBarButtonItem *CollectButtonItem = [[UIBarButtonItem alloc] initWithCustomView:rightBtn];
    self.navigationItem.rightBarButtonItem = CollectButtonItem;
    
    //集合视图布局及创建
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.minimumInteritemSpacing = 1;
    layout.minimumLineSpacing = 3;
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, kScreen_heigth) collectionViewLayout:layout];
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    _collectionView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:_collectionView];
    [self.collectionView registerClass:[GoodsCollCVCell class] forCellWithReuseIdentifier:@"GoodsCollCVCell"];
        [self.collectionView registerClass:[GoodsRecCViewCell class] forCellWithReuseIdentifier:@"GoodsRecCViewCell"];
    [self.collectionView registerClass:[GoodsEditorTVCell class] forCellWithReuseIdentifier:@"GoodsEditorTVCell"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"FooterView"];
//    NSIndexPath *scrollIndexPath = [NSIndexPath indexPathForRow:0 inSection:0];
//    [self.collectionView scrollToItemAtIndexPath:scrollIndexPath atScrollPosition:UICollectionViewScrollPositionTop animated:YES];
    //编辑的时候下方出现的view 创建
    [self editorDeleteView];
    
}

- (void)editorDeleteView {
    
    self.deleteView = [UIView new];
    _deleteView.hidden = YES;
    [self.view addSubview:_deleteView];
    
    _deleteView.sd_layout.leftSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).heightIs(kFit(48));
    
    UIButton *allDeleteBtn = [UIButton new];
    allDeleteBtn.backgroundColor = MColor(95, 100, 97);
    [allDeleteBtn setTitle:@"全部删除" forState:(UIControlStateNormal)];
    [allDeleteBtn setTitleColor:MColor(255, 255, 255) forState:(UIControlStateNormal)];
    [allDeleteBtn addTarget:self action:@selector(handleAllDeleteBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [_deleteView addSubview:allDeleteBtn];
    allDeleteBtn.sd_layout.leftSpaceToView(_deleteView, 0).topSpaceToView(_deleteView, 0).bottomSpaceToView(_deleteView, 0).widthIs(kScreen_widht/2);
    
    UIButton *chooseDeleteBtn = [UIButton new];
    chooseDeleteBtn.backgroundColor = kNavigation_Color;
    [chooseDeleteBtn setTitle:@"删除" forState:(UIControlStateNormal)];
    [chooseDeleteBtn setTitleColor:MColor(255, 255, 255) forState:(UIControlStateNormal)];
    [chooseDeleteBtn addTarget:self action:@selector(handleChooseDeleteBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [_deleteView addSubview:chooseDeleteBtn];
    chooseDeleteBtn.sd_layout.leftSpaceToView(allDeleteBtn, 0).topSpaceToView(_deleteView, 0).bottomSpaceToView(_deleteView, 0).widthIs(kScreen_widht/2);

    
}
/**
 *全部收藏商品删除
 */
- (void)handleAllDeleteBtn:(UIButton *)sender {

    [_DataArray removeAllObjects];
    [self.collectionView reloadData];
}
/**
 *删除选中的商品
 */
- (void)handleChooseDeleteBtn:(UIButton *)sender {

    NSArray *array = [NSMutableArray arrayWithArray:_DataArray];
    [_DataArray removeAllObjects];
    NSLog(@"%@---%@ 删除测试", _DataArray, array);
    for (int i = 0 ; i <array.count; i ++) {
        
        NSString *str = array[i];
        
        if ([str isEqualToString:@"1"]) {//吧选择的商品ID放到一个数组里面
            
            
        }else {
        
            [_DataArray addObject:array[i]];
        }
    }
    

    [self.collectionView reloadData];
}
/**
 *编辑按钮
 */
- (void)handleRightBtn:(UIButton *)sender {

    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        _deleteView.hidden = NO;
        editorState = 1;
    }else {
        _deleteView.hidden = YES;
        editorState = 0;
    }
    
    [self.collectionView reloadData];
    
    
}
//发布会上一界面
- (void)handleReturn {
    
    [self.navigationController popViewControllerAnimated:YES];

}
- (void)handleEditor {
    

    

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
    
}
- (void)viewWillAppear:(BOOL)animated {
    editorState = 0;
    [super.navigationController setNavigationBarHidden:NO];
}
#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 2;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    if (section == 0) {
        return _DataArray.count;
    }else {
        return 10;
    }
}
#pragma mark -- cell编辑
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.section == 1) {
        
            GoodsRecCViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsRecCViewCell" forIndexPath:indexPath];
            return cell;

    }else {
        if (editorState == 1) {
            GoodsEditorTVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsEditorTVCell" forIndexPath:indexPath];
            NSString *str  = _DataArray[indexPath.row];
            
            if ([str isEqualToString:@"0"]) {
                [cell cellSelected:NO];
            }else {
                [cell cellSelected:YES];
            }
            return cell;
        }else {
            GoodsCollCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsCollCVCell" forIndexPath:indexPath];
        cell.delegate = self;
    return cell;
        }
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {

    if (editorState == 1) {
        NSString *str  = _DataArray[indexPath.row];
        if ([str isEqualToString:@"0"]) {
            _DataArray[indexPath.row] = @"1";
        }else {
            _DataArray[indexPath.row] = @"0";
        }
    }
    [self.collectionView reloadData];


}

//返回每个cell的布局左右上下间距
-(UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    if (section == 1) {
        return  UIEdgeInsetsMake(0 , 0, 0, 0);
    }else {
    return  UIEdgeInsetsMake(10, 10, 0, 10);
    }
}
//返回cell的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
       if(indexPath.section == 0){
        return CGSizeMake(kScreen_widht, kFit(123));
    }else {
        return CGSizeMake((kScreen_widht-3)/2, kFit(259));
    }
}
//单独返回每一个页眉视图的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 0) {
        return CGSizeMake(0, 0);
    }else {
    
    return CGSizeMake(kScreen_widht, 42);
    }
}
//返回页眉 页脚
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if (kind == UICollectionElementKindSectionHeader){
        UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
        
        UILabel *leftLine = [UILabel new];
        leftLine.backgroundColor = MColor(161, 161, 161);
        [headerView addSubview:leftLine];
        leftLine.sd_layout.leftSpaceToView(headerView, kFit(12)).centerYEqualToView(headerView).widthIs(kFit(115)).heightIs(0.5);
        //------
        UIButton *ioncBtn = [UIButton new];
        UIImage *buttonimage = [UIImage imageNamed:@"sptj"];
        //设置图像渲染方式        buttonimage = [buttonimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        [ioncBtn setImage:buttonimage forState:(UIControlStateNormal)];
        [headerView addSubview:ioncBtn];
        ioncBtn.sd_layout.leftSpaceToView(leftLine, kFit(15)).topSpaceToView(headerView, 0).bottomSpaceToView(headerView, 0).widthIs(kFit(24));
        //-------
        UILabel *titleLabel = [UILabel new];  titleLabel.textColor = MColor(51, 51, 51);
        titleLabel.text = @"热门推荐";         titleLabel.font = MFont(kFit(15));
        [headerView addSubview:titleLabel];
        titleLabel.sd_layout.leftSpaceToView(ioncBtn, kFit(5)).topSpaceToView(headerView, 0).bottomSpaceToView(headerView, 0).widthIs(kFit(70));

        UILabel *rightLine = [UILabel new];
        rightLine.backgroundColor = MColor(161, 161, 161);
        [headerView addSubview:rightLine];
        rightLine.sd_layout.rightSpaceToView(headerView, kFit(12)).centerYEqualToView(headerView).widthIs(kFit(115)).heightIs(0.5);

        return headerView;
    }else {
        UICollectionReusableView *footerview = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"FooterView" forIndexPath:indexPath];
        footerview.backgroundColor = [UIColor colorWithRed:238/256.0 green:238/256.0 blue:238/256.0 alpha:1];
        return footerview;
        
    }
}

#pragma mark GoodsCollCVCellDelegate
//商品编辑按钮
-(void)collGoodsEditor:(UIButton *)sender {
    [self ShoppingCellClickEvent];
}
//找相似的商品
- (void)similarGoods:(UIButton *)sender {
    NSLog(@"第%ld个商品", sender.tag / 100);
    SimilarGoodsVC *VC = [[SimilarGoodsVC alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    
}


//获取视图最上层
- (UIViewController *)appRootViewController{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}
//创建弹窗
- (void)ShoppingCellClickEvent{//
    
    //xia面是弹窗的初始化
    UIViewController *topVC = [self appRootViewController];
    if (!self.backImageView1) {
        self.backImageView1 = [[UIView alloc] initWithFrame:self.view.bounds];
        self.backImageView1.backgroundColor = [UIColor blackColor];
        self.backImageView1.alpha = 0.3f;
        self.backImageView1.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenView)];
        tapGesture.numberOfTapsRequired=1;
        [self.backImageView1 addGestureRecognizer:tapGesture];
    }
    [topVC.view addSubview:self.backImageView1];
    
    self.PopView = [[GoodsCollEditorView alloc] initWithFrame:CGRectMake(0, kScreen_heigth, kScreen_widht, kFit(145))];
    
    _PopView.delegate = self;
    [topVC.view addSubview:self.PopView];
    
    [UIView animateWithDuration: 0.2 animations:^{
        
        self.PopView.frame =CGRectMake(0, kScreen_heigth - kFit(145), kScreen_widht, kFit(145));
        
    }];
}
/**
 *删除商品
 */
- (void)deleteBtnClick {
    
    [self.backImageView1 removeFromSuperview];
    [UIView animateWithDuration: 0.2 animations:^{
        self.PopView.frame =CGRectMake(0, kScreen_heigth * 2, kScreen_widht, kFit(145));
    }];
    [self showAlert:@"您点击了删除"];
    
}
/**
 *进入店铺
 */
- (void)EnterShopBtnClick {
    
    [self.backImageView1 removeFromSuperview];
    
    [UIView animateWithDuration: 0.2 animations:^{
        self.PopView.frame =CGRectMake(0, kScreen_heigth * 2, kScreen_widht, kFit(145));
    }];
    [self showAlert:@"您点击了进入店铺"];
    
}
/**
 *取消编辑
 */
- (void)cancelBtnClick {
    [self.backImageView1 removeFromSuperview];
    [UIView animateWithDuration: 0.2 animations:^{
        self.PopView.frame =CGRectMake(0, kScreen_heigth * 2, kScreen_widht, kFit(145));
    }];
    [self showAlert:@"您点击了取消"];
}
/**
 *弹出视图消失
 */
- (void)hiddenView { //调用这个方法不保存选择的数值
    [self.backImageView1 removeFromSuperview];
    
    [UIView animateWithDuration: 0.2 animations:^{
        self.PopView.frame =CGRectMake(0, kScreen_heigth * 2, kScreen_widht, kFit(145));
    }];
}

//系统提示的弹出窗
- (void)timerFireMethod:(NSTimer*)theTimer {//弹出框
    UIAlertView *promptAlert = (UIAlertView*)[theTimer userInfo];
    [promptAlert dismissWithClickedButtonIndex:0 animated:NO];
    promptAlert =NULL;
}
- (void)showAlert:(NSString *) _message{//时间
    UIAlertView *promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:_message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0f
                                     target:self
                                   selector:@selector(timerFireMethod:)
                                   userInfo:promptAlert
                                    repeats:YES];
    [promptAlert show];
}

@end
