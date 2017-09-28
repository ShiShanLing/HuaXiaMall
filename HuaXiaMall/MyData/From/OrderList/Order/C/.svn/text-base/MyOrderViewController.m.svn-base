//
//  MyOrderViewController.m
//  EntityConvenient
//
//  Created by 石山岭 on 2017/1/10.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "MyOrderViewController.h"
#import "OrderShopNameTVCell.h"//订单里面的商店名字
#import "OrderGoodsTVCell.h"//订单里面的商品展示
#import "OrderStateTVCell.h"//订单属性
#import "GoodsRecCViewCell.h"//商品推荐
#import "OrderEmptyCVCell.h"
#import "BuyerOrderDetailsVC.h"//订单详情

#define kOrderNum @"10"
#define kGoodsNum 4
#define orderNum 1
/**
 *存储我所点击的那个订单(类型) 0 全部  1待定(商家计算)运费 2 待付款 3已付款未发货 4 已付款已发货但是为用户未收货 5 未评价
 */
static int OrderType;
static int OrderSection;
static int ShowOrderNumber;
/**
 *我的订单界面    ->有五个选项 因为设计不可滑动 所以使用一个uitableIView来实现的  订单的列表是由三部分组成 -- 商店名字  商品 和订单的属性(运费 多少数量多少钱 之类的)
 一个订单是一个分组 每个分组的里面的cell数量是 商品数量+2 (商品名字cell 和 订单的属性cell + 商品数量)
 */
@interface MyOrderViewController ()<UIScrollViewDelegate, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching, OrderStateTVCellDelegate, OrderShopNameTVCellDelegate>

@property (nonatomic, strong)UIView *backImageView1;//规格选择弹出视图的背景色
//不懂这个界面怎么实现的,请看.h里面的说明
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UICollectionView *collectionView;
@property (nonatomic, strong)UIScrollView *subscriptScrollView;
@property (nonatomic, strong)NSMutableArray *DataArray;

@property (nonatomic, strong)NSManagedObjectContext *managedContext;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong)AppDelegate *delegate;

@property (nonatomic, strong)NSMutableArray *orderListArray;

@end

@implementation MyOrderViewController

- (NSMutableArray *)orderListArray {
    if (!_orderListArray) {
        _orderListArray = [NSMutableArray array];
    }
    return _orderListArray;
}

- (NSManagedObjectContext *)managedContext {
    if (!_managedContext) {
        //获取Appdelegate对象
        AppDelegate *delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        _managedContext = delegate.managedObjectContext;
    }
    return _managedContext;
}

- (AppDelegate *)delegate {
    if (!_delegate) {
        _delegate = [[AppDelegate alloc] init];
    }
    return _delegate;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    ShowOrderNumber = orderNum;
    OrderType = (int)self.index;
    self.navigationItem.title = @"我的订单";
    self.DataArray = [NSMutableArray array];
    NSNotificationCenter * center = [NSNotificationCenter defaultCenter];
    //添加当前类对象为一个观察者，name和object设置为nil，表示接收一切通知
    [center addObserver:self selector:@selector(notice:) name:@"return" object:nil];
    NSString *stateStr;
    switch (self.index) {
        case 0://全部
            [self  obtainAllOrderData];
            break;
        case 2://代付款
            [self obtainOrderData:@"10"];
            break;
        case 3://待卖家发货
            [self obtainOrderData:@"20,25,26"];
            break;
        case 4://待买家收货
            [self obtainOrderData:@"28,30"];
            break;
        case 5://待评价
            [self obtainOrderData:@"60"];
            break;
        default:
            break;
    }
    
    
    UIImage *returnimage = [UIImage imageNamed:@"return_black"];
    returnimage = [returnimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:returnimage style:UIBarButtonItemStylePlain target:self action:@selector(handleReturn)];//自定义导航条按钮
    self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
    self.view.backgroundColor = MColor(238, 238, 238);
    
    [self creatScrollview];
}

