//
//  TimeLimitSnapUpTVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/7/17.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "TimeLimitSnapUpTVCell.h"
#import "CustomProgress.h"
@interface TimeLimitSnapUpTVCell ()
/**
 *商品展示图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *GoodsImage;
/**
 *商品名字
 */
@property (weak, nonatomic) IBOutlet UILabel *GoodsNameLabel;
/**
 *商品副标题
 */
@property (weak, nonatomic) IBOutlet UILabel *GoodsViceTitleLabel;
/**
 *商品现价
 */
@property (weak, nonatomic) IBOutlet UILabel *GoodsPresentPriceLabel;
/**
 *商品原价
 */
@property (weak, nonatomic) IBOutlet UILabel *GoodsOriginalPriceLabel;
/**
 *商品的销售进度
 */
@property (weak, nonatomic) IBOutlet UIView *SnapUpProgressView;
/**
 *商品销售多少件了
 */
@property (weak, nonatomic) IBOutlet UILabel *SellQuantityLabel;
/**
 *去抢购  这个控件 要根据商品不同的状态 显示的状态不一样
 */
@property (weak, nonatomic) IBOutlet UIButton *GoBuyBtn;

/**
 *
 */
@property (nonatomic, strong)CustomProgress *customProgress;

@end

@implementation TimeLimitSnapUpTVCell

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self= [super initWithCoder:aDecoder];
    if (self) {

    }
    return self;
}

-(void)layoutSubviews {
    [self.GoBuyBtn setBackgroundImage:[UIImage imageNamed:@"RedBackground"] forState:(UIControlStateNormal)];

    NSMutableAttributedString *OriginalPriceStr = [[NSMutableAttributedString alloc] initWithString:@"100.34"];
    [OriginalPriceStr addAttributes:@{NSForegroundColorAttributeName:MColor(150, 150, 150),NSStrikethroughStyleAttributeName:@(NSUnderlineStyleSingle|NSUnderlinePatternSolid),NSStrikethroughColorAttributeName:MColor(150, 150, 150)} range:NSMakeRange(0, OriginalPriceStr.length)];
    self.GoodsOriginalPriceLabel.attributedText = OriginalPriceStr;
    
    NSMutableAttributedString *PresentPriceStr = [[NSMutableAttributedString alloc] initWithString:@"30.55"];
    //设置字体颜色
    [PresentPriceStr addAttribute:NSForegroundColorAttributeName value:MColor(255, 40, 40) range:NSMakeRange(0,PresentPriceStr.length)];
    [PresentPriceStr addAttribute:NSFontAttributeName value:MFont(kFit(14)) range:NSMakeRange(0, PresentPriceStr.length-2)];
    [PresentPriceStr addAttribute:NSFontAttributeName value:MFont(kFit(11)) range:NSMakeRange(PresentPriceStr.length-2, 2)];

    self.GoodsPresentPriceLabel.attributedText = PresentPriceStr;
    
    self.customProgress = [[CustomProgress alloc] initWithFrame:CGRectMake(0, 0,95, 13)];
    _customProgress.maxValue = 100;
    //设置背景色
    _customProgress.leftimg.backgroundColor =[UIColor redColor];
    _customProgress.presentlab.textColor = [UIColor whiteColor];
    [self.contentView addSubview:_customProgress];
    _customProgress.sd_layout.leftSpaceToView(self.contentView, 155).bottomSpaceToView(self.contentView, 12).widthIs(95).heightIs(13);
    int progress = arc4random()%50+50;
    _SellQuantityLabel.text = [NSString stringWithFormat:@"还剩%d件", 100-progress];
    [_customProgress setPresent:progress];
    if (progress > 80) {
        _customProgress.presentlab.text = @"即将售罄";
    }
    if (progress == 100) {
        _customProgress.presentlab.text = @"已抢空";
        _SellQuantityLabel.text = @"已卖完";
    }
    
}
@end
