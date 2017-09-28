
//
//  TimeLimitSnapUpVC.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/7/17.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "TimeLimitSnapUpVC.h"
#import "TimeLimitSnapUpTVCell.h"
#import "TimeChooseView.h"
@interface TimeLimitSnapUpVC ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;

/**
 *
 */
@property (nonatomic, strong)TimeChooseView *timeChooseView;

@end

@implementation TimeLimitSnapUpVC
-(void)viewWillAppear:(BOOL)animated {
    [super.navigationController setNavigationBarHidden:NO];
    
}
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 49+64, kScreen_widht, kScreen_heigth) style:(UITableViewStylePlain)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"TimeLimitSnapUpTVCell" bundle:nil] forCellReuseIdentifier:@"TimeLimitSnapUpTVCell"];
    }
    return _tableView;
}
- (TimeChooseView *)timeChooseView {
    if (!_timeChooseView) {
        _timeChooseView = [[TimeChooseView alloc] initWithFrame:CGRectMake(0, 64, kScreen_widht, 49)];
    }
    return _timeChooseView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self navigationBarAddButton:@"0" imageName:@"baidiganhui"];
    [self ConfigurationNavigationBar:@"限时限购" titleSize:18 NavigationBarColor:[UIColor whiteColor] titleColor:kOrange_Color];
    UIImage *rightimage = [UIImage imageNamed:@"h-xx"];
    //设置图像渲染方式
    rightimage = [rightimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];//去掉UIButton的渲染色
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rightimage style:UIBarButtonItemStylePlain target:self action:@selector(handlerightBtn)];//自定义导航条按钮
    UIButton *btn = [UIButton new];
    btn.userInteractionEnabled = NO;
    self.navigationItem.rightBarButtonItem = temporaryBarButtonItem;
    [self.view addSubview:self.timeChooseView];
    [self.view addSubview:self.tableView];
}
- (void)handlerightBtn {
    [self showAlert:@"敬请期待" time:1.2];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
//返回cell每组的个数
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
     if (section == 0) {
        return 1;
    }else {
        return 10;
    }
}
//返回cell的组数
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
//返回cell
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section ==0 ){
        UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
        NSArray *pathArray = @[
                               @"http://i4.cqnews.net/news/attachement/jpg/site82/2016-08-23/9143505007648195979.jpg",
                               @"http://www.people.com.cn/mediafile/pic/20160830/95/17946987410935083075.jpg",
                               @"http://p.nanrenwo.net/uploads/allimg/160912/8388-160912092346-50.jpg",
                               @"http://upload.cbg.cn/2016/0728/1469695681806.jpg",
                               @"http://image.cnpp.cn/upload/images/20160905/09380421552_400x300.jpg",
                               @"http://cnews.chinadaily.com.cn/img/attachement/jpg/site1/20160729/0023ae82c931190560502f.jpg",
                               ];
        SZCirculationImageView *shufflingView = [[SZCirculationImageView alloc] initWithFrame:CGRectMake(0, 0, cell.width,kFit(116)) andImageURLsArray:pathArray andTitles:nil];
        shufflingView.titleViewStatus = SZTitleViewBottomOnlyPageControl;
        shufflingView.pauseTime = 2.0;
        [cell addSubview:shufflingView];
        return cell;
    }else {
        TimeLimitSnapUpTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TimeLimitSnapUpTVCell" forIndexPath:indexPath];
        return cell;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 128;
    }else {
        return 145;
    }
}

@end
