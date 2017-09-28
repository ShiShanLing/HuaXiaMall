//
//  DailyStudyViewController.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/9.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "DailyStudyViewController.h"
#import "VideoCourseTVCell.h"
#import "VideoCourseDetailsVC.h"
#import "OfflineProgramsTVCell.h"
#define cellNum 9
#import "OfflineCourseDetailsVC.h"
static NSInteger courseType;

@interface DailyStudyViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIScrollView *subscriptScrollView;
@end

@implementation DailyStudyViewController


-(void)viewWillAppear:(BOOL)animated {
    [self.navigationController setNavigationBarHidden:YES animated:animated];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, 64)];
    view.backgroundColor =kOrange_Color;
    [self.view addSubview:view];
    UILabel *titlelabel = [[UILabel alloc] init];
    titlelabel.text = @"我的课程";
    titlelabel.textColor = MColor(255, 255, 255);
    titlelabel.font = MFont(kFit(18));
    titlelabel.textAlignment = 1;
    [view addSubview:titlelabel];
    titlelabel.sd_layout.topSpaceToView(view, 33).heightIs(18).widthIs(kScreen_widht).leftSpaceToView(view, 0);
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 84, kScreen_widht, kScreen_heigth-84) style:(UITableViewStyleGrouped)];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"VideoCourseTVCell" bundle:nil] forCellReuseIdentifier:@"VideoCourseTVCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"OfflineProgramsTVCell" bundle:nil] forCellReuseIdentifier:@"OfflineProgramsTVCell"];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self ConfigurationNavigationBar];
    courseType = 1;
       [self.view addSubview:self.tableView];
    NSArray *array=@[@"全部课程",
                     @"线下课程",
                     @"视频课程"];
    CBHeaderChooseViewScrollView*headerView=[[CBHeaderChooseViewScrollView alloc]initWithFrame:CGRectMake(0, 64, kScreen_widht, 40)];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    [headerView setUpTitleArray:array titleColor:nil titleSelectedColor:nil titleFontSize:0];
    __weak DailyStudyViewController *VC = self;
    headerView.btnChooseClickReturn = ^(NSInteger x) {
        NSLog(@"点击了第%ld个按钮",x+1);
        courseType = x + 1;
        [VC.tableView reloadData];
    };
}

- (void)ConfigurationNavigationBar {
    self.navigationController.navigationBar.barTintColor = kOrange_Color;
    self.title = @"今日学习";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:kFit(18)]}];//改变导航条标题的
    
    UIButton *messageBtn = [UIButton new];
    [messageBtn setImage:[UIImage imageNamed:@"gdxx"] forState:(UIControlStateNormal)];
    [messageBtn addTarget:self action:@selector(handleMessageBtn) forControlEvents:(UIControlEventTouchUpInside)];
    UIBarButtonItem *messageButtonItem = [[UIBarButtonItem alloc] initWithCustomView:messageBtn];
    self.navigationItem.rightBarButtonItem = messageButtonItem;
}

- (void)handleMessageBtn {

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return cellNum;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (courseType == 1) {
        int a = arc4random()%11;
        if (a / 2 == 0) {
            VideoCourseTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoCourseTVCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else {
            OfflineProgramsTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OfflineProgramsTVCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }else if(courseType == 2) {
        
        OfflineProgramsTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OfflineProgramsTVCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        VideoCourseTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoCourseTVCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     if (courseType == 1) {
        OfflineCourseDetailsVC *VC = [[OfflineCourseDetailsVC alloc] init];
        [VC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (courseType == 2) {
        OfflineCourseDetailsVC *VC = [[OfflineCourseDetailsVC alloc] init];
        [VC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:VC animated:YES];
    }else if (courseType == 3) {
        VideoCourseDetailsVC *VC = [[VideoCourseDetailsVC alloc] init];
        [VC setHidesBottomBarWhenPushed:YES];
        [self.navigationController pushViewController:VC animated:YES];
    }

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return 150;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, 10)];
    view.backgroundColor = MColor(238, 238, 238);
    return view;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return kFit(10);
}
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, 10)];
    view.backgroundColor = MColor(238, 238, 238);
    return view;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == cellNum-1) {
        return kFit(10);
    }else {
        return 0.01;
    }
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
