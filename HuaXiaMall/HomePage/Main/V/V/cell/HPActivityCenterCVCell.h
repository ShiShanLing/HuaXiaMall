//
//  HPActivityCenterCVCell.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/10.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HPActivityCenterCVCellDelegate <NSObject>

- (void)HotModuleClickEvent:(NSInteger)index;

@end
/**
 *主页活动版块的cell
 */
@interface HPActivityCenterCVCell : UICollectionViewCell

@property (nonatomic, weak)id<HPActivityCenterCVCellDelegate>delegate;

@property (nonatomic, strong)UIView *shufflingImageView;

@end
