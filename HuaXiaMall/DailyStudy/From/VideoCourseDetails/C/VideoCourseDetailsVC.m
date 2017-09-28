//
//  OfflineCourseDetailsVC.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/24.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "VideoCourseDetailsVC.h"
#import "VideoPlaybackShow.h"
#import "VideoPeriodTVCell.h"
#import "VideoContentTVCell.h"
@interface VideoCourseDetailsVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong)NSMutableArray *courseArray;

@property (nonatomic, strong)VideoPlaybackShow *videoPlaybackShow;

@end

@implementation VideoCourseDetailsVC

- (NSMutableArray *)courseArray {
    if (!_courseArray) {
        _courseArray = [NSMutableArray array];
    }
    return _courseArray;

}

- (void)viewWillAppear:(BOOL)animated  {
    [self.navigationController setNavigationBarHidden:NO animated:animated];
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(self.view.frame.size.width, 64)] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}


- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
   [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, kScreen_heigth) style:(UITableViewStyleGrouped)];
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"VideoPeriodTVCell" bundle:nil] forCellReuseIdentifier:@"VideoPeriodTVCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"VideoContentTVCell" bundle:nil] forCellReuseIdentifier:@"VideoContentTVCell"];
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tableViewCell"];
        
        _tableView.dataSource = self;
        _tableView.delegate = self;
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationController.navigationItem.title = @"iOS精品教学课程";
    int i = arc4random()%10+ 3;
    for (int j = 0; j < i; j ++) {
        [self.courseArray addObject:@"0"];
    }
    [self ConfigurationNavigationBar:@"" titleSize:kFit(18) NavigationBarColor:[UIColor clearColor] titleColor:nil];
    [self navigationBarAddButton:@"0" imageName:@"fanhui"];
    [self navigationBarAddButton:@"1" imageName:@"shoucang"];
    [self.view addSubview:self.tableView];
    NSArray *nib = [[NSBundle mainBundle]loadNibNamed:@"VideoPlaybackShowView" owner:self options:nil];
    //得到第一个UIView
    self.videoPlaybackShow = [nib objectAtIndex:0];
    _videoPlaybackShow.frame = CGRectMake(0, 0, kScreen_widht, kFit(280));
    //添加视图
    [self.view addSubview:_videoPlaybackShow];
    [self configurationNavigationBar];
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
- (void)handleReturn {

    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _courseArray.count + 1;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else {
        if (self.courseArray.count == 0) {
            return 0;
        }else {
            
            NSString *stateStr = self.courseArray[section - 1];
            if ([stateStr isEqualToString:@"0"]) {
                return 1;
            }else {
                return 2;
            }
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableViewCell" forIndexPath:indexPath];
        return cell;
    }else {
        if (indexPath.row == 0) {
            VideoPeriodTVCell *cell= [tableView dequeueReusableCellWithIdentifier:@"VideoPeriodTVCell" forIndexPath:indexPath];
            if (self.courseArray.count != 0 && indexPath.section != 0) {
                [cell changeEditedState:indexPath editorState:self.courseArray[indexPath.section-1]];
                }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }else {
            VideoContentTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoContentTVCell" forIndexPath:indexPath];
            if (indexPath.row == 1) {
            [cell finallyAStudy];
            }
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell;
        }
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.courseArray[indexPath.section-1] isEqualToString:@"1"]) {
        self.courseArray[indexPath.section-1] = @"0";
    }else {
        self.courseArray[indexPath.section-1] = @"1";
    }
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return kFit(280);
    }else {
        if (indexPath.row == 0) {
            return kFit(36);
        }else {
            return kFit(49);
        }
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 1 ) {
        return  kFit(10);
    }else if (section == 0 ) {
        return  kFit(0.01);
    }else {
        return 1;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
 
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, kFit(10))];
        view.backgroundColor = MColor(234, 234, 234);
    if (section == 1) {
       
    }else {
        CGRect frame = view.frame;
        frame.size.height = 1;
        view.frame = frame;
    
    }
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, kFit(10))];
    view.backgroundColor = MColor(161, 161, 161);
    return view;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSIndexPath *path =  [_tableView indexPathForRowAtPoint:CGPointMake(scrollView.contentOffset.x, scrollView.contentOffset.y)];
    
    if (path.section == 1) {
        [UIView animateWithDuration: 0.2 animations:^{
            _videoPlaybackShow.frame = CGRectMake(0, kFit(-280), kScreen_widht, kFit(280));
            
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:kOrange_Color size:CGSizeMake(self.view.frame.size.width, 64)] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
            self.navigationItem.title = @"iOS开发精品教学";
            [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        }];
        
    }else if(path.section == 0) {
        
        [UIView animateWithDuration: 0.2 animations:^{
            _videoPlaybackShow.frame = CGRectMake(0, 0, kScreen_widht, kFit(280));
        
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(self.view.frame.size.width, 64)] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
            self.navigationItem.title = @"";
            [self.navigationController.navigationBar setShadowImage:[UIImage new]];
        }];
        
    }
    
    
    NSLog(@"这是第%d行 path%d",path.row, path.section);
    
    
}

@end
