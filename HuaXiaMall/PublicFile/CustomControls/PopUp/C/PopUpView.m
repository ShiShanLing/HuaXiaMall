
//
//  PopUpView.m
//  EntityConvenient
//
//  Created by 石山岭 on 2016/12/13.
//  Copyright © 2016年 石山岭. All rights reserved.
//

#import "PopUpView.h"
#import "TyepTableViewCell.h"
#import "NumberTableViewCell.h"
#import "ModifyNumberView.h"

static NSInteger inventory = 1000000;

@interface PopUpView ()<UITableViewDataSource, UITableViewDelegate, ModifyNumberViewDelegate, TyepTableViewCellDelegate>
/**
 *
 */
@property (nonatomic, strong)UITableView *tableView;
/**
 *弹出view的头 因为有圆角所以进行了单独处理
 */
@property (nonatomic, strong)UIView *showView;
/**
 *确认按钮
 */
@property (nonatomic, strong)UIButton * ConfirmBtn;
/**
 *商品图片
 */
@property (nonatomic, strong)UIImageView *GoodsImage;
/**
 *商品名称
 */
@property (nonatomic, strong)UILabel *GoodsName;
/**
 *库存
 */
@property (nonatomic, strong)UILabel *GoodsPrice;
/**
 *商品原价
 */
@property (nonatomic, strong)UILabel *GoodsOriginalPrice;
/**
 *规格选择记录
 */
@property (nonatomic, strong)NSMutableArray *typeChooseID;
/**
 *规格选择记录
 */
@property (nonatomic, strong)NSMutableArray *typeChooseName;
/**
 *存储当前选择规格 库存 价格
 */
@property (nonatomic, strong)NSMutableDictionary *beSelectedSpecDic;

@end

@implementation PopUpView {
    
    CGFloat cellHeight;
}

- (NSMutableDictionary *)beSelectedSpecDic {
    if (!_beSelectedSpecDic) {
        _beSelectedSpecDic = [NSMutableDictionary dictionary];
    }
    return _beSelectedSpecDic;
}

- (NSMutableArray *)typeChooseID {
    if (!_typeChooseID) {
        _typeChooseID = [NSMutableArray array];
    }
    return _typeChooseID;
}
- (NSMutableArray *)typeChooseName {
    if (!_typeChooseName) {
        _typeChooseName =[NSMutableArray array];
    }
    return _typeChooseName;
}

- (NSMutableArray *)specIDArray {
    if (!_specIDArray) {
        _specIDArray = [NSMutableArray array];
        
    }
    return _specIDArray;
}

- (instancetype)initWithFrame:(CGRect)frame {
    self= [super initWithFrame:frame];
    if (self) {
        
        self.showView= [UIView new];
        _showView.backgroundColor = [UIColor whiteColor];
        _showView.layer.cornerRadius = 3;
        
        [self addSubview:_showView];
        _showView.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self, kFit(-20)).rightSpaceToView(self, 0).heightIs(kFit(115));
        
        self.GoodsImage = [UIImageView new];
        _GoodsImage.layer.cornerRadius = 3;
        _GoodsImage.layer.masksToBounds = YES;
        _GoodsImage.image = [UIImage imageNamed:@"mall"];
        
        [_showView addSubview:_GoodsImage];
        _GoodsImage.sd_layout.leftSpaceToView(_showView, kFit(12)).bottomSpaceToView(_showView, kFit(15)).widthIs(kFit(137)).heightIs(kFit(125));
        
        UIButton *ShutDownBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        UIImage *loginImg = [UIImage imageNamed:@"sc"];
        loginImg = [loginImg imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        [ShutDownBtn setImage:loginImg forState:(UIControlStateNormal)];
        [ShutDownBtn addTarget:self action:@selector(handleShutDownBtn) forControlEvents:(UIControlEventTouchUpInside)];
        [self.showView addSubview:ShutDownBtn];
        ShutDownBtn.sd_layout.rightSpaceToView(self.showView,kFit(0)).topSpaceToView(_showView, kFit(0)).widthIs(kFit(52)).heightIs(kFit(52));
        
        self.GoodsName = [UILabel new];
        self.GoodsName.text =_model.goodsName;
        _GoodsName.textColor = MColor(51, 51, 51);
        
        self.GoodsName.font = MFont(kFit(17));
        
        [self.showView addSubview:_GoodsName];
        _GoodsName.sd_layout.leftSpaceToView(_GoodsImage, kFit(15)).topSpaceToView(_showView, kFit(25)).rightSpaceToView(ShutDownBtn, kFit(15)).heightIs(kFit(17));
        
        self.GoodsPrice = [UILabel new];
        _GoodsPrice.textColor = [UIColor redColor];
        _GoodsPrice.font = [UIFont systemFontOfSize:kFit(17)];
        _GoodsPrice.text = [NSString stringWithFormat:@"¥:%.2f", 300.09];
        [self.showView addSubview:_GoodsPrice];
        _GoodsPrice.sd_layout.leftSpaceToView(_GoodsImage,kFit(15)).topSpaceToView(self.GoodsName, kFit(15)).rightSpaceToView(ShutDownBtn, kFit(15)).heightIs(kFit(17));
        
       
        
        
        self.GoodsOriginalPrice = [UILabel new];
        _GoodsOriginalPrice.textColor = MColor(168, 168, 168);
        _GoodsOriginalPrice.font = MFont(kFit(14));
        _GoodsOriginalPrice.text = @"剩余库存8件";
        [self.showView addSubview:_GoodsOriginalPrice];
        
        _GoodsOriginalPrice.sd_layout.leftSpaceToView(self.GoodsImage, kFit(15)).topSpaceToView(self.GoodsPrice,kFit(10)).rightEqualToView(_GoodsPrice).heightIs(kFit(14));
        
        UILabel *lineLabel = [UILabel new];
        lineLabel.backgroundColor = MColor(238, 238, 238);
        [self addSubview:lineLabel];
        lineLabel.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self.showView, 0).rightSpaceToView(self, 0).heightIs(0.5);

        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, kFit(95.5), kScreen_widht, self.frame.size.height - kFit(150)) style:(UITableViewStylePlain)];
        [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"UITableViewCell"];
        //_tableView.backgroundColor = kNavigation_Color;
        [self.tableView registerClass:[TyepTableViewCell class] forCellReuseIdentifier:@"TyepTableViewCell"];
        [self.tableView registerClass:[NumberTableViewCell class] forCellReuseIdentifier:@"NumberTableViewCell"];
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.showsHorizontalScrollIndicator = NO;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.rowHeight = kScreen_heigth/4.764286;
        [_tableView setBounces:NO];
        [self addSubview:self.tableView];
        //确认按钮
        self.ConfirmBtn = [UIButton buttonWithType:(UIButtonTypeSystem)];
        [_ConfirmBtn setTitle:@"确认" forState:(UIControlStateNormal)];
        _ConfirmBtn.backgroundColor = kNavigation_Color;
        _ConfirmBtn.titleLabel.font = [UIFont systemFontOfSize:kFit(18)];

        [_ConfirmBtn addTarget:self action:@selector(handleGoodsDetermine:) forControlEvents:(UIControlEventTouchUpInside)];
        [_ConfirmBtn  setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [self addSubview:_ConfirmBtn];
        _ConfirmBtn.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self.tableView, 0).rightSpaceToView(self, 0).bottomSpaceToView(self, 0);

    }
    return self;
}

