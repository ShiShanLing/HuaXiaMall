//
//  ThereNoInternetView.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/6/26.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol ThereNoInternetViewDelegate <NSObject>

- (void)dataRefreshClick;

@end

@interface ThereNoInternetView : UIView

@property (weak, nonatomic) IBOutlet UILabel *networkStatusLabel;

@property (weak, nonatomic) IBOutlet UILabel *markedWordsLabel;

@property (weak, nonatomic) IBOutlet UIButton *refreshBtn;

@property (nonatomic, weak)id<ThereNoInternetViewDelegate>delegate;

@end
