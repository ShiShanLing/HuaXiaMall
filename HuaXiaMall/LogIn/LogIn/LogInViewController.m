//
//  LogInViewController.m
//  EntityConvenient
//
//  Created by 石山岭 on 2016/12/20.
//  Copyright © 2016年 石山岭. All rights reserved.
//

#import "LogInViewController.h"
#import "InputBoxView.h"
#import "ForgotPasswordVC.h"
@interface LogInViewController ()<UITextFieldDelegate>

@property (nonatomic, strong)UIScrollView *scrollView;
//背景
@property (nonatomic, strong)UIImageView *backgroundImage;

@property (nonatomic, strong)UITextField *NameTF;
@property (nonatomic, strong)UITextField *PassWordTF;
@property (nonatomic, strong)InputBoxView *NameIBV;
@property (nonatomic, strong)InputBoxView *passWordIBV;

@end

@implementation LogInViewController {
    
}



- (void)handleSingleRecognizer{
    
    [_NameIBV.NameTF resignFirstResponder];
    [_passWordIBV.NameTF resignFirstResponder];
}
- (void) registerForKeyboardNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardWillHideNotification object:nil];
}




//键盘出现时
- (void) keyboardWasShown:(NSNotification *) notif{
    NSDictionary *info = [notif userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    
    CGSize size = CGSizeMake(kScreen_widht, kScreen_heigth);
    size.height += keyboardSize.height;
    [UIView animateWithDuration:0.0001 animations:^{
        self.scrollView.contentSize = size;//设置UIScrollView默认显示位置
    }];
    
    [self.scrollView setContentOffset:CGPointMake(0, kFit(130))];//这个 130 是根据视图的高度自己计算出来的
    
}
- (void) keyboardWasHidden:(NSNotification *) notif {
    
    
    [UIView animateWithDuration:0.0001 animations:^{
      self.scrollView.contentSize = CGSizeMake(kScreen_widht, kScreen_heigth);
    }];

    self.scrollView.contentSize = CGSizeMake(kScreen_widht, kScreen_heigth);
    
}
//回收键盘
-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerForKeyboardNotifications];///让界面岁键盘自适应

    self.navigationController.navigationBar.barTintColor = [UIColor blackColor];
    
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];//去除导航条上图片的渲染色
    [self createScrollView];
    self.backgroundImage = [UIImageView new];
    
    _backgroundImage.image = [UIImage imageNamed:@"LogInBJ"];
    UITapGestureRecognizer* singleRecognizer = [[UITapGestureRecognizer alloc] init];
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    [singleRecognizer addTarget:self action:@selector(handleSingleRecognizer)];//回收键盘
    [_backgroundImage addGestureRecognizer:singleRecognizer];
    [self.scrollView addSubview:_backgroundImage];
    _backgroundImage.sd_layout.leftSpaceToView(self.scrollView, 0).topSpaceToView(self.scrollView, 0).rightSpaceToView(self.scrollView, 0).bottomSpaceToView(self.scrollView, 0);
    
    UIImage *buttonimage = [UIImage imageNamed:@"fh"];
    buttonimage = [buttonimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];//去
    UIButton *returnBtn = [UIButton new];
    [returnBtn setImage:buttonimage forState:(UIControlStateNormal)];
    [returnBtn addTarget:self action:@selector(handleReturnBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:returnBtn];
    returnBtn.sd_layout.leftSpaceToView(self.view, 0).topSpaceToView(self.view, kFit(25)).widthIs(kFit(kFit(40))).heightIs(kFit(38));
    
    UIButton *registeredBtn = [UIButton new];
    registeredBtn.titleLabel.font = MFont(kFit(17));
    [registeredBtn setTitle:@"注册" forState:(UIControlStateNormal)];
    [registeredBtn setTitleColor:MColor(210, 210, 210) forState:(UIControlStateNormal)];
    [registeredBtn addTarget:self action:@selector(handleRegisteredBtn:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:registeredBtn];
    registeredBtn.sd_layout.rightSpaceToView(self.view, 0).widthIs(kFit(60)).heightIs(kFit(33)).topSpaceToView(self.view, kFit(30));
    
    UILabel *titleLabel = [UILabel new];
    titleLabel.text = @"登录";
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = MFont(kFit(18));
    titleLabel.textAlignment = 1;
    [self.view addSubview:titleLabel];
    titleLabel.sd_layout.centerXEqualToView(self.view).topSpaceToView(self.view, kFit(30)).widthIs(kFit(100)).heightIs(33);
    
    [self CreatingControls];
}
- (void)createScrollView {
    self.scrollView = [[UIScrollView alloc] init];
    _scrollView.backgroundColor = [UIColor lightGrayColor];
    self.scrollView.bounces = NO;
    UITapGestureRecognizer* singleRecognizer = [[UITapGestureRecognizer alloc] init];
    singleRecognizer.numberOfTapsRequired = 1; // 单击
    [singleRecognizer addTarget:self action:@selector(handleSingleRecognizer)];//回收键盘
    [self.scrollView addGestureRecognizer:singleRecognizer];
    
    [self.view addSubview:self.scrollView];
    self.scrollView.contentSize = CGSizeMake(kScreen_widht, kScreen_heigth - 64);
    self.scrollView.sd_layout.leftSpaceToView(self.view, 0).rightSpaceToView(self.view, 0).topSpaceToView(self.view, -20).bottomSpaceToView(self.view, 0);
}
- (void)viewWillAppear:(BOOL)animated {
    [super.navigationController setNavigationBarHidden:YES];
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [super.navigationController setNavigationBarHidden:YES];
}

- (void)handleReturnBtn {
    [self.navigationController popViewControllerAnimated:YES];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)CreatingControls {
    UIButton *PersonalAccountBtn = [UIButton new];
  //  [PersonalAccountBtn setTitle:@"个人账号" forState:(UIControlStateNormal)];
    [PersonalAccountBtn setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
    [PersonalAccountBtn setTitleColor:MColor(210, 210, 210) forState:(UIControlStateSelected)];
    PersonalAccountBtn.titleLabel.font = MFont(kFit(17));
    PersonalAccountBtn.tag = 320;
    [self.scrollView addSubview:PersonalAccountBtn];
    PersonalAccountBtn.sd_layout.leftSpaceToView(self.scrollView, kFit(57)).topSpaceToView(self.scrollView, kFit(114)).widthIs(kFit(75)).heightIs(kFit(27));
    UILabel *PersonalAccountLabel = [UILabel new];
    PersonalAccountLabel.tag = 330;
    [self.scrollView addSubview:PersonalAccountLabel];
    PersonalAccountLabel.sd_layout.leftEqualToView(PersonalAccountBtn).topSpaceToView(PersonalAccountBtn, kFit(0)).widthIs(kFit(75)).heightIs(kFit(2));
    UIButton *CorporateAccount = [UIButton new];
    [CorporateAccount setTitleColor:[UIColor whiteColor] forState:(UIControlStateSelected)];
    [CorporateAccount setTitleColor:MColor(210, 210, 210) forState:(UIControlStateNormal)];
    CorporateAccount.titleLabel.font = MFont(kFit(17));
    CorporateAccount.tag  = 321;
    [self.scrollView addSubview:CorporateAccount];
      CorporateAccount.sd_layout.leftSpaceToView(PersonalAccountBtn, kFit(65)).topEqualToView(PersonalAccountBtn).widthIs(kFit(75)).heightIs(kFit(27));
    UILabel *CorporateAccountLabel = [UILabel new];
    CorporateAccountLabel.tag = 331;
    CorporateAccountLabel.backgroundColor = [UIColor clearColor];
    [self.scrollView addSubview:CorporateAccountLabel];
    CorporateAccountLabel.sd_layout.leftEqualToView(CorporateAccount).topSpaceToView(CorporateAccount, kFit(0)).widthIs(kFit(75)).heightIs(kFit(2));
    
    self.NameIBV = [InputBoxView new];
    _NameIBV.NameTF.delegate = self;
    _NameIBV.NameTF.returnKeyType = UIReturnKeyDone;
    [self.scrollView addSubview:_NameIBV];
    _NameIBV.sd_layout.leftSpaceToView(self.scrollView, 0).topSpaceToView(CorporateAccountLabel, kFit(66)).rightSpaceToView(self.scrollView, 0).heightIs(kFit(55));
    
    self.passWordIBV = [InputBoxView new];
    _passWordIBV.NameTF.delegate = self;
    _passWordIBV.NameTF.returnKeyType = UIReturnKeyDone;
    UIImage *nameImage = [UIImage imageNamed:@"mima"];
    nameImage = [nameImage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    [_passWordIBV.nameBtn setImage:nameImage forState:(UIControlStateNormal)];
    
    UIColor *color = MColor(210, 210, 210);
    _passWordIBV.NameTF.attributedPlaceholder = [[NSAttributedString alloc] initWithString:@"密码" attributes:@{NSForegroundColorAttributeName: color}];
    _passWordIBV.NameTF.secureTextEntry = YES;
    [self.scrollView addSubview:_passWordIBV];
    _passWordIBV.sd_layout.leftSpaceToView(self.scrollView, 0).topSpaceToView(_NameIBV, kFit(0)).rightSpaceToView(self.scrollView, 0).heightIs(kFit(55));
    
    UIButton *ForgotPasswordBtn = [UIButton new];
    [ForgotPasswordBtn setTitle:@"忘记密码" forState:(UIControlStateNormal)];
    [ForgotPasswordBtn setTitleColor:MColor(210, 210, 210) forState:(UIControlStateNormal)];
    ForgotPasswordBtn.titleLabel.font = MFont(kFit(14));
    [ForgotPasswordBtn addTarget:self action:@selector(handleForgotPasswordBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.scrollView addSubview:ForgotPasswordBtn];
    ForgotPasswordBtn.sd_layout.rightSpaceToView(self.scrollView, 0).topSpaceToView(_passWordIBV, 0).widthIs(kFit(75)).heightIs(kFit(44));
    
    UIButton *LoginBtn = [UIButton new];
    LoginBtn.backgroundColor = kNavigation_Color;
    LoginBtn.titleLabel.font = MFont(kFit(17));
    LoginBtn.layer.cornerRadius = 6;
    LoginBtn.layer.masksToBounds = YES;
    [LoginBtn setTitle:@"立即登录" forState:(UIControlStateNormal)];
    [LoginBtn setTitleColor:MColor(255, 255, 255) forState:(UIControlStateNormal)];
    [LoginBtn addTarget:self action:@selector(handleLigInBtn) forControlEvents:(UIControlEventTouchUpInside)];
    [self.scrollView addSubview:LoginBtn];
    LoginBtn.sd_layout.leftSpaceToView(self.scrollView, kFit(12)).rightSpaceToView(self.scrollView, kFit(12)).topSpaceToView(_passWordIBV, kFit(50)).heightIs(kFit(50));
}

#pragma mark  登录按钮 注册 和 忘记密码按钮
- (NSString*)dictionaryToJson:(NSDictionary *)dic //字典转字符串
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

//登录
- (void)handleLigInBtn {
    
    
    NSString *phoneStr = self.NameIBV.NameTF.text;
    NSString *PasswordStr = self.passWordIBV.NameTF.text;
    __block LogInViewController *VC = self;
    NSString *URL=[NSString stringWithFormat:@"%@/loginapi/login", kSHY_100];
    NSMutableDictionary *URLDIC = [NSMutableDictionary dictionary];
    URLDIC[@"username"] = phoneStr;
    URLDIC[@"password"] =PasswordStr;
    NSString *dataStr = [self dictionaryToJson:URLDIC];//吧字典转成字符串
    NSString *strURLOne = [dataStr stringByReplacingOccurrencesOfString:@" " withString:@""];//去掉字符串中的空格键
    NSString *strURLTwo = [strURLOne stringByReplacingOccurrencesOfString:@"\n" withString:@""];//去掉字符串中的回车键
    NSString *encryptDate=[SecurityUtil encryptAESData:strURLTwo];//加密
    NSMutableDictionary *dataDic = [NSMutableDictionary dictionary];
    dataDic[@"request"] = encryptDate;//创建后台所需要的参数
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    [self indeterminateExample];
    [session POST:URL parameters:dataDic progress:^(NSProgress * _Nonnull uploadProgress) {
        //  NSLog(@"uploadProgress%@", uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [VC delayMethod];
        [VC AnalyticalData:responseObject];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [VC delayMethod];
        [VC showAlert:@"数据请求失败,请重试!" time:1.0];
        
    }];

   
}
//解析的登录过后的数据
- (void)AnalyticalData:(NSDictionary *)dic {
    NSString *state = [NSString stringWithFormat:@"%@", dic[@"result"]];
    
    NSString *codeStr = dic[@"data"];
    NSString *UserDataStr=[SecurityUtil decryptAESData:codeStr];
    NSData *data = [UserDataStr dataUsingEncoding:NSUTF8StringEncoding];
    NSArray *tempDictQueryDiamond = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
    NSDictionary *urseDataDic = tempDictQueryDiamond[0];
    NSLog(@"AnalyticalData%@", urseDataDic);
    if ([state isEqualToString:@"1"]) {
        [self AnalysisUserData:urseDataDic[@"memberId"]];
    }else {
        UIAlertController *alertV = [UIAlertController alertControllerWithTitle:@"抱歉!" message:[NSString stringWithFormat:@"登录失败,%@", codeStr] preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *cancle = [UIAlertAction actionWithTitle:@"好的" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        }];
        [alertV addAction:cancle];
        // 4.控制器 展示弹框控件，完成时不做操作
        [self presentViewController:alertV animated:YES completion:^{nil;}];
    }

    
}

//获取用户详情信息 用来存储到本地判断登录状态
- (void)AnalysisUserData:(NSString *)memberId{
    NSString *URL_Str = [NSString stringWithFormat:@"%@/memberapi/memberDetail",kSHY_100];
    NSMutableDictionary *URL_Dic = [NSMutableDictionary dictionary];
    URL_Dic[@"memberId"] = memberId;
    [self indeterminateExample];
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
    __block LogInViewController *VC = self;
    [session POST:URL_Str parameters:URL_Dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [VC delayMethod];
        [VC AnalyticalDataDetails:responseObject];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [VC showAlert:@"数据请求失败,请重试!" time:1.0];
        [VC delayMethod];
    }];

    
}
//解析用户详情数据 并且存储到本地一份
- (void)AnalyticalDataDetails:(NSDictionary *)dic {
    NSString *state = [NSString stringWithFormat:@"%@", dic[@"result"]];
    if ([state isEqualToString:@"1"]) {
        NSDictionary *urseDataDic = dic[@"data"][0];
        
        NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"UserLogInState" ofType:@"plist"];
        NSMutableDictionary *userData = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
        [UserDataSingleton mainSingleton].storeID =urseDataDic[@"storeId"];
        for (NSString *key in urseDataDic[@"member"]) {
            if ([key isEqualToString:@"memberId"]) {
                [UserDataSingleton mainSingleton].userID = urseDataDic[@"member"][key];
            }
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
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
}
//忘记密码
- (void)handleForgotPasswordBtn {

    [self managedContext];
    NSFetchRequest *request = [[NSFetchRequest alloc] initWithEntityName:@"UserDataModel"];//判断是否登陆, 然后获取会员的信息
    //执行 获取结果
    NSArray *arr1 = [self.managedContext executeFetchRequest:request error:nil];
    NSLog(@"arr1%@", arr1);
    
    //第二次获取判断有没有超过三个.如果是三个 就删除第一个在存进去
    NSFetchRequest *requestTwo = [[NSFetchRequest alloc] initWithEntityName:@"RecentSearchCity"];
    //执行 获取结果
    NSArray *arrTwo = [self.managedContext executeFetchRequest:requestTwo error:nil];
    
    ForgotPasswordVC *VC = [[ForgotPasswordVC alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
    

}
// 注册
- (void)handleRegisteredBtn:(UIButton *)sender {
    RegisteredViewController *VC = [[RegisteredViewController alloc] init];
    [self.navigationController pushViewController:VC animated:YES];
}

- (UIStatusBarStyle)preferredStatusBarStyle { //改变状态条颜色

    return UIStatusBarStyleLightContent;

}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {

    if ([string isEqualToString:@"\n"]) {
        [textField resignFirstResponder];
        return NO;
    }
    return YES;


}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