/**
 *我在这个方法里面给控件赋值
 */
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
 
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSDictionary *TextDic = (NSDictionary *)_model.goodsSpec;
    NSArray * TextArray = [TextDic allKeys];
    return TextArray.count + 1;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *TextDic = (NSDictionary *)_model.goodsSpec;
    NSArray * TextArray = [TextDic allKeys]; //获取有多少种规格
    if (indexPath.row == TextArray.count) {//数量加减cell
        NumberTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NumberTableViewCell"forIndexPath:indexPath];
        cell.ModifyNumberView.delegate = self;
        cell.ModifyNumberView.numberTF.text = [NSString stringWithFormat:@"%ld", (long)self.goodsNum];
       // NSLog(@"cellForRowAtIndexPath%ld", (long)self.goodsNum);
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        return cell;
    }else {//规格选择cell
        TyepTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TyepTableViewCell"forIndexPath:indexPath];
        NSDictionary *TextDic = _model.goodsSpec;
        NSArray * TextArray = [TextDic allKeys];
        
        [cell PhotoNamesDic:TextDic[TextArray[indexPath.row]] title:TextArray[indexPath.row] indexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.delegate = self;
        return cell;
    }
}
#pragma mark TyepTableViewCellDelegate
- (void)typeSubscript:(OrderBtn *)sender {
    
}
//这里需要根据规格值的多少来动态调整cell的高度
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return kFit(66);
}
//隐藏视图
- (void)handleShutDownBtn {
    if ([_delegate respondsToSelector:@selector(hiddenView)]) {
        [_delegate hiddenView];
    }
}
//确认按钮
- (void)handleGoodsDetermine:(UIButton *)sender {
    

      if ([_delegate respondsToSelector:@selector(DetermineBtnClick:typeID:typeName:goodsNum:)]) {
        [_delegate DetermineBtnClick:sender typeID:_typeChooseID typeName:_typeChooseName goodsNum:self.goodsNum];
        }
    
}
//数量加减
- (void)GoodsNumberChange:(UIButton*)sender view:(ModifyNumberView *)view {
    //如果是减 那么商品数量 -= 1
    if (sender.tag == 201) {
        if (self.goodsNum != 1) {
            self.goodsNum --;
        }
    }
    //如果是加 那么商品数量 += 1
    if (sender.tag == 202) {
        self.goodsNum ++;
    }
    view.numberTF.text  = [NSString stringWithFormat:@"%ld", (long)self.goodsNum];
    //[self.tableView reloadData];
}

//系统提示的弹出窗
- (void)timerFireMethod:(NSTimer*)theTimer {//弹出框
    UIAlertView *promptAlert = (UIAlertView*)[theTimer userInfo];
    [promptAlert dismissWithClickedButtonIndex:0 animated:NO];
    promptAlert =NULL;
}
- (void)showAlert:(NSString *) _message{//时间
    UIAlertView *promptAlert = [[UIAlertView alloc] initWithTitle:@"提示:" message:_message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0f
                                     target:self
                                   selector:@selector(timerFireMethod:)
                                   userInfo:promptAlert
                                    repeats:YES];
    [promptAlert show];
}

@end
