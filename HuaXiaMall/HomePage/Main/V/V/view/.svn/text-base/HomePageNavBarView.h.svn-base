//
//  HomePageNavBarView.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/6/23.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HomePageNavBarViewDeleagte <NSObject>
/**
 *二维码扫描
 */
- (void)QrCodeScanning;
/**
 *我的消息
 */
- (void)MessageRemind;
/**
 *搜索框点击事件
 */
- (void)ClickSearchBox;
@end

@interface HomePageNavBarView : UIView
/**
 *模拟导航条代理
 */
@property (nonatomic, weak)id<HomePageNavBarViewDeleagte>delegate;

@end
