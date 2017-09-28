//
//  VideoContentTVCell.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/5/25.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "VideoContentTVCell.h"

static NSInteger state;
@interface VideoContentTVCell ()

@property (weak, nonatomic) IBOutlet UIView *studyProgressView;
@property (weak, nonatomic) IBOutlet UILabel *VideoNameLbael;
@property (weak, nonatomic) IBOutlet UILabel *VideoTimeLabel;
@property (nonatomic, strong)UILabel *relevanceLabel;
@end

@implementation VideoContentTVCell {
    HWInstallView *_progressView;
    
}


-(instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        state = 0;
    }
    return self;
}

-(void)layoutSubviews {
    self.studyProgressView.backgroundColor = [UIColor whiteColor];
    
    if (state == 0) {
        self.relevanceLabel = [UILabel new];
        _relevanceLabel.backgroundColor = MColor(242, 242, 242);
        [_studyProgressView addSubview:_relevanceLabel];
        _relevanceLabel.sd_layout.widthIs(1).heightIs(kFit(36)).bottomSpaceToView(_studyProgressView, 0).centerXEqualToView(_studyProgressView);
    }
    _progressView = [[HWInstallView alloc] initWithFrame:CGRectMake(0, 0, kFit(36), kFit(36))];
    _progressView.progress = 0.45;
    [self.studyProgressView addSubview:_progressView];
              _progressView.sd_layout.centerYEqualToView(self.studyProgressView).centerXEqualToView(self.studyProgressView).widthIs(kFit(12)).heightIs(kFit(12));

}
- (void)finallyAStudy {
    state = 1;
    self.relevanceLabel = [UILabel new];
    _relevanceLabel.backgroundColor = MColor(242, 242, 242);
    [_studyProgressView addSubview:_relevanceLabel];
    _relevanceLabel.sd_layout.widthIs(1).heightIs(kFit(36/2)).topSpaceToView(_studyProgressView, 0).centerXEqualToView(_studyProgressView);
}
@end
