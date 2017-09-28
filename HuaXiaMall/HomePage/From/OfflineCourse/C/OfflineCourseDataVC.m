//
//  OfflineCourseDataVC.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/7/14.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "OfflineCourseDataVC.h"
#import "VideoIntroTVCell.h"
#import "TeacherDataTVCell.h"
#import "TeacherTitleTVCell.h"
#import "ShopIntTVCell.h"
#import "CourseTimeAddressTVCell.h"
@interface OfflineCourseDataVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *modelsArray;

@end

@implementation OfflineCourseDataVC {

NSArray *_textArray;
}

- (void)viewWillAppear:(BOOL)animated  {
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
    [self setAllAndStoreITV];
    NSArray *textArray = @[@"当你的 app 没有提供 3x 的 LaunchImage 时，系统默认进入兼容模式，大屏幕一切按照 320 宽度渲染，屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。",
                           @"当你的 app 没有提供 3x 的 LaunchImage 时",
                           @"但是建议不要长期处于这种模式下，否则在大屏上会显得字大，内容少，容易遭到用户投诉。",
                           @"屏幕宽度返回 320；然后等比例拉伸到大屏。这种情况下对界面不会产生任何影响，等于把小屏完全拉伸。但是建议不要长期处于这种模式下，"
                           ];
    _textArray = textArray;
    self.view.backgroundColor = MColor(242, 242, 242);
}

- (void)setAllAndStoreITV {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, kScreen_heigth-64-40.5) style:(UITableViewStyleGrouped)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"ShopIntTVCell" bundle:nil] forCellReuseIdentifier:@"ShopIntTVCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"VideoIntroTVCell" bundle:nil] forCellReuseIdentifier:@"VideoIntroTVCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TeacherTitleTVCell" bundle:nil] forCellReuseIdentifier:@"TeacherTitleTVCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"TeacherDataTVCell" bundle:nil] forCellReuseIdentifier:@"TeacherDataTVCell"];
    [self.tableView registerClass:[CourseTimeAddressTVCell class] forCellReuseIdentifier:@"CourseTimeAddressTVCell"];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
  //  [self.tableView registerClass:[StudentsCommentTVCell class] forCellReuseIdentifier:@"StudentsCommentTVCell"];
    
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 3;
    }else if(section == 1){
        return 4;
    }else if(section == 2){
        return 4;
    }else{
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            VideoIntroTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoIntroTVCell" forIndexPath:indexPath];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
        }else {
            CourseTimeAddressTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CourseTimeAddressTVCell" forIndexPath:indexPath];
            return cell;
        }
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            TeacherTitleTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeacherTitleTVCell" forIndexPath:indexPath];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
        }else if(indexPath.row == 3){
            UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
            cell.backgroundColor = [UIColor whiteColor];
            return cell;
        } else{
            TeacherDataTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeacherDataTVCell" forIndexPath:indexPath];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
        }
    }else if (indexPath.section == 2) {
        StudentsCommentTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"StudentsCommentTVCell" forIndexPath:indexPath];
        cell.text = _textArray[indexPath.row];
        return cell;
    }else{
        ShopIntTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopIntTVCell" forIndexPath:indexPath];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            return 139;
        }else {
        
            return 40;
        }
        
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            return kFit(37);
        }else if(indexPath.row == 3){
            return kFit(44);
        }else{
            return kFit(200);
        }
    }else if (indexPath.section == 2) {
        int index = indexPath.row % 5;
        NSString *str = _textArray[indexPath.row];
        return   [self.tableView cellHeightForIndexPath:indexPath model:str keyPath:@"text" cellClass:[StudentsCommentTVCell class] contentViewWidth:kScreen_widht];
        
    }else{
        return kFit(229);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section != 0) {
        return 10;
    }else {
        return 0.01;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    
    return 0.01;
    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, 0.01)];
    view.backgroundColor = MColor(238, 238, 238);
    return view;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, 0.01)];
    return view;
}


@end
