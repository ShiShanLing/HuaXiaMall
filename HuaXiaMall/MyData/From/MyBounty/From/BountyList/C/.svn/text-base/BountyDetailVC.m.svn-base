//
//  BountyDetailVC.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/7/20.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "BountyDetailVC.h"
#import "BountyDetailTVCell.h"
#import "BountyGoodsTVCell.h"
@interface BountyDetailVC ()<UITableViewDelegate, UITableViewDataSource>

@property(nonatomic, strong)UITableView *tableView;
/**
 *
 */
@property (nonatomic, strong)NSMutableArray *dataArray;

@end

@implementation BountyDetailVC

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, kScreen_heigth)style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView registerNib:[UINib nibWithNibName:@"BountyDetailTVCell" bundle:nil] forCellReuseIdentifier:@"BountyDetailTVCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"BountyGoodsTVCell" bundle:nil] forCellReuseIdentifier:@"BountyGoodsTVCell"];
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MColor(242, 242, 242);
    self.navigationItem.title = @"分销订单";
    self.navigationController.navigationBar.barTintColor = kOrange_Color;
    
    self.dataArray =[NSMutableArray arrayWithArray:@[@"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0", @"0"]];
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:kFit(18)]}];
    UIImage *returnimage = [UIImage imageNamed:@"fh"];
    //设置图像渲染方式
    returnimage = [returnimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];//去掉UIButton的渲染色
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:returnimage style:UIBarButtonItemStylePlain target:self action:@selector(handleReturn)];//自定义导航条按钮
    self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
    
    [self.view addSubview:self.tableView];
    
}
- (void)handleReturn {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.dataArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *stateStr = _dataArray[section];
    if ([stateStr isEqualToString:@"0"]) {
        return 1;
    }else {
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        BountyDetailTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BountyDetailTVCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellAccessoryNone;
        NSString *stateStr = _dataArray[indexPath.section];
        if ([stateStr isEqualToString:@"0"]) {
            [cell.indicateBtn setImage:[UIImage imageNamed:@"wd-wssj-wldd-xjt"] forState:(UIControlStateNormal)];
        }else {
            [cell.indicateBtn setImage:[UIImage imageNamed:@"wd-wssj-wldd-sjt"] forState:(UIControlStateNormal)];
        }
        
        return cell;
    }else {
        BountyGoodsTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BountyGoodsTVCell" forIndexPath:indexPath];
        return cell;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *tmepStr =self.dataArray[indexPath.section];
    if ([tmepStr isEqualToString:@"0"]) {
    self.dataArray[indexPath.section] = @"1";
    }else {
    self.dataArray[indexPath.section] = @"0";
    }
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return 50;
    }else {
        return 100;
    }
}
//返回页眉高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kFit(5);
}
//返回页眉视图
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, kFit(10))];
    view.backgroundColor = MColor(242, 242, 242);
    return view;
}
//返回页脚高度
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01;
}
//返回页脚视图
-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, 0.01)];
    view.backgroundColor = MColor(242, 242, 242);
    return view;
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
