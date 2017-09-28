//
//  BuyerOrderDetailsVC.m
//  EntityConvenient
//
//  Created by 石山岭 on 2017/3/13.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "BuyerOrderDetailsVC.h"
#import "OrdersCurrentStateCell.h"
@interface BuyerOrderDetailsVC ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITableView *mainTableView;

@property (nonatomic, copy)NSMutableArray *dataArray;

@end

@implementation BuyerOrderDetailsVC

- (UITableView *)mainTableView {
    if (!_mainTableView) {
        _mainTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, kScreen_heigth) style:(UITableViewStylePlain)];
        [_mainTableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
        _mainTableView.delegate = self;
        _mainTableView.dataSource = self;
        _mainTableView.showsVerticalScrollIndicator = NO;
        _mainTableView.showsHorizontalScrollIndicator = NO;
        _mainTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _mainTableView;
}

- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *returnimage = [UIImage imageNamed:@"return_black"];
    returnimage = [returnimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:returnimage style:UIBarButtonItemStylePlain target:self action:@selector(handleReturn)];//自定义导航条按钮
    self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
    self.view.backgroundColor = MColor(238, 238, 238);
    [self.view addSubview: self.mainTableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return kFit(100);
    
}

/*



*/

@end
