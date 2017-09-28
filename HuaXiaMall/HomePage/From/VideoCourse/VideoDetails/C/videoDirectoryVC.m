//
//  videoDirectoryVC.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/27.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "videoDirectoryVC.h"
#import "VideoPlaybackShow.h"
#import "VideoPeriodTVCell.h"
#import "VideoContentTVCell.h"

@interface videoDirectoryVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)NSMutableArray *courseArray;
@end

@implementation videoDirectoryVC
- (void)viewWillAppear:(BOOL)animated  {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(self.view.frame.size.width, 64)] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}
- (NSString *)description {
    return @"视频目录";
}
- (NSMutableArray *)courseArray {
    if (!_courseArray) {
        _courseArray = [NSMutableArray array];
    }
    return _courseArray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self setAllAndStoreITV];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.navigationController.navigationItem.title = @"iOS精品教学课程";
    int i = arc4random()%10+ 3;
    for (int j = 0; j < i; j ++) {
        [self.courseArray addObject:@"0"];
    }
    
    [self ConfigurationNavigationBar:@"" titleSize:kFit(18) NavigationBarColor:[UIColor clearColor] titleColor:nil];
    [self navigationBarAddButton:@"0" imageName:@"fanhui"];
    [self navigationBarAddButton:@"1" imageName:@"shoucang"];
    
    
}

- (void)setAllAndStoreITV {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, kScreen_heigth-49-64) style:(UITableViewStylePlain)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"VideoPeriodTVCell" bundle:nil] forCellReuseIdentifier:@"VideoPeriodTVCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"VideoContentTVCell" bundle:nil] forCellReuseIdentifier:@"VideoContentTVCell"];

    [self.view addSubview:_tableView];
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return _courseArray.count;
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (self.courseArray.count == 0) {
            return 0;
    }else {
        NSString *stateStr = self.courseArray[section];
        if ([stateStr isEqualToString:@"0"]) {
            return 1;
        }else {
            return 2;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    if (indexPath.row == 0) {
        VideoPeriodTVCell *cell= [tableView dequeueReusableCellWithIdentifier:@"VideoPeriodTVCell" forIndexPath:indexPath];
        if (self.courseArray.count != 0 ) {

            [cell changeEditedState:indexPath editorState:self.courseArray[indexPath.section]];
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
    if ([self.courseArray[indexPath.section] isEqualToString:@"1"]) {
        self.courseArray[indexPath.section] = @"0";
    }else {
        self.courseArray[indexPath.section] = @"1";
    }
    [self.tableView reloadData];
    }else {
    
    
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
        if (indexPath.row == 0) {
            return kFit(36);
        }else {
            return kFit(49);
        }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {

    return 0.01;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {

    return 0.01;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, 0.01)];
    return view;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, 0.01)];
    return view;
}
@end
