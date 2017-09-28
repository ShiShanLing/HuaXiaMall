//
//  OfflineCourseDetailsVC.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/7/13.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "OfflineCourseDetailsVC.h"
#import "UIImage+Compress.h"
#import "OfflineCourseDataVC.h"
#import "videoDirectoryVC.h"
#import "RelatedVideoVC.h"
#import "MainTouchTableTableView.h"
#import "MYSegmentView.h"
#import "VideoPlayView.h"//页眉视图
#import "VideoLearningView.h"
#define  kScreen_heigth [UIScreen mainScreen].bounds.size.height//屏幕高度
#define  kScreen_widht  [UIScreen mainScreen].bounds.size.width//屏幕高度

/**
 *展示图片高度
 */
#define headViewHeight    211
/**
 *指示条上间距
 */
#define kTop 64

@interface OfflineCourseDetailsVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) NSArray *childVCs;
@property (nonatomic, strong) UITableViewController *currentVC;
@property (nonatomic, assign) CGFloat oldOffsetY;
@property (nonatomic, strong) VideoPlayView *videoPlayView;
/**
 *视频购买或者 购买view
 */
@property (nonatomic, strong)VideoLearningView * videoLearningView;

@property(nonatomic ,strong)MainTouchTableTableView * mainTableView;
@property (nonatomic, strong) MYSegmentView * RCSegView;

@property(nonatomic,strong)UIImageView * avatarImage;
@property(nonatomic,strong)UILabel *countentLabel;

@property (nonatomic, assign) BOOL canScroll;
@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabView;
@property (nonatomic, assign) BOOL isTopIsCanNotMoveTabViewPre;

@end

@implementation OfflineCourseDetailsVC
@synthesize mainTableView;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(self.view.frame.size.width, 64)] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
    [super.navigationController setNavigationBarHidden:NO];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
    [super.navigationController setNavigationBarHidden:YES];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configurationNavigationBar];
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:kFit(18)]}];//改变导航条标题的颜色与大小
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self.view addSubview:self.mainTableView];
    
    [self.mainTableView addSubview:self.videoPlayView];

    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(acceptMsg:) name:@"leaveTop" object:nil];
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
    
}
//返回上一界面
- (void)handleReturn {
    //请问在改变 UITableView 是否滑动的时候会发生
    [self.navigationController popViewControllerAnimated:YES];
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
  //  NSLog(@"yOffset%f  tabOffsetY%f offsetY%f", yOffset,tabOffsetY, offsetY);
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
        CGRect f = self.videoPlayView.frame;
        f.origin.y=  (yOffset);
        self.videoPlayView.frame= f;
    }
    if (yOffset < -64) {
        self.navigationItem.title = @"";
        [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(self.view.frame.size.width, 64)] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        [super.navigationController setNavigationBarHidden:NO];
    }else {
        self.navigationItem.title = @"iOS线下培训班";
        [[NSNotificationCenter defaultCenter] postNotificationName:@"goTop" object:nil userInfo:@{@"canScroll":@"1"}];
        [self.navigationController.navigationBar setBackgroundImage:nil forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        [self.navigationController.navigationBar setShadowImage:nil];
    }
}

-(VideoPlayView *)videoPlayView {
    if (_videoPlayView == nil) {
        _videoPlayView= [[VideoPlayView alloc]init];
        _videoPlayView.frame = CGRectMake(0, -headViewHeight, kScreen_widht, headViewHeight);
        _videoPlayView.userInteractionEnabled = YES;
    }
    return _videoPlayView;
}

- (VideoLearningView *)videoLearningView {
    if (!_videoLearningView) {
        _videoLearningView = [VideoLearningView videoLearningView];
    }
    return _videoLearningView;
}

-(UITableView *)mainTableView {
    if (mainTableView == nil)
    {
        mainTableView= [[MainTouchTableTableView alloc]initWithFrame:CGRectMake(0,0,kScreen_widht,kScreen_heigth)];
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
    
    return kScreen_heigth-64;
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
        OfflineCourseDataVC * First=[[OfflineCourseDataVC alloc]init];
        RelatedVideoVC * Second = [[RelatedVideoVC alloc] init];
        NSArray *controllers=@[First,Second];
        NSArray *titleArray =@[@"详情介绍", @"相关视频"];
        MYSegmentView * rcs=[[MYSegmentView alloc]initWithFrame:CGRectMake(0, 0, kScreen_widht, kScreen_heigth) controllers:controllers titleArray:titleArray ParentController:self lineWidth:kScreen_widht/5 lineHeight:3.];
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
