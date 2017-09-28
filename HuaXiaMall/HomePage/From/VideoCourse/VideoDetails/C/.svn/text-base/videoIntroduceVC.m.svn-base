//
//  videoIntroduceVC.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/27.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "videoIntroduceVC.h"
#import "VideoIntroTVCell.h"
#import "TeacherDataTVCell.h"
#import "TeacherTitleTVCell.h"
#import "ShopIntTVCell.h"
@interface videoIntroduceVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation videoIntroduceVC
- (void)viewWillAppear:(BOOL)animated  {
    [self.navigationController.navigationBar setBackgroundImage:[UIImage imageWithColor:[UIColor clearColor] size:CGSizeMake(self.view.frame.size.width, 64)] forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIImage new]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setBackgroundImage:nil forBarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
     [self setAllAndStoreITV];
   
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
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];

    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else if(section == 1){
        return 4;
    }else {
        return 1;
    }
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        VideoIntroTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"VideoIntroTVCell" forIndexPath:indexPath];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;
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
        }else{
            TeacherDataTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TeacherDataTVCell" forIndexPath:indexPath];
            cell.selectionStyle=UITableViewCellSelectionStyleNone;
            return cell;
        }

    }else{
        ShopIntTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShopIntTVCell" forIndexPath:indexPath];
        cell.selectionStyle=UITableViewCellSelectionStyleNone;
        return cell;

    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 139;
    }else if(indexPath.section == 1){
        if (indexPath.row == 0) {
            return kFit(37);
        }else if(indexPath.row == 3){
            return kFit(44);
        }else{
            return kFit(200);
        }
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
