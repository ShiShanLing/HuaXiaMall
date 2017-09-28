//
//  StoreViewController.m
//  EntityConvenient
//
//  Created by 石山岭 on 2016/12/2.
//  Copyright © 2016年 石山岭. All rights reserved.
//

#import "StoreViewController.h"
#import "ShopGoodsListVC.h"
#import "ShopFrontPageVC.h"
#import "StoreDetaileVC.h"
#import "StoreHeadView.h"
#import "MainTouchTableTableView.h"
#import "MYSegmentView.h"

#define Main_Screen_Height      [[UIScreen mainScreen] bounds].size.height
#define Main_Screen_Width       [[UIScreen mainScreen] bounds].size.width
#define headViewHeight          Main_Screen_Width * 0.4
//static CGFloat const headViewHeight = ;

#define SCREEN_WIDTH    ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

static int layout;

@interface StoreViewController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic ,strong)MainTouchTableTableView * mainTableView;
@property (nonatomic, strong) MYSegmentView * RCSegView;
@property(nonatomic,strong)UIImageView *headImageView;//头部图片
@property(nonatomic, strong)StoreHeadView *storeHeadView;//商店的介绍和信誉度显示
@property(nonatomic,strong)UIImageView * avatarImage;
@property(nonatomic,strong)UILabel *countentLabel;

@property (nonatomic, assign) BOOL canScroll;
@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabView;
@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabViewPre;

@property (nonatomic, strong)AppDelegate *delegate;
@property (nonatomic, strong)NSManagedObjectContext *managedContext;
@property (readonly, strong, nonatomic) NSManagedObjectContext * managedObjectContext;
/**
 *存储店铺信息model的数组
 */
@property (nonatomic, strong)NSMutableArray *storeModelArray;


@end

@implementation StoreViewController
@synthesize mainTableView;
- (NSMutableArray *)storeModelArray {
    if (!_storeModelArray) {
        _storeModelArray = [NSMutableArray array];
    }
    return _storeModelArray;
}
- (NSManagedObjectContext *)managedContext {
    if (!_managedContext) {
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        _managedContext = delegate.managedObjectContext;
    }
   return _managedContext;
}

- (AppDelegate *)delegate {
    if (!_delegate) {
        self.delegate =[[AppDelegate alloc] init];
    }
    return _delegate;
}




- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self storeInformationDataRequest];
    [super.navigationController setNavigationBarHidden:NO];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configurationNavigationBar];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:kFit(18)]}];//改变导航条标题的颜色与大小
    self.navigationItem.title = @"店铺界面";
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    [self.view addSubview:self.mainTableView];
    [self.mainTableView addSubview:self.storeHeadView];
    /*
     *
     */
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:@"leaveTop" object:nil];
}

//店铺信息数据请求
- (void)storeInformationDataRequest {

    
}
//店铺信息数据请求
- (void)AnalyticalStoreInformationData:(NSDictionary *)dic {
    
   
}
//配置导航条
- (void)configurationNavigationBar {
    self.navigationController.navigationBar.translucent = YES;
    self.view.backgroundColor = MColor(238, 238, 238);
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];//导航条标题颜色
    UIImage *returnimage = [UIImage imageNamed:@"fh"];
    //设置图像渲染方式
    returnimage = [returnimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];//去掉UIButton的渲染色
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:returnimage style:UIBarButtonItemStylePlain target:self action:@selector(handleReturn)];//自定义导航条按钮
    self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
    //收藏
    UIImage *collectImage = [UIImage imageNamed:@"after collection"];
    //设置图像渲染方式
    collectImage = [collectImage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];//去掉
    UIBarButtonItem *MoreMoreButtonItem = [[UIBarButtonItem alloc] initWithImage:collectImage style:UIBarButtonItemStylePlain target:self action:@selector(handleMoreMore)];//自定义导航条按钮
    
    UIImage *MoreMoreImage = [UIImage imageNamed:@"more"];
    //设置图像渲染方式
    MoreMoreImage = [MoreMoreImage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];//去掉
    UIBarButtonItem *CollectButtonItem = [[UIBarButtonItem alloc] initWithImage:MoreMoreImage style:UIBarButtonItemStylePlain target:self action:@selector(handleCollect)];//自定义导航条按钮
    self.navigationItem.rightBarButtonItems = @[CollectButtonItem, MoreMoreButtonItem];
}
//返回上一界面
- (void)handleReturn {
    [self.navigationController popViewControllerAnimated:YES];
}
//更多
- (void)handleCollect {
 

}
//收藏
- (void)handleMoreMore {
   

}