- (void)notice:(id)sender {
    
    switch (OrderType) {
        case 0://全部
            [self  obtainAllOrderData];
            break;
        case 2://代付款
            [self obtainOrderData:@"10"];
            break;
        case 3://待卖家发货
            [self obtainOrderData:@"20,25,26"];
            break;
        case 4://待买家收货
            [self obtainOrderData:@"28,30"];
            break;
        case 5://待评价
            [self obtainOrderData:@"60"];
            break;
        default:
            break;
    }


}

- (void)handleReturn {
    [self.navigationController popViewControllerAnimated:YES];
}
#pragma mark  指示条编辑
//创建指示按钮
-(void)creatScrollview{
    NSArray*arr=@[@"全部", @"待定运费",@"待付款", @"待发货", @"待收货", @"待评价"];
    for (int i=0; i<arr.count; i++) {
        UIButton*btn=[[UIButton alloc] initWithFrame:CGRectMake(i*(kScreen_widht/arr.count), 64, kScreen_widht/arr.count, 40)];
        btn.backgroundColor = [UIColor whiteColor];
        btn.tag=i + 100;
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        btn.titleLabel.font=[UIFont systemFontOfSize:kFit(14)];
        if (i==self.index) {
            [btn setTitleColor:kNavigation_Color forState:UIControlStateNormal];
        }else
            [btn setTitleColor:MColor(161, 161, 161) forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btn_clicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 64 + kFit(40), kScreen_widht, kFit(2))];
    label.backgroundColor = MColor(255, 255, 255);
    [self.view addSubview:label];
    self.subscriptScrollView=[[UIScrollView alloc] initWithFrame:CGRectMake(kScreen_widht/6*self.index, 64 + kFit(40), kScreen_widht/arr.count, kFit(2))];
    //42.5
    [self.view addSubview:_subscriptScrollView];
    
    _subscriptScrollView.delegate=self;
    _subscriptScrollView.contentSize=CGSizeMake(kScreen_widht*2, kFit(2));
    _subscriptScrollView.showsHorizontalScrollIndicator=NO;
    _subscriptScrollView.showsVerticalScrollIndicator=NO;
    UILabel *subscriptLabel = [UILabel new];
    subscriptLabel.backgroundColor = kNavigation_Color;
    [_subscriptScrollView addSubview:subscriptLabel];
    subscriptLabel.sd_layout.heightIs(kFit(2)).widthIs(kFit(42.5)).topSpaceToView(_subscriptScrollView, 0).centerXEqualToView(_subscriptScrollView);
    
    UILabel *bottomLabel = [UILabel new];
    bottomLabel.backgroundColor = MColor(238, 238, 238);
    [self.view addSubview:bottomLabel];
    bottomLabel.sd_layout.leftSpaceToView(self.view, kFit(0)).topSpaceToView(_subscriptScrollView, 0).rightSpaceToView(self.view, kFit(0)).heightIs(0.5);
    
}
- (void)viewWillAppear:(BOOL)animated {

    [super.navigationController setNavigationBarHidden:NO];
    [self.collectionView reloadData];
    [self.tableView reloadData];

}
- (void)viewWillDisappear:(BOOL)animated {
    [self performSelector:@selector(delayMethod)];
}
//切换订单类型
- (void)btn_clicked:(UIButton *)sender{
    ShowOrderNumber = orderNum;
    for (int i = 0; i <6 ; i ++) {
        UIButton*btn= [self.view viewWithTag:100 + i];
        [btn setTitleColor:MColor(161, 161, 161) forState:UIControlStateNormal];
    }
    switch (sender.tag - 100) {
        case 0://代付款
            [self  obtainAllOrderData];
            break;
        case 1://待定运费
            [self obtainOrderData:@"5"];
            break;
        case 2://待付款
            [self obtainOrderData:@"10"];
            break;
        case 3://待发货
            [self obtainOrderData:@"20,25,26"];
            break;
        case 4://
            [self obtainOrderData:@"28,30"];
            break;
        case 5://待评价
            [self obtainOrderData:@"40"];
            break;
        default:
            break;
    }
    OrderType = (int)(sender.tag - 100);
    int index = (int)(sender.tag - 100);
    [sender setTitleColor:MColor(255, 80, 0) forState:UIControlStateNormal];
    _subscriptScrollView.frame=CGRectMake( kScreen_widht/6*index, 104, kScreen_widht/6, 2);
    [self.collectionView reloadData];
    [self.tableView reloadData];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
- (NSString*)dictionaryToJson:(NSDictionary *)dic //字典转字符串
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}
/**
 *获取全部订单
 */
