//
//  NotLoggedInView.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/7/21.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "NotLoggedInView.h"

@interface NotLoggedInView ()

@property (weak, nonatomic) IBOutlet UIButton *LogInBtn;


@end

@implementation NotLoggedInView


- (IBAction)loginBtn:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(shoppingCartlogin)]) {
        [_delegate shoppingCartlogin];
    }
}

- (void)layoutSubviews {
    
    self.LogInBtn.layer.cornerRadius = 3;
    self.LogInBtn.layer.masksToBounds= YES;
    self.LogInBtn.layer.borderWidth=1;
    self.LogInBtn.layer.borderColor = MColor(102, 102, 102).CGColor;
}
@end