-(void)acceptMsg : (NSNotification *)notification{
    
    
    NSDictionary *userInfo = notification.userInfo;
    NSString *canScroll = userInfo[@"canScroll"];
    if ([canScroll isEqualToString:@"1"]) {
        _canScroll = YES;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    /**
     * 处理联动
     */
    //获取滚动视图y值的偏移量
    CGFloat yOffset  = scrollView.contentOffset.y;
    CGFloat tabOffsetY = [mainTableView rectForSection:0].origin.y;
    CGFloat offsetY = scrollView.contentOffset.y;
    _isTopIsCanNotMoveTabViewPre = _isTopIsCanNotMoveTabView;
    if (offsetY>=tabOffsetY) {
        scrollView.contentOffset = CGPointMake(0, tabOffsetY);
        _isTopIsCanNotMoveTabView = YES;
    }else{
        _isTopIsCanNotMoveTabView = NO;
    }
    if (_isTopIsCanNotMoveTabView != _isTopIsCanNotMoveTabViewPre) {
        if (!_isTopIsCanNotMoveTabViewPre && _isTopIsCanNotMoveTabView) {
            //NSLog(@"滑动到顶端");
            [[NSNotificationCenter defaultCenter] postNotificationName:@"goTop" object:nil userInfo:@{@"canScroll":@"1"}];
            _canScroll = NO;
        }
        if(_isTopIsCanNotMoveTabViewPre && !_isTopIsCanNotMoveTabView){
            //NSLog(@"离开顶端");
            if (!_canScroll) {
                scrollView.contentOffset = CGPointMake(0, tabOffsetY);
            }
        }
    }
    /**
     * 处理头部视图
     */
     if(yOffset < -headViewHeight) {
        CGRect f = self.storeHeadView.frame;
        f.origin.y= yOffset;
     //   NSLog(@"%fAAAAAAAAAAAAAA%f", f.origin.y, headViewHeight);
        self.storeHeadView.frame= f;
    }
}

-(StoreHeadView *)storeHeadView {
    if (_storeHeadView == nil) {
        _storeHeadView= [[StoreHeadView alloc]init];
        _storeHeadView.frame = CGRectMake(0, -150, kScreen_widht, 150);
        _storeHeadView.userInteractionEnabled = YES;
    }
    return _storeHeadView;
}

-(UITableView *)mainTableView {
    if (mainTableView == nil)
    {
        mainTableView= [[MainTouchTableTableView alloc]initWithFrame:CGRectMake(0,64,Main_Screen_Width,Main_Screen_Height-64)];
        mainTableView.delegate=self;
        mainTableView.dataSource=self;
        mainTableView.bounces = NO;
        mainTableView.showsVerticalScrollIndicator = NO;
        mainTableView.contentInset = UIEdgeInsetsMake(headViewHeight,0, 0, 0);
        mainTableView.backgroundColor = [UIColor redColor];
    }
    return mainTableView;
}

#pragma marl -tableDelegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return Main_Screen_Height-64;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
   
        
    [cell.contentView addSubview:self.setPageViewControllers];
    
    return cell;
}
/*
 *这里可以任意替换你喜欢的pageView
 */
-(UIView *)setPageViewControllers {
    
    if (!_RCSegView) {
        StoreDetaileVC * First=[[StoreDetaileVC alloc]init];
        ShopGoodsListVC * Third=[[ShopGoodsListVC alloc]init];
     //   ShopFrontPageVC* Second=[[ShopFrontPageVC alloc]init];
        
        NSArray *controllers=@[Third,First];
        
        NSArray *titleArray =@[@"全部商品",@"店铺信息"];
        
        MYSegmentView * rcs=[[MYSegmentView alloc]initWithFrame:CGRectMake(0, 0, Main_Screen_Width, Main_Screen_Height-64) controllers:controllers titleArray:titleArray ParentController:self lineWidth:Main_Screen_Width/5 lineHeight:3.];
        
        _RCSegView = rcs;
    }
    return _RCSegView;
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

//显示网络加载指示器
- (void)indeterminateExample {
    [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];//加载指示器出现
}
//隐藏网络加载指示器
- (void)delayMethod{
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];//加载指示器消失
}


@end
