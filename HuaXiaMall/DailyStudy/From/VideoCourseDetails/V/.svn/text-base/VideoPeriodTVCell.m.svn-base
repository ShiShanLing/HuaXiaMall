//
//  VideoPeriodTVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/24.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "VideoPeriodTVCell.h"

@interface VideoPeriodTVCell ()

@property (weak, nonatomic) IBOutlet UIView *studyProgressView;

@property (weak, nonatomic) IBOutlet UILabel *studyNameLbael;

@property (weak, nonatomic) IBOutlet UIButton *guideBtn;

@end

@implementation VideoPeriodTVCell {
    HWInstallView *_progressView;

}

-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        
    }
    return self;
}

-(void)layoutSubviews {
    self.studyProgressView.backgroundColor = [UIColor whiteColor];
    _progressView = [[HWInstallView alloc] initWithFrame:CGRectMake(0, 0, kFit(36), kFit(36))];
    _progressView.progress = 0.45;
    [self.studyProgressView addSubview:_progressView];
    _progressView.sd_layout.centerYEqualToView(self.studyProgressView).centerXEqualToView(self.studyProgressView).widthIs(kFit(12)).heightIs(kFit(12));
}
- (void)changeEditedState:(NSIndexPath *)indexPath editorState:(NSString *)state{
    
    if ([state isEqualToString:@"1"]) {
        [self.guideBtn setImage:[UIImage imageNamed:@"sjt"] forState:(UIControlStateNormal)];
    }else {
        [self.guideBtn setImage:[UIImage imageNamed:@"xjt"] forState:(UIControlStateNormal)];
    }
    
    NSString *str;
    str = [str translationArabicNum:indexPath.section];
    self.studyNameLbael.text = [NSString stringWithFormat:@"第 %d 节 青少年广播体操-时代而召唤", indexPath.section];
    _progressView.unfinishedColor = MColor(242, 242, 242);
    UILabel *relevanceLabel = [UILabel new];
    relevanceLabel.backgroundColor = MColor(242, 242, 242);
    [_studyProgressView addSubview:relevanceLabel];
    relevanceLabel.sd_layout.widthIs(1).topSpaceToView(_studyProgressView, kFit(36/2)) .bottomSpaceToView(_studyProgressView, 0).centerXEqualToView(_studyProgressView);
}
@end
