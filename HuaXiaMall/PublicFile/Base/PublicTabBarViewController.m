//
//  PublicTabBarViewController.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/9.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "PublicTabBarViewController.h"
#import "Reachability.h"
@interface PublicTabBarViewController ()

@property (nonatomic) Reachability *hostReachability;
@property (nonatomic) Reachability *internetReachability;

@end

@implementation PublicTabBarViewController

- (void)viewWillLayoutSubviews {

    CGRect tabFrame = self.tabBar.frame; //self.TabBar is IBOutlet of your TabBar
    tabFrame.size.height = 80;
    tabFrame.origin.y = self.view.frame.size.height - 80;
    self.tabBar.frame = tabFrame;
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreen_widht, 80)];
    view.backgroundColor = [UIColor redColor];

    [self.tabBar addSubview:view];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self AnalysisUserData];
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont fontWithName:@"Helvetica" size:10], NSFontAttributeName, kOrange_Color,NSForegroundColorAttributeName, nil];
    
    HomePageVC *homePageVC =[[HomePageVC alloc] init];
    UINavigationController *NAHomePageVC = [[UINavigationController alloc] initWithRootViewController:homePageVC];
    NAHomePageVC.tabBarItem.title =@"主页";
    [NAHomePageVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kOrange_Color} forState:UIControlStateSelected];
    [NAHomePageVC.tabBarItem setTitleTextAttributes:attributes forState:UIControlStateSelected];
    
    NAHomePageVC.tabBarItem.image= [UIImage imageNamed:@"shouye"];
    NAHomePageVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"shouye-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    DailyStudyViewController *dailyStudyVC = [[DailyStudyViewController alloc] init];
    UINavigationController *NADailyStudyVC = [[UINavigationController alloc] initWithRootViewController:dailyStudyVC];
    NADailyStudyVC.tabBarItem.title = @"今日学习";
    [NADailyStudyVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kOrange_Color} forState:UIControlStateSelected];
    [NADailyStudyVC.tabBarItem setTitleTextAttributes:attributes forState:UIControlStateSelected];
    NADailyStudyVC.tabBarItem.image = [UIImage imageNamed:@"jinrixuexi"];
    NADailyStudyVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"jinrixuexi-1"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    ShoppingCartViewController *shoppingCartVC = [[ShoppingCartViewController alloc] init];
    UINavigationController *NAShoppingCartVC = [[UINavigationController alloc] initWithRootViewController:shoppingCartVC];
    NAShoppingCartVC.tabBarItem.title = @"购物车";
    [NAShoppingCartVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kOrange_Color} forState:UIControlStateSelected];
    [NAShoppingCartVC.tabBarItem setTitleTextAttributes:attributes forState:UIControlStateSelected];
    NAShoppingCartVC.tabBarItem.image = [UIImage imageNamed:@"gwc-1"];
    NAShoppingCartVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"gwc"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    MyViewController *myDataVC = [[MyViewController alloc] init];
    UINavigationController *NAMyDataVC = [[UINavigationController alloc] initWithRootViewController:myDataVC];
    NAMyDataVC.tabBarItem.title = @"我的";
    [NAMyDataVC.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:kOrange_Color} forState:UIControlStateSelected];
    [NAMyDataVC.tabBarItem setTitleTextAttributes:attributes forState:UIControlStateSelected];
    NAMyDataVC.tabBarItem.image = [UIImage imageNamed:@"wd-1"];
    NAMyDataVC.tabBarItem.selectedImage = [[UIImage imageNamed:@"wd"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //1.配置所管理的多个视图控制器
    self.viewControllers = @[NAHomePageVC, NADailyStudyVC, NAShoppingCartVC, NAMyDataVC];//里面放的是控制器
    [self setSelectedIndex:0];//默认显示的界面
    
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object:nil];
    self.internetReachability = [Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    [self updateInterfaceWithReachability:self.internetReachability];
    

}


- (void)AnalysisUserData{
    
    //获取应用程序沙盒的Documents目录
    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    // NSLog(@"paths%@", paths);
    NSString *plistPath = [paths objectAtIndex:0];
    NSString *filename=[plistPath stringByAppendingPathComponent:@"UserLogInState.plist"];
    NSMutableDictionary *userData = [[NSMutableDictionary alloc] initWithContentsOfFile:filename];
    
    NSArray *keyArray =[userData allKeys];
    
    if (keyArray.count == 0) {
        
    }else {
        NSString *URL_Str = [NSString stringWithFormat:@"%@/memberapi/memberDetail",kSHY_100];
        NSMutableDictionary *URL_Dic = [NSMutableDictionary dictionary];
        URL_Dic[@"memberId"] = userData[@"memberId"];
        [UserDataSingleton mainSingleton].userID = userData[@"memberId"];
        AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
        __block PublicTabBarViewController *VC = self;
        [session POST:URL_Str parameters:URL_Dic progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
           // NSLog(@"responseObject%@", responseObject);
            NSString *resultStr = [NSString stringWithFormat:@"%@", responseObject[@"result"]];
            if ([resultStr isEqualToString:@"0"]) {
            }else {
                [VC AnalyticalData:responseObject];
            }
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        }];
    }
}

