//
//  DistributionDataTVCell.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/7/19.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol DistributionDataTVCellDelegate <NSObject>

- (void)WithdrawApplyFor;

@end

/**
 *分销信息展示
 */
@interface DistributionDataTVCell : UITableViewCell

@property (nonatomic, weak)id<DistributionDataTVCellDelegate>delegate;

@end
