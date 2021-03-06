//
//  RecipientDetailsTVCell.m
//  EntityConvenient
//
//  Created by 石山岭 on 2016/12/19.
//  Copyright © 2016年 石山岭. All rights reserved.
//

#import "RecipientDetailsTVCell.h"

@implementation RecipientDetailsTVCell


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        UILabel *segmentationLabel = [UILabel new];
        segmentationLabel.backgroundColor = MColor(210, 210, 210);
        [self.contentView addSubview:segmentationLabel];
        segmentationLabel.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(self.contentView, 0).rightSpaceToView(self.contentView, 0).heightIs(0.5);
        
        UILabel *titleLabel = [UILabel new];
        titleLabel.text = @"发票内容";
        titleLabel.font = MFont(kFit(15));
        [self.contentView addSubview:titleLabel];
        titleLabel.sd_layout.leftSpaceToView (self.contentView, kFit(12)).topSpaceToView(self.contentView, kFit(17)).widthIs(kFit(100)).heightIs(kFit(15));
        
        UIButton *personalBtn = [UIButton new];//个人发票
        personalBtn.tag = 251;
        [personalBtn setImage:[self imageRendering:@"gxq"] forState:(UIControlStateNormal)];
        
        personalBtn.titleLabel.font= MFont(kFit(14));
        [personalBtn setTitle:@"个人" forState:(UIControlStateNormal)];
        [personalBtn setTitleColor:MColor(51, 51, 51) forState:(UIControlStateNormal)];
        UIEdgeInsets frame;
        frame = personalBtn.imageEdgeInsets ;
        frame.right += 10;
        personalBtn.imageEdgeInsets = frame;
        [personalBtn addTarget:self action:@selector(handlePersonalBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:personalBtn];
        personalBtn.sd_layout.leftSpaceToView (self.contentView, 0).topSpaceToView(titleLabel, kFit(7.5)).widthIs(kFit(82)).heightIs(kFit(33));
        
        UIButton *enterpriseBtn = [UIButton new];//不开发票
        enterpriseBtn.tag = 252;
        [enterpriseBtn setImage:[self imageRendering:@"gxh"] forState:(UIControlStateNormal)];
        
        enterpriseBtn.titleLabel.font= MFont(kFit(14));
        [enterpriseBtn setTitle:@"公司" forState:(UIControlStateNormal)];
        [enterpriseBtn setTitleColor:MColor(51, 51, 51) forState:(UIControlStateNormal)];
        
        enterpriseBtn.imageEdgeInsets = frame;
        [enterpriseBtn addTarget:self action:@selector(handleEnterpriseBtn:) forControlEvents:(UIControlEventTouchUpInside)];
        [self.contentView addSubview:enterpriseBtn];
        enterpriseBtn.sd_layout.leftSpaceToView (personalBtn, 0).topEqualToView(personalBtn).widthIs(kFit(82)).heightIs(kFit(33));
        
        self.TF = [UITextField new];
        _TF.layer.cornerRadius = 3;
        _TF.layer.masksToBounds = YES;
        _TF.delegate = self;
        _TF.backgroundColor = MColor(238, 238, 238);
        _TF.font = MFont(kFit(15));
        _TF.returnKeyType = UIReturnKeyDone;
        _TF.placeholder = @"请填写单位名称";
        _TF.font = MFont(kFit(15));
        _TF.textColor = MColor(51, 51, 51);
        _TF.borderStyle = UITextBorderStyleNone;
        [self.contentView addSubview:_TF];
        _TF.sd_layout.leftSpaceToView(self.contentView, kFit(12)).topSpaceToView(enterpriseBtn, 0).heightIs(kFit(35)).rightSpaceToView(self.contentView, kFit(15));
        
        UILabel *bottomSegmentationLabel = [UILabel new];
        bottomSegmentationLabel.backgroundColor = MColor(210, 210, 210);
        [self.contentView addSubview:bottomSegmentationLabel];
        bottomSegmentationLabel.sd_layout.leftSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, kFit(10.5)).rightSpaceToView(self.contentView, 0).heightIs(0.5);
        UIView *BottomView = [UIView new];
        BottomView.backgroundColor = MColor(238, 238, 238);
        [self.contentView addSubview:BottomView];
        BottomView.sd_layout.leftSpaceToView(self.contentView, 0).topSpaceToView(bottomSegmentationLabel, 0).rightSpaceToView(self.contentView, 0).bottomSpaceToView(self.contentView, 0);
    }
    return self;
}
//设置图像渲染方式
- (UIImage *)imageRendering:(NSString *)name{
    UIImage *buttonimage = [UIImage imageNamed:name];
    buttonimage = [buttonimage imageWithRenderingMode:(UIImageRenderingModeAlwaysOriginal)];
    return buttonimage;
}
- (void)handlePersonalBtn:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(RecipientDetails:)]) {
        [_delegate RecipientDetails:1];
    }
}
- (void)handleEnterpriseBtn:(UIButton *)sender {
        if ([_delegate respondsToSelector:@selector(RecipientDetails:)]) {
        [_delegate RecipientDetails:2];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    // 回收键盘
    [textField resignFirstResponder];
    return YES;
}
//每次输入框内的文字有变化都调用该方法
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    NSLog(@"--------%@", string);
    if ([_delegate respondsToSelector:@selector(transmissionCompanyName:)]) {
        [_delegate transmissionCompanyName:string];
    }
    
    return YES;
}

@end
