//
//  TimeChooseView.m
//  HuaXiaMall
//
//  Created by 石山岭 on 2017/7/19.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "TimeChooseView.h"
#import "TimeChooseCVCell.h"
@interface TimeChooseView ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UICollectionViewDataSourcePrefetching, UICollectionViewDelegate>
@property(nonatomic,strong)UICollectionView *collectionView;


@property(nonatomic, strong)NSMutableArray *modelArray;


@end
@implementation TimeChooseView {
    NSString *_timeStr;//当前时间

}

- (NSMutableArray *)modelArray {
    if (!_modelArray) {
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NSInteger index = 0;
        NSString *timeStr;
        NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
        
        // ----------设置你想要的格式,hh与HH的区别:分别表示12小时制,24小时制
        
        [formatter setDateFormat:@"HH"];
        
        //现在时间,你可以输出来看下是什么格式
        
        NSDate *datenow = [NSDate date];
        
        //----------将nsdate按formatter格式转成nsstring
        
        _timeStr = [formatter stringFromDate:datenow];
        //模拟数据时间段  下标 0是时间 下标1是时间的状态(0活动结束.1正在进行,2等待开启) 下标2是默认选择的cell状态
        NSMutableArray *dataArray = [NSMutableArray arrayWithArray:@[@[@"8",@"0", @"0"],@[@"10",@"0",@"0"], @[@"12",@"0",@"0"], @[@"14",@"0",@"0"],@[@"16",@"0",@"0"], @[@"18",@"0",@"0"],@[@"20",@"0",@"0"]]];
        
        for (int i = 0; i<dataArray.count; i ++) {
            NSMutableArray *timeArray = [NSMutableArray arrayWithArray:dataArray[i]];
            NSString *tempTimeStr = timeArray[0];
            int tempTime = tempTimeStr.intValue;
            int currentTime = _timeStr.intValue;
            if (tempTime == currentTime || tempTime == currentTime-1) {
                index = i;
                timeArray[1] = @"1";
                timeArray[2] = @"1";
            }else if (tempTime < currentTime) {
                timeArray[1] = @"0";
            }else
            if (tempTime > currentTime) {
                timeArray[1] = @"2";
            }
            dataArray[i] = timeArray;
        }
        self.modelArray = [NSMutableArray arrayWithArray:dataArray];
        UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
        layout.itemSize = CGSizeMake(75, 49);
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        layout.minimumLineSpacing = 0;
        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, kFit(35), kScreen_widht,frame.size.height) collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate = self;
        _collectionView.dataSource = self;
        _collectionView.scrollsToTop = NO;
        _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.showsHorizontalScrollIndicator = NO;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        [_collectionView registerNib:[UINib nibWithNibName:@"TimeChooseCVCell" bundle:nil] forCellWithReuseIdentifier:@"TimeChooseCVCell"];
        [self addSubview:_collectionView];
        _collectionView.sd_layout.leftSpaceToView(self, 0).topSpaceToView(self,kFit(0)).rightSpaceToView(self, 0).heightIs(frame.size.height);
        
    }
    return self;
}
#pragma mark - UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return _modelArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    TimeChooseCVCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"TimeChooseCVCell" forIndexPath:indexPath];
    cell.backgroundColor = MColor(242, 242, 242);
    NSMutableArray *tempTimeArray = _modelArray[indexPath.row];
    cell.timeLabel.text = [NSString stringWithFormat:@"%@:00", tempTimeArray[0]];
    cell.timeLabel.textColor = MColor(152, 152, 152);
    cell.stateLabel.textColor = MColor(152, 152, 152);
    NSString *stateStr = tempTimeArray[1];
    int state = stateStr.intValue;
    switch (state) {
        case 0:
            cell.stateLabel.text = @"已开场";
            break;
        case 1:
            cell.stateLabel.text = @"抢购进行中";
            break;
        case 2:
            cell.stateLabel.text = @"等待开场";
            break;
        default:
            break;
    }
    if ([tempTimeArray[2] isEqualToString:@"1"]) {
        [collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionLeft];
        cell.stateLabel.textColor = [UIColor whiteColor];
        cell.timeLabel.textColor = [UIColor whiteColor];
        cell.TimeChooseImage.image = [UIImage imageNamed:@"TimeChooseImage"];
        NSLog(@"_modelArray%@", _modelArray);
    }else {
        cell.stateLabel.textColor = MColor(152, 152, 152);
        cell.timeLabel.textColor = MColor(152, 152, 152);
        cell.TimeChooseImage.image = [UIImage imageNamed:@""];
    }
    
    return cell;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    for (int i = 0 ; i< _modelArray.count; i++) {
        NSMutableArray *tempTimeArray = _modelArray[i];
        tempTimeArray[2] = @"0";
        _modelArray[i] = tempTimeArray;
    }
    NSMutableArray *tempTimeArray = _modelArray[indexPath.row];
    tempTimeArray[2] = @"1";
    _modelArray[indexPath.row] = tempTimeArray;
    [collectionView selectItemAtIndexPath:[NSIndexPath indexPathForRow:indexPath.row inSection:0] animated:YES scrollPosition:UICollectionViewScrollPositionLeft];
    [self.collectionView reloadData];
    
}

- (void)setStoreArray:(NSMutableArray *)storeArray {
    self.modelArray = [NSMutableArray arrayWithArray:storeArray];
    [self.collectionView reloadData];
    
}

#pragma mark - UICollectionViewDelegateFlowLayout

//在这个方法里面给cell赋值

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {



}




@end