- (void)obtainAllOrderData {
    [self performSelector:@selector(indeterminateExample)];
    NSString *url_Str = [NSString stringWithFormat:@"%@/orderapi/orderList", kSHY_100];
    NSMutableDictionary *url_Dic = [NSMutableDictionary dictionary];
    url_Dic[@"memberId"]=[UserDataSingleton mainSingleton].userID;
    url_Dic[@"orderState"]= @"";
    url_Dic[@"pageNo"] = [NSString stringWithFormat:@"%d", ShowOrderNumber];
    url_Dic[@"pageSize"] = kOrderNum;//一页多少个
    
    NSString *dataStr = [self dictionaryToJson:url_Dic];//吧字典转成字符串
    NSString *strURLOne = [dataStr stringByReplacingOccurrencesOfString:@" " withString:@""];//去掉字符串中的空格键
    NSString *strURLTwo = [strURLOne stringByReplacingOccurrencesOfString:@"\n" withString:@""];//去掉字符串中的回车键
    NSString *encryptDate=[SecurityUtil encryptAESData:strURLTwo];//加密
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
    dataDic[@"request"] = encryptDate;//创建后台所需要的参数(加密后的)
    __block MyOrderViewController *VC = self;
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session POST:url_Str parameters:dataDic progress:^(NSProgress * _Nonnull uploadProgress) {
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self performSelector:@selector(delayMethod)];
        [_tableView.mj_footer endRefreshing];
        
        [VC AnalyticalOrderListData:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [_tableView.mj_footer endRefreshing];
        [self performSelector:@selector(delayMethod)];
        [self creatCollectionView];
        
        [VC showAlert:@"订单获取失败,请稍后重试"];
    }];

   
    
    
}
/**
 *获取订单数据
 */
