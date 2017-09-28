//
//  ThereNoInternetView.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/6/26.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "ThereNoInternetView.h"

@implementation ThereNoInternetView

-(void)layoutSubviews {
    self.refreshBtn.layer.cornerRadius = 3;
    self.refreshBtn.layer.masksToBounds = YES;
    self.refreshBtn.layer.borderWidth = 1;
    self.refreshBtn.layer.borderColor = MColor(134, 134, 134).CGColor;
}
- (IBAction)handleRefreshBtn:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(dataRefreshClick)]) {
        [_delegate dataRefreshClick];
    }
}

@end
