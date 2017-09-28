//
//  MyBountyVC.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/7/19.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "MyBountyVC.h"
#import "DistributionDataTVCell.h"
#import "DistributionDisplayTVCell.h"
#import "DistributionOrderVC.h"
#import "BountyDetailVC.h"
#import "WithdrawRMBVC.h"
@interface MyBountyVC ()<UITableViewDelegate, UITableViewDataSource, DistributionDataTVCellDelegate>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation MyBountyVC
- (void)viewWillAppear:(BOOL)animated {
    [super.navigationController setNavigationBarHidden:NO];
}
//更多
- (void)handleCollect {
    
    
}
//返回上一界面
- (void)handleReturn {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGPoint offset = _tableView.contentOffset;
    if (offset.y <= 0) {
        offset.y = 0;
    }
    _tableView.contentOffset = offset;
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, kScreen_heigth)style:(UITableViewStyleGrouped)];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        [_tableView registerNib:[UINib nibWithNibName:@"DistributionDataTVCell" bundle:nil] forCellReuseIdentifier:@"DistributionDataTVCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"DistributionDisplayTVCell" bundle:nil] forCellReuseIdentifier:@"DistributionDisplayTVCell"];
    }
    return _tableView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = MColor(242, 242, 242);
    self.navigationItem.title = @"我的分销";
    self.navigationController.navigationBar.barTintColor = kOrange_Color;
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:kFit(18)]}];
    UIImage *returnimage = [UIImage imageNamed:@"fh"];
    //设置图像渲染方式
    returnimage = [returnimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];//去掉UIButton的渲染色
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:returnimage style:UIBarButtonItemStylePlain target:self action:@selector(handleReturn)];//自定义导航条按钮
    self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;

    [self.view addSubview:self.tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0) {
        return 1;
    }else {
        return 3;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        DistributionDataTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DistributionDataTVCell" forIndexPath:indexPath];
        cell.backgroundColor = kOrange_Color;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate =self;
        return cell;
    }
    DistributionDisplayTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DistributionDisplayTVCell" forIndexPath:indexPath];
    NSArray *iconArray = @[@"distribution order", @"extension", @"commission"];
    NSArray *titleArray = @[@"分销订单", @"开始推广", @"佣金明细"];
    cell.titleLabel.text = titleArray[indexPath.row];
    [cell.typeBtn setImage:[UIImage imageNamed:iconArray[indexPath.row]] forState:(UIControlStateNormal)];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            DistributionOrderVC *VC = [[DistributionOrderVC alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
        
        if (indexPath.row == 1) {
            [self showAlert:@"敬请期待" time:1.2];
        }
        if (indexPath.row == 2) {
            BountyDetailVC *VC = [[BountyDetailVC alloc] init];
            [self.navigationController pushViewController:VC animated:YES];
        }
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 257;
    }else {
        return 45;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0.01;
    }else {
    
        return 10;
    }
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, 10)];
    view.backgroundColor = MColor(242, 242, 242);
    return view;
}
- (void)WithdrawApplyFor {
    
    WithdrawRMBVC *VC = [[WithdrawRMBVC alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
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
