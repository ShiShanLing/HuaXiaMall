//
//  NSObject+UIVC_PopupWindow.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/10.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "UIViewController+UIVC_PopupWindow.h"

static NSInteger state;
@implementation BaseViewController (UIVC_PopupWindow)
- (NSInteger)NetworkDetermine {
    __block int a;
    // 1.获得网络监控的管理者
    AFNetworkReachabilityManager *mgr = [AFNetworkReachabilityManager sharedManager];
    // 2.设置网络状态改变后的处理
    [mgr setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        if (status == AFNetworkReachabilityStatusUnknown) {
            a = 0;
        }else if (status == AFNetworkReachabilityStatusNotReachable) {
            a = 1;
        }else if (status == AFNetworkReachabilityStatusReachableViaWWAN) {
            a = 2;
        }else if (status == AFNetworkReachabilityStatusReachableViaWiFi) {
            a = 3;
        }
    }];
    [mgr startMonitoring];
    NSLog(@"viewDidLoad%ld", a);
    return a;
    
}
//系统提示的弹出窗
- (void)timerFireMethod:(NSTimer*)theTimer {//弹出框
    UIAlertView *promptAlert = (UIAlertView*)[theTimer userInfo];
    [promptAlert dismissWithClickedButtonIndex:0 animated:NO];
    promptAlert =NULL;
}

- (void)showAlert:(NSString *)message time:(CGFloat)time {//时间
    UIAlertView *promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    [NSTimer scheduledTimerWithTimeInterval:time
                                     target:self
                                   selector:@selector(timerFireMethod:)
                                   userInfo:promptAlert
                                    repeats:YES];
    [promptAlert show];
}
- (void)navigationBarAddButton:(NSString *)typeStr imageName:(NSString *)image {
    
    if ([typeStr isEqualToString:@"0"]) {
        UIImage *returnimage = [UIImage imageNamed:image];
        //设置图像渲染方式
        returnimage = [returnimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];//去掉UIButton的渲染色
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:returnimage style:UIBarButtonItemStylePlain target:self action:@selector(handleReturn)];//自定义导航条按钮
        UIButton *btn = [UIButton new];
        btn.userInteractionEnabled = NO;
        self.navigationItem.leftBarButtonItem = temporaryBarButtonItem;
    }else {
        UIImage *rightimage = [UIImage imageNamed:image];
        //设置图像渲染方式
        rightimage = [rightimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];//去掉UIButton的渲染色
        UIBarButtonItem *temporaryBarButtonItem = [[UIBarButtonItem alloc] initWithImage:rightimage style:UIBarButtonItemStylePlain target:self action:@selector(handlerightBtn)];//自定义导航条按钮
        UIButton *btn = [UIButton new];
        btn.userInteractionEnabled = NO;
        self.navigationItem.rightBarButtonItem = temporaryBarButtonItem;
    }
    
}

- (void)ConfigurationNavigationBar:(NSString *)title titleSize:(CGFloat)size NavigationBarColor:(UIColor *)NavigationBarColor titleColor:(UIColor *)titleColor{

    self.title = title;
    self.navigationController.navigationBar.barTintColor = NavigationBarColor;
    if (titleColor != nil) {
         [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:titleColor, NSFontAttributeName:[UIFont systemFontOfSize:size]}];//改变导航条标题的
    }

}

-(void)handleReturn {
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)handlerightBtn {

    

}

//显示网络加载指示器
- (void)indeterminateExample {
    [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];//加载指示器出现
}
//隐藏网络加载指示器
- (void)delayMethod{
    [MBProgressHUD hideHUDForView:self.navigationController.view animated:YES];//加载指示器消失
}


@end