- (void)obtainOrderData:(NSString *)state {
    
    [self performSelector:@selector(indeterminateExample)];
    NSString *url_Str = [NSString stringWithFormat:@"%@/orderapi/orderlist", kSHY_100];
    NSMutableDictionary *url_Dic = [NSMutableDictionary dictionary];
    url_Dic[@"memberId"]=[UserDataSingleton mainSingleton].userID;
    url_Dic[@"status"]= state;//订单状态
    url_Dic[@"orderType"]= @"1";//有没有付款
    url_Dic[@"pageNo"] = [NSString stringWithFormat:@"%d", ShowOrderNumber];//第几页
    url_Dic[@"pageSize"] = kOrderNum;//一页多少个
    __block MyOrderViewController *VC = self;
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [session POST:url_Str parameters:url_Dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [_tableView.mj_footer endRefreshing];
        NSString *resultStr = [NSString stringWithFormat:@"%@", responseObject[@"result"]];
        if ([resultStr isEqualToString:@"1"]) {
            [self performSelector:@selector(delayMethod)];
            
            [VC AnalyticalOrderListDataNojiami:responseObject];
        }else {
            [VC showAlert:@"获取失败请重试"];
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [_tableView.mj_footer endRefreshing];
        [self creatCollectionView];
        [self performSelector:@selector(delayMethod)];
        [VC showAlert:@"订单信息获取失败,请稍后重试"];
    }];

}
//不加密的用法
- (void)AnalyticalOrderListDataNojiami:(NSDictionary *)data {
    [self.orderListArray removeAllObjects];
    NSArray * OrderListArray = data[@"data"];//获取商店数组加密后的数据
    for (NSDictionary *storeDic in OrderListArray) {
        NSEntityDescription *storeDes = [NSEntityDescription entityForName:@"BuyersOrderListModel" inManagedObjectContext:self.managedContext];
        BuyersOrderListModel *storeModel = [[BuyersOrderListModel alloc] initWithEntity:storeDes insertIntoManagedObjectContext:self.managedContext];
        for (NSString *storeKey in storeDic) {
            if ([storeKey isEqualToString:@"orderGoodsList"]) {//如果列表时商品
                
                NSArray *goodsListArray = storeDic[storeKey];
                NSMutableArray *GoodsModelArray = [NSMutableArray array];
                for (NSDictionary * goodsDic in goodsListArray) {
                    NSEntityDescription *goodsDes = [NSEntityDescription entityForName:@"BuyersOrderGoodsModel" inManagedObjectContext:self.managedContext];
                    BuyersOrderGoodsModel *goodsModel = [[BuyersOrderGoodsModel alloc] initWithEntity:goodsDes insertIntoManagedObjectContext:self.managedContext];
                    
                    for (NSString *goodsKey in goodsDic) {
                        //  NSLog(@"goodsModel%@,.,.,.,.%@",goodsDic[goodsKey] , goodsKey);
                        [goodsModel setValue:goodsDic[goodsKey] forKey:goodsKey];
                    }
                    [GoodsModelArray addObject:goodsModel];
                    
                }
                [storeModel setValue:GoodsModelArray forKey:storeKey];
            }else {
                [storeModel setValue:storeDic[storeKey] forKey:storeKey];
            }
        }
        [self.orderListArray addObject:storeModel];
    }
    
    if (self.orderListArray.count == 0) {
        
        [self creatCollectionView];
    }else {
        
        [self creatTableView];
    }
    
    [self.tableView reloadData];
    [self.collectionView reloadData];
    if (self.orderListArray.count < ShowOrderNumber) {
        
    }else {
        if (self.orderListArray.count == 0) {
            
        }else {
            [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:(ShowOrderNumber - 1)]atScrollPosition:UITableViewScrollPositionBottom animated:NO];
        }
    }
}
//加密的用法
- (void)AnalyticalOrderListData:(NSDictionary *)data {
    [self.orderListArray removeAllObjects];
    NSString * orderStr = data[@"data"];//获取商店数组加密后的数据
    NSString *nameData=[SecurityUtil decryptAESData:orderStr];//解密数据
    //字符串转字典
    NSData *OrderData = [nameData dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *OrderListArray = [NSJSONSerialization JSONObjectWithData:OrderData options:0 error:nil];
    // NSLog(@"AnalyticalOrderListData%@", OrderListArray);
    for (NSDictionary *storeDic in OrderListArray) {
        
        NSEntityDescription *storeDes = [NSEntityDescription entityForName:@"BuyersOrderListModel" inManagedObjectContext:self.managedContext];
        
        BuyersOrderListModel *storeModel = [[BuyersOrderListModel alloc] initWithEntity:storeDes insertIntoManagedObjectContext:self.managedContext];
        for (NSString *storeKey in storeDic) {
            if ([storeKey isEqualToString:@"orderGoodsList"]) {//如果列表时商品
                
                NSArray *goodsListArray = storeDic[storeKey];
                NSMutableArray *GoodsModelArray = [NSMutableArray array];
                for (NSDictionary * goodsDic in goodsListArray) {
                    NSEntityDescription *goodsDes = [NSEntityDescription entityForName:@"BuyersOrderGoodsModel" inManagedObjectContext:self.managedContext];
                    BuyersOrderGoodsModel *goodsModel = [[BuyersOrderGoodsModel alloc] initWithEntity:goodsDes insertIntoManagedObjectContext:self.managedContext];
                    
                    for (NSString *goodsKey in goodsDic) {
                        //  NSLog(@"goodsModel%@,.,.,.,.%@",goodsDic[goodsKey] , goodsKey);
                        [goodsModel setValue:goodsDic[goodsKey] forKey:goodsKey];
                    }
                    [GoodsModelArray addObject:goodsModel];
                }
                [storeModel setValue:GoodsModelArray forKey:storeKey];
            }else {
                [storeModel setValue:storeDic[storeKey] forKey:storeKey];
            }
        }
        [self.orderListArray addObject:storeModel];
    }
    
    if (self.orderListArray.count == 0) {
        
        [self creatCollectionView];
    }else {
        
        [self creatTableView];
    }
    
    [self.tableView reloadData];
    [self.collectionView reloadData];
    
    if (self.orderListArray.count < ShowOrderNumber) {
        
    }else {
        if (self.orderListArray.count == 0) {
            
        }else {
            [_tableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:(ShowOrderNumber - 1)]atScrollPosition:UITableViewScrollPositionBottom animated:NO];
        }
        
    }
    
    
}

