
//
//  MyEvaluationVC.m
//  EntityConvenient
//
//  Created by 石山岭 on 2017/1/16.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "MyEvaluationVC.h"
#import "MyEvaluationTVCell.h"
#import "GoodsEvaluationTVCell.h"
#import "UITableView+SDAutoTableViewCellHeight.h"
@interface MyEvaluationVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *tableView;

@end

@implementation MyEvaluationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configurationNavigationBar];
    [self configurationTableView];
}
- (void)viewWillAppear:(BOOL)animated {
    
    [super.navigationController setNavigationBarHidden:NO];
}
- (void)configurationNavigationBar{
    self.view.backgroundColor = MColor(134,134,134);
    
    self.navigationController.navigationBar.barTintColor = [UIColor whiteColor];//导航条颜色
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor], NSFontAttributeName:[UIFont systemFontOfSize:kFit(18)]}];//改变导航条标题的颜色与大小
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];//去除导航条上图片的渲染色
    self.navigationItem.title = @"我的评价";
    
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"fh.png"] style:UIBarButtonItemStylePlain target:self action:@selector(handleReturn)];//自定义导航条按钮
    self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)handleReturn {
    [self.navigationController popViewControllerAnimated:YES];

}
- (void)configurationTableView {

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, kScreen_heigth) style:(UITableViewStylePlain)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    [_tableView registerClass:[MyEvaluationTVCell class] forCellReuseIdentifier:@"MyEvaluationTVCell"];
    [_tableView registerClass:[GoodsEvaluationTVCell class] forCellReuseIdentifier:@"GoodsEvaluationTVCell"];
    [self.view addSubview:_tableView];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        MyEvaluationTVCell *cell= [tableView dequeueReusableCellWithIdentifier:@"MyEvaluationTVCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        GoodsEvaluationTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GoodsEvaluationTVCell"];
        [cell ControlsAssignment:@"这是测试数据啊,你不用认真的看,,真的不要再看下去了........不要看了求你了,到此为止 警告你不要看了.,,,你竟然还在看.你提醒过你的真不要看了,,,还把既然你看到这里我就不拦着你了 看吧,,你还真看啊..请看--------------------------->我是SB<--"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
 
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        return kFit(163);
    }else {
    return [self cellHeightForIndexPath:indexPath cellContentViewWidth:kScreen_widht tableView:tableView];
    }
    
}
@end
