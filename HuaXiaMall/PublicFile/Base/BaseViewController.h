//
//  BaseViewController.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/6/22.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ThereNoInternetView;

@interface BaseViewController : UIViewController

@property (nonatomic, strong)NSManagedObjectContext *managedContext;

@property (nonatomic, strong)AppDelegate *delegate;
/**
 *判断网络状态
 */
@property (nonatomic, assign)NSInteger networkStatus;
/**
 *
 */
@property (nonatomic, strong)ThereNoInternetView *noInternetView;
@end
