//
//  NSObject+UIVC_PopupWindow.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/10.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *给UIViewController 添加分类 弹窗  配置导航条
 */
@interface BaseViewController (UIVC_PopupWindow)
/**
 *判断网络状态  0 未知网络 1没网 3 流量  4 wifi
 */
- (NSInteger)NetworkDetermine;
/**
 *弹窗
 */
- (void)showAlert:(NSString *)message time:(CGFloat)time;
/**
 *typeStr 0 为左 1位右
 */
- (void)navigationBarAddButton:(NSString *)typeStr imageName:(NSString *)image;
/**
 *  title 导航条标题  size 导航条字体大小   第一个color 导航条颜色  第二个color 导航条字体颜色
 */
- (void)ConfigurationNavigationBar:(NSString *)title titleSize:(CGFloat)size NavigationBarColor:(UIColor *)NavigationBarColor titleColor:(UIColor *)titleColor;
/**
 *让指示器显示
 */
- (void)indeterminateExample;
/**
 *让指示器消失
 */
- (void)delayMethod;

@end