//解析的登录过后的数据
- (void)AnalyticalData:(NSDictionary *)dic {
    NSString *state = [NSString stringWithFormat:@"%@", dic[@"result"]];
    if ([state isEqualToString:@"1"]) {
        NSDictionary *urseDataDic = dic[@"data"][0];
        [UserDataSingleton mainSingleton].storeID =urseDataDic[@"storeId"];
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"UserLogInState" ofType:@"plist"];
        
        NSMutableDictionary *userData = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
        
        [userData removeAllObjects];
        
        for (NSString *key in urseDataDic[@"member"]) {
            [userData setObject:urseDataDic[@"member"][key] forKey:key];
        }
        //获取应用程序沙盒的Documents目录
        NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
        NSString *plistPath1 = [paths objectAtIndex:0];
        
        //得到完整的文件名
        NSString *filename=[plistPath1 stringByAppendingPathComponent:@"UserLogInState.plist"];
        //输入写入
        [userData writeToFile:filename atomically:YES];
        
        //那怎么证明我的数据写入了呢？读出来看看
        NSMutableDictionary *userData2 = [[NSMutableDictionary alloc] initWithContentsOfFile:filename];
        
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*!
 * Called by Reachability whenever status changes.
 */
- (void) reachabilityChanged:(NSNotification *)note
{
    Reachability* curReach = [note object];
    NSParameterAssert([curReach isKindOfClass:[Reachability class]]);
    [self updateInterfaceWithReachability:curReach];
}


- (void)updateInterfaceWithReachability:(Reachability *)reachability
{

        
    if (reachability == self.internetReachability)
    {
        [self configureReachability:reachability];
    }
    
}


- (void)configureReachability:(Reachability *)reachability
{
    NetworkStatus netStatus = [reachability currentReachabilityStatus];
    BOOL connectionRequired = [reachability connectionRequired];
    NSString* statusString = @"";
    
    switch (netStatus)
    {
        case NotReachable:        {
            statusString = NSLocalizedString(@"Access Not Available", @"Text field text for access is not available");
          //  imageView.image = [UIImage imageNamed:@"stop-32.png"] ;
            [UserDataSingleton mainSingleton].networkState = 0;
            connectionRequired = NO;
            break;
        }
            
        case ReachableViaWWAN:        {
            statusString = NSLocalizedString(@"Reachable WWAN", @"");
           // imageView.image = [UIImage imageNamed:@"WWAN5.png"];
            [UserDataSingleton mainSingleton].networkState = 1;
            break;
        }
        case ReachableViaWiFi:        {
            statusString= NSLocalizedString(@"Reachable WiFi", @"");
            [UserDataSingleton mainSingleton].networkState = 2;
            //imageView.image = [UIImage imageNamed:@"Airport.png"];
            break;
        }
    }
    
    if (connectionRequired)
    {
        NSString *connectionRequiredFormatString = NSLocalizedString(@"%@, Connection Required", @"Concatenation of status string with connection requirement");
        statusString= [NSString stringWithFormat:connectionRequiredFormatString, statusString];
    }
    NSLog(@"statusString%@", statusString);
}

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:kReachabilityChangedNotification object:nil];
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
- (void)ShoppingCellClickEvent{//
    //xia面是弹窗的初始化
    UIViewController *topVC = [self appRootViewController];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, kScreen_heigth - 80, kScreen_widht, 80)];
    view.backgroundColor = [UIColor redColor];
    [topVC.view addSubview:view];
    
    
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
