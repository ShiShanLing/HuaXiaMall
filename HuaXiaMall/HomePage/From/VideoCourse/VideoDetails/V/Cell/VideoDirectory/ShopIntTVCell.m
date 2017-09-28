//
//  ShopIntTVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/6/1.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "ShopIntTVCell.h"

@interface ShopIntTVCell ()
/**
 *店铺图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *storeImage;
/**
 *店铺名称
 */
@property (weak, nonatomic) IBOutlet UILabel *storeName;
/**
 *进进入店铺按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *EnterStoreBtn;
/**
 *店铺好评度
 */
@property (weak, nonatomic) IBOutlet UILabel *commentsLabel;
/**
 *店铺课程
 */
@property (weak, nonatomic) IBOutlet UILabel *courseNumLabel;
/**
 *店铺学生数
 */
@property (weak, nonatomic) IBOutlet UILabel *studentsNumLabel;
/**
 *店铺简介
 */
@property (weak, nonatomic) IBOutlet UILabel *storeIntroduceLabel;

@end

@implementation ShopIntTVCell


- (IBAction)handleEnterStoerBtn:(UIButton *)sender {
    
    
    
}

-(void)layoutSubviews {
    self.EnterStoreBtn.layer.borderColor = kOrange_Color.CGColor;
    self.EnterStoreBtn.layer.borderWidth = 1;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