#pragma mark  创建UITableView
- (void)creatTableView {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64 + kFit(42), kScreen_widht, kScreen_heigth-64 - kFit(42)) style:(UITableViewStyleGrouped)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
    [_tableView registerClass:[OrderShopNameTVCell class] forCellReuseIdentifier:@"OrderShopNameTVCell"];
    [_tableView registerClass:[OrderGoodsTVCell class] forCellReuseIdentifier:@"OrderGoodsTVCell"];
    [_tableView registerClass:[OrderStateTVCell class] forCellReuseIdentifier:@"OrderStateTVCell"];
    [self.view addSubview:_tableView];
}
#pragma mark  创建UICollectionView
- (void)creatCollectionView {
    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //添加页眉
    //[layout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    layout.minimumInteritemSpacing = 0;
    layout.minimumLineSpacing = kFit(3);
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64 + kFit(42), kScreen_widht, kScreen_heigth - 64 - kFit(42)) collectionViewLayout:layout];
    _collectionView .dataSource = self;
    _collectionView.delegate = self;
    _collectionView.showsVerticalScrollIndicator = NO;
    
    
    self.collectionView.backgroundColor = [UIColor colorWithRed:238/256.0 green:238/256.0 blue:238/256.0 alpha:1];
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [_collectionView registerClass:[GoodsRecCViewCell class] forCellWithReuseIdentifier:@"GoodsRecCViewCell"];
     [_collectionView registerClass:[OrderEmptyCVCell class] forCellWithReuseIdentifier:@"OrderEmptyCVCell"];
    
    [_collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionReusableView"];
    [self.view addSubview:_collectionView];
}

#pragma mark 用订单  --------------------------这是订单列表有订单的时候使用的方法-----------------------------

#pragma mark UITableViewDataSuorce

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return self.orderListArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return kGoodsNum + 2;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        OrderShopNameTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderShopNameTVCell" forIndexPath:indexPath];
        cell.delegate = self;
        [cell OrderState:OrderType indexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else if (indexPath.row == kGoodsNum + 1) {
        OrderStateTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderStateTVCell" forIndexPath:indexPath];
        cell.delegate = self;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {
        OrderGoodsTVCell *cell = [tableView dequeueReusableCellWithIdentifier:@"OrderGoodsTVCell" forIndexPath:indexPath];
        cell.backgroundColor = MColor(238, 238, 238);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
     BuyersOrderListModel *storeModel = self.orderListArray[indexPath.section];
     NSArray * GoodsModelArray = (NSArray *)storeModel.orderGoodsList;
    if (indexPath.row == 0) {
       
        StoreViewController *VC = [[StoreViewController alloc] init];
        VC.storeStr = storeModel.storeId;
        [self.navigationController pushViewController:VC animated:YES];
    }else if(indexPath.row == GoodsModelArray.count + 1){
        BuyerOrderDetailsVC *VC = [[BuyerOrderDetailsVC alloc] init];
        [self.navigationController pushViewController:VC animated:YES];
    }else{
        BuyersOrderGoodsModel *GoodsModel = GoodsModelArray[indexPath.row-1];
        GoodsDetailsVController *VC = [[GoodsDetailsVController alloc] init];
        VC.goodsID = GoodsModel.goodsId;
        [self.navigationController pushViewController:VC animated:YES];
        
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    BuyersOrderListModel *model = self.orderListArray[indexPath.section];
//    NSArray * GoodsModelArray = (NSArray *)model.orderGoodsList;
    if (indexPath.row == 0) {
        return kFit(40);
    }else if (indexPath.row == kGoodsNum + 1) {
        return kFit(135);
    }else {
        return kFit(92.5);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return kFit(5);
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    UIView *view  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, kFit(5))];
    view.backgroundColor = MColor(238, 238, 238);
    return view;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == self.orderListArray.count - 1) {
        return kFit(5);
    }else {
        return kFit(0.01);
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    UIView *view  = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, kFit(5))];
    view.backgroundColor = MColor(238, 238, 238);
    return view;
}
#pragma mark OrderStateTVCellDelegate 订单编辑
/**
 *显示的最后一个btn 通用的根据自定的btn里面的值 来判断点击的是第几个 点击的cell订单是什么类型的订单
 */
