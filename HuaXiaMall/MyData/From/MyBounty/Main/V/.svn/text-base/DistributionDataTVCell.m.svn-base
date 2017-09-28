//
//  DistributionDataTVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/7/19.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "DistributionDataTVCell.h"

@interface DistributionDataTVCell ()
/**
 *可用的佣金
 */
@property (weak, nonatomic) IBOutlet UILabel *AvailableBountyLabel;
/**
 *用户头像
 */
@property (weak, nonatomic) IBOutlet UIImageView *userImage;

@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
/**
 *用户入会时间
 */
@property (weak, nonatomic) IBOutlet UILabel *userEnrollmentTimeLabel;
/**
 *累计佣金
 */
@property (weak, nonatomic) IBOutlet UILabel *cumulativeBountyLabel;
/**
 *提现按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *withdrawalBtn;

@end

@implementation DistributionDataTVCell

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}
-(void)layoutSubviews {
    self.withdrawalBtn.layer.borderWidth = 1;
    self.withdrawalBtn.layer.borderColor = [UIColor whiteColor].CGColor;
}
/**
 *提现按钮
 */
- (IBAction)handleWithdraw:(UIButton *)sender {
    
    if ([_delegate respondsToSelector:@selector(WithdrawApplyFor)]) {
        [_delegate WithdrawApplyFor];
    }
}
/**
 *进入分销信息
 */
- (IBAction)handleDistributionDataDisplay:(UIButton *)sender {
}

@end
