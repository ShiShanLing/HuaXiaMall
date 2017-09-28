//
//  GroupBuyBooksCVCell.h
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/23.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import <UIKit/UIKit.h>
/**
 *团购书籍
 */
@interface GroupBuyBooksCVCell : UICollectionViewCell


/**
 *商品图片
 */
@property (nonatomic, strong)UIImageView *goodsImage;
/**
 *商品名称
 */
@property (nonatomic, strong)UILabel *goodsName;
/**
 *商品原价
 */
@property (nonatomic, strong)UILabel *goodsOriginalPrice;
/**
 *商品现价
 */
@property (nonatomic, strong)UILabel *goodsPresentPrice;
/**
 *搜索相似的商品
 */
@property (nonatomic, strong)CustomBtn *searchBtn;

@end
