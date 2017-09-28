//
//  MyFootprintVC.m
//  EntityConvenient
//
//  Created by 石山岭 on 2017/1/16.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "MyFootprintVC.h"
#import "MyFootprintTVCell.h"
#import "EditorMyFootprintTVCell.h"
static int editorState;
@interface MyFootprintVC ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong)UITableView *tableView;
//足迹数量
@property (nonatomic, strong)UILabel * GoodsNumLabel;
/**
 *编辑状态的删除view
 */
@property (nonatomic, strong)UIView *deleteView;
//存储数据的数组
@property (nonatomic, strong)NSMutableArray *DataArray;
@end

@implementation MyFootprintVC

- (void)viewDidLoad {
    [super viewDidLoad];
    NSArray *Array = @[@"0", @"0", @"0", @"0", @"0", @"0", @"0"];
    self.DataArray = [NSMutableArray arrayWithArray:Array];
    [self configurationNavigationBar];
    [self configurationTableView];
    [self editorDeleteView];
}
- (void)configurationNavigationBar{
    self.view.backgroundColor = MColor(234, 234, 234);
    self.navigationItem.title = @"我的店铺";
    UIImage *returnimage = [UIImage imageNamed:@"return_black"];
    //设置图像渲染方式
    returnimage = [returnimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];//去掉UIButton的渲染色
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:returnimage style:UIBarButtonItemStylePlain target:self action:@selector(handleReturn)];//自定义导航条按钮
    self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
    
    UIImage *MoreMoreImage = [UIImage imageNamed:@"morehs"];
    //设置图像渲染方式
    MoreMoreImage = [MoreMoreImage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];//去掉
    UIBarButtonItem *CollectButtonItem = [[UIBarButtonItem alloc] initWithImage:MoreMoreImage style:UIBarButtonItemStylePlain target:self action:@selector(handleCollect)];//自定义导航条按钮
    self.navigationItem.rightBarButtonItems = @[CollectButtonItem];
}
- (void)configurationTableView {
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kFit(44), kScreen_widht, kScreen_heigth) style:(UITableViewStylePlain)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[MyFootprintTVCell class] forCellReuseIdentifier:@"MyFootprintTVCell"];
    [_tableView registerClass:[EditorMyFootprintTVCell class] forCellReuseIdentifier:@"EditorMyFootprintTVCell"];
    [self.view addSubview:_tableView];
    
    UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 64, kScreen_widht, kFit(44))];
    headerView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:headerView];
    self.GoodsNumLabel = [UILabel new];
    _GoodsNumLabel.text = @"全部宝贝(20)";
    _GoodsNumLabel.textColor = MColor(255, 80, 0);
    _GoodsNumLabel.font = MFont(kFit(14));
    [headerView addSubview:_GoodsNumLabel];
    _GoodsNumLabel.sd_layout.leftSpaceToView(headerView,kFit(12)).centerYEqualToView(headerView).widthIs(kFit(200)).heightIs(kFit(14));
    
    UIButton *editorBtn = [UIButton new];
    [editorBtn setTitle:@"编辑" forState:(UIControlStateNormal)];
    [editorBtn setTitle:@"完成" forState:(UIControlStateSelected)];
    [editorBtn setTitleColor:MColor(51, 51, 51) forState:(UIControlStateNormal)];
    editorBtn.titleLabel.font = MFont(kFit(14));
    [editorBtn addTarget:self action:@selector(handleEditorBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [headerView addSubview:editorBtn];
    editorBtn.sd_layout.rightSpaceToView(headerView, 0).topSpaceToView(headerView, 0).bottomSpaceToView(headerView, 0).widthIs(kFit(62));
}
//编辑按钮
- (void)handleEditorBtn:(UIButton *)sender {
    
    sender.selected = !sender.selected;
    
    if (sender.selected) {
        _deleteView.hidden = NO;
        editorState = 1;
    }else {
        _deleteView.hidden = YES;
        editorState = 0;
    }
    
    [self.tableView reloadData];
    
    
    
}
- (void)editorDeleteView {
    
    self.deleteView = [UIView new];
    _deleteView.hidden = YES;
    [self.view addSubview:_deleteView];
    
    _deleteView.sd_layout.leftSpaceToView(self.view, 0).bottomSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).heightIs(kFit(48));
    
    UIButton *allDeleteBtn = [UIButton new];
    allDeleteBtn.backgroundColor = MColor(95, 100, 97);
    [allDeleteBtn setTitle:@"全部删除" forState:(UIControlStateNormal)];
    [allDeleteBtn setTitleColor:MColor(255, 255, 255) forState:(UIControlStateNormal)];
    [allDeleteBtn addTarget:self action:@selector(handleAllDeleteBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [_deleteView addSubview:allDeleteBtn];
    allDeleteBtn.sd_layout.leftSpaceToView(_deleteView, 0).topSpaceToView(_deleteView, 0).bottomSpaceToView(_deleteView, 0).widthIs(kScreen_widht/2);
    
    UIButton *chooseDeleteBtn = [UIButton new];
    chooseDeleteBtn.backgroundColor = kNavigation_Color;
    [chooseDeleteBtn setTitle:@"删除" forState:(UIControlStateNormal)];
    [chooseDeleteBtn setTitleColor:MColor(255, 255, 255) forState:(UIControlStateNormal)];
    [chooseDeleteBtn addTarget:self action:@selector(handleChooseDeleteBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [_deleteView addSubview:chooseDeleteBtn];
    chooseDeleteBtn.sd_layout.leftSpaceToView(allDeleteBtn, 0).topSpaceToView(_deleteView, 0).bottomSpaceToView(_deleteView, 0).widthIs(kScreen_widht/2);
    
    
}
/**
 *全部收藏商品删除
 */
- (void)handleAllDeleteBtn:(UIButton *)sender {
    
    [_DataArray removeAllObjects];
    [self.tableView reloadData];
}
/**
 *删除选中的商品
 */
- (void)handleChooseDeleteBtn:(UIButton *)sender {
    
    NSArray *array = [NSMutableArray arrayWithArray:_DataArray];
    [_DataArray removeAllObjects];
    NSLog(@"%@---%@ 删除测试", _DataArray, array);
    for (int i = 0 ; i <array.count; i ++) {
        
        NSString *str = array[i];
        
        if ([str isEqualToString:@"1"]) {//吧选择的商品ID放到一个数组里面
            
            
        }else {
            
            [_DataArray addObject:array[i]];
        }
    }
    
    
    [self.tableView reloadData];
}

- (void)viewWillAppear:(BOOL)animated {
    [super.navigationController setNavigationBarHidden:NO];
    editorState = 0;
}
//更多
- (void)handleCollect {
 
    
}
//返回上一界面
- (void)handleReturn {
    
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 4;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editorState == 0) {
        MyFootprintTVCell *cell= [tableView dequeueReusableCellWithIdentifier:@"MyFootprintTVCell" forIndexPath:indexPath];
        cell.selectionStyle= UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        EditorMyFootprintTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"EditorMyFootprintTVCell" forIndexPath:indexPath];
        NSString *str  = _DataArray[indexPath.row];
        if ([str isEqualToString:@"0"]) {
            [cell cellSelected:NO];
        }else {
            [cell cellSelected:YES];
        }
        cell.selectionStyle= UITableViewCellSelectionStyleNone;
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editorState == 1) {
        NSString *str  = _DataArray[indexPath.row];
        if ([str isEqualToString:@"0"]) {
            _DataArray[indexPath.row] = @"1";
        }else {
            _DataArray[indexPath.row] = @"0";
        }
    }
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kFit(127);
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *HeaderView = [[UIView alloc] initWithFrame:CGRectMake(0,0, kScreen_widht, 30)];
    HeaderView.backgroundColor = MColor(238, 238, 238);
    UILabel *titleLabel   = [UILabel new];
    titleLabel.text = [NSString stringWithFormat:@"1月%ld号", section];
    titleLabel.textColor = MColor(51, 51, 51);
    titleLabel.font = MFont(kFit(12));
    [HeaderView addSubview:titleLabel];
    titleLabel.sd_layout.leftSpaceToView(HeaderView, kFit(12)).centerYEqualToView(HeaderView).widthIs(kFit(200)).heightIs(kFit(12));
    return HeaderView;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    
    return kFit(30);
    
}
@end
