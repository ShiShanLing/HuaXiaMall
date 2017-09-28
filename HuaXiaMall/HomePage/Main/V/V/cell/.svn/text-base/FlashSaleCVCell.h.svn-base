//
//  FlashSaleCVCell.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/11.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CZCountDownView;

@protocol FlashSaleCVCellDelegate <NSObject>
/**
 *查看更多
 */
- (void)viewMore;

/**
 *商品选择
 */
- (void)goodsChoose:(NSIndexPath *)indexPath;
@end

/**
 *限时抢购
 */
@interface FlashSaleCVCell : UICollectionViewCell

@property (nonatomic, strong)CZCountDownView *CountDownView;
@property (nonatomic, weak)id<FlashSaleCVCellDelegate>delegate;
@end