- (void)OrderCommonBtnOne:(OrderBtn *)sender {
    
   

}

#pragma mark   订单确认收货
- (void)ConfirmDeliveryOrders:(NSInteger)index{
    
   
}

/**
 *显示的第二个一个btn 通用的根据自定的btn里面的值 来判断点击的是第几个 点击的cell订单是什么类型的订单
 */
- (void)OrderCommonBtnTwo:(OrderBtn *)sender {
    

    
}

#pragma mark  OrderShopNameTVCellDelegate 订单里面店铺的名字下标
- (void)ShopChoose:(int)index {
}
#pragma mark 没有订单  --------------------------这是订单列表没有订单的时候使用的方法----------------------------
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    if (section == 0) {
        return 1;
    }else {
        return 10;
    }
    
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        OrderEmptyCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"OrderEmptyCVCell" forIndexPath:indexPath];
        cell.backgroundColor = MColor(238, 238, 238);
        return cell;
    }else {
        GoodsRecCViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GoodsRecCViewCell" forIndexPath:indexPath];
        return cell;
    }
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}
//返回cell的高度
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        return CGSizeMake(kScreen_widht, kFit(376));
    }else {
        return CGSizeMake((kScreen_widht-3)/2, kFit(259));
    }
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        UICollectionReusableView *reusableview = nil;
        UICollectionReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionReusableView" forIndexPath:indexPath];
        headerView.backgroundColor = MColor(255, 255, 255);
        UILabel *leftLine = [UILabel new];
        leftLine.backgroundColor = MColor(161, 161, 161);
        [headerView addSubview:leftLine];
        leftLine.sd_layout.leftSpaceToView(headerView, kFit(12)).centerYEqualToView(headerView).widthIs(kFit(115)).heightIs(0.5);
        //------
        UIButton *ioncBtn = [UIButton new];
        UIImage *buttonimage = [UIImage imageNamed:@"sptj"];
        //设置图像渲染方式        buttonimage = [buttonimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
        [ioncBtn setImage:buttonimage forState:(UIControlStateNormal)];
        [headerView addSubview:ioncBtn];
        ioncBtn.sd_layout.leftSpaceToView(leftLine, kFit(15)).topSpaceToView(headerView, 0).bottomSpaceToView(headerView, 0).widthIs(kFit(24));
        //-------
        UILabel *titleLabel = [UILabel new];  titleLabel.textColor = MColor(51, 51, 51);
        titleLabel.text = @"热门推荐";         titleLabel.font = MFont(kFit(15));
        [headerView addSubview:titleLabel];
        titleLabel.sd_layout.leftSpaceToView(ioncBtn, kFit(5)).topSpaceToView(headerView, 0).bottomSpaceToView(headerView, 0).widthIs(kFit(70));
        
        UILabel *rightLine = [UILabel new];
        rightLine.backgroundColor = MColor(161, 161, 161);
        [headerView addSubview:rightLine];
        rightLine.sd_layout.rightSpaceToView(headerView, kFit(12)).centerYEqualToView(headerView).widthIs(kFit(115)).heightIs(0.5);
        
        reusableview = headerView;
        return reusableview;
        
    }else {
        UICollectionReusableView * headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"UICollectionReusableView" forIndexPath:indexPath];
        return headerView;
    }
    
}

