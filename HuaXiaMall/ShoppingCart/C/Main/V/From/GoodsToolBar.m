//
//  GoodsToolBar.m
//  meidianjie
//
//  Created by HYS on 16/1/6.
//  Copyright © 2016年 HYS. All rights reserved.
//

#import "GoodsToolBar.h"

@implementation GoodsToolBar

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor whiteColor];
        _cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = MFont(15);
        [_cancelBtn addTarget:self action:@selector(cancelClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_cancelBtn];
        _cancelBtn.sd_layout.leftSpaceToView(self, 15).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(40);
        
        _chooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_chooseBtn setTitle:@"确定" forState:UIControlStateNormal];
        [_chooseBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        _chooseBtn.titleLabel.font = MFont(15);
        [_chooseBtn addTarget:self action:@selector(chooseClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_chooseBtn];
        _chooseBtn.sd_layout.rightSpaceToView(self, 15).topSpaceToView(self, 0).bottomSpaceToView(self, 0).widthIs(40);
        
    }
    return self;
}

- (void)cancelClick:(UIButton *)sender{
    [self.delegate goodsToolBarCancel:self];
}
- (void)chooseClick:(UIButton *)sender{
    [self.delegate goodsToolBarChoose:self];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
