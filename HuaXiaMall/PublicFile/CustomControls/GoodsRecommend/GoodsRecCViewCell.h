//
//  GoodsRecCViewCell.h
//  EntityConvenient
//
//  Created by 石山岭 on 2016/12/1.
//  Copyright © 2016年 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CustomBtn;
@class GoodsDetailsModel;
/**
 *分享代理
 */
@protocol GoodsRecCViewCellDelegate <NSObject>

- (void)ShareGoodsSubscript:(NSIndexPath *)indexPath;

@end
/**
 *公用的商品推荐模块
 */
@interface GoodsRecCViewCell : UICollectionViewCell

/**
 *商品图片
 */
@property (nonatomic, strong)UIImageView *goodsImage;
/**
 *商品名称
 */
@property (nonatomic, strong)UILabel *goodsName;
/**
 *商品价格
 */
@property (nonatomic, strong)UILabel *goodsPrice;
/**
 *搜索相似的商品
 */
@property (nonatomic, strong)CustomBtn *searchBtn;

@property (nonatomic, strong)GoodsDetailsModel *model;


@property (nonatomic, weak)id<GoodsRecCViewCellDelegate>delegate;



- (void)ToControlsAssignment:(NSIndexPath *)indexPath;

@end