//单独返回每一个页眉视图的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    
    if (section == 1) {
        return CGSizeMake(kScreen_widht, 40);
    }else {
        return CGSizeMake(0, 0);
    }
}

//系统提示的弹出窗
- (void)timerFireMethod:(NSTimer*)theTimer {//弹出框
    UIAlertView *promptAlert = (UIAlertView*)[theTimer userInfo];
    [promptAlert dismissWithClickedButtonIndex:0 animated:NO];
    promptAlert =NULL;
}
- (void)showAlert:(NSString *) _message{//时间
    UIAlertView *promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:_message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:@selector(timerFireMethod:)
                                   userInfo:promptAlert
                                    repeats:YES];
    [promptAlert show];
}

//网络加载指示器
- (void)indeterminateExample {
    
    [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];//加载指示器出现
    
}

- (void)delayMethod{
    
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];//加载指示器消失
    
}

#pragma mark PayPopUpViewDelegate 确定支付选择支付方式
//创建一个存在于视图最上层的UIViewController
- (UIViewController *)appRootViewController{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    return topVC;
}
#warning mark  支付的方法
/*
- (void)ShoppingCellClickEvent{//
    
    //xia面是弹窗的初始化
    UIViewController *topVC = [self appRootViewController];
    if (!self.backImageView1) {
        self.backImageView1 = [[UIView alloc] initWithFrame:self.view.bounds];
        self.backImageView1.backgroundColor = [UIColor blackColor];
        self.backImageView1.alpha = 0.3f;
        self.backImageView1.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hiddenView)];
        tapGesture.numberOfTapsRequired=1;
        [self.backImageView1 addGestureRecognizer:tapGesture];
    }
    [topVC.view addSubview:self.backImageView1];
    
    self.popUpView = [[PayPopUpView alloc] initWithFrame:CGRectMake(0, kScreen_heigth, kScreen_widht, kFit(450))];
    BuyersOrderListModel *storemodel = self.orderListArray[OrderSection];
    _popUpView.OrderPrice = storemodel.orderAmount.floatValue;
    self.popUpView.delegate = self;
    [topVC.view addSubview:self.popUpView];
    [UIView animateWithDuration: 0.2 animations:^{
        self.popUpView.frame =CGRectMake(0, kScreen_heigth-kFit(450), kScreen_widht, kFit(450));
    }];
}
//隐藏弹窗
- (void)hiddenView { //调用这个方法不保存选择的数值
    [self.backImageView1 removeFromSuperview];
    [UIView animateWithDuration: 0.2 animations:^{
        self.popUpView.frame =CGRectMake(0, kScreen_heigth * 2, kScreen_widht, kFit(450));
    }];
}
//帮助按钮
- (void)handleHelp {
    IDViewController *VC = [[IDViewController alloc] init];
    UINavigationController *navc = [[UINavigationController alloc] initWithRootViewController:VC];
    [self presentViewController:navc animated:YES completion:nil];
}
#pragma mark -------- 自提付款在这里----------------------
//记录用户点击了那种支付方式 默认为0  3是积分 4是支付宝 5是微信
- (void)DetermineBtnClick:(NSInteger)sender {
    
    [self performSelector:@selector(indeterminateExample)];
    [self.backImageView1 removeFromSuperview];
    [UIView animateWithDuration: 0.2 animations:^{
        self.popUpView.frame =CGRectMake(0, kScreen_heigth * 2, kScreen_widht, kFit(450));
    }];
    BuyersOrderListModel *storemodel = self.orderListArray[OrderSection];
    [self requestOrderDetails:storemodel.orderId payState:sender];
}
#pragma mark -- 支付宝支付和微信支付在这个里面判断
- (void)requestOrderDetails:(NSString *)orderStr payState:(NSInteger)state{
    
    
}

- (void)requestPaymentSignature:(NSString *)price subject:(NSString *)subject outTradeNo:(NSString *)outTradeNo body:(NSString *)body {
    
    
}
*/

@end
