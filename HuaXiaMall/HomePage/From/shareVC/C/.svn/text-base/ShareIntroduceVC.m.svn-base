//
//  ShareIntroduceVC.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/19.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "ShareIntroduceVC.h"

@interface ShareIntroduceVC ()

@end

@implementation ShareIntroduceVC

-(void)viewWillAppear:(BOOL)animated {
    [super.navigationController setNavigationBarHidden:NO];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self ConfigurationNavigationBar];
}
//配置导航条
- (void)ConfigurationNavigationBar {
    
    self.navigationController.navigationBar.barTintColor = kOrange_Color;
    self.title = @"今日学习";
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor], NSFontAttributeName:[UIFont systemFontOfSize:kFit(18)]}];//改变导航条标题的
    
    UIImage *returnimage = [UIImage imageNamed:@"fanhui"];
    //设置图像渲染方式
    returnimage = [returnimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];//去掉UIButton的渲染色
    UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:returnimage style:UIBarButtonItemStylePlain target:self action:@selector(handleReturn)];//自定义导航条按钮
    UIButton *btn = [UIButton new];
    btn.userInteractionEnabled = NO;
    self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
}
-(void)handleReturn {

    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)ShareMoney:(UITapGestureRecognizer *)sender {
    
}
- (IBAction)MyCommission:(UITapGestureRecognizer *)sender {
    
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
