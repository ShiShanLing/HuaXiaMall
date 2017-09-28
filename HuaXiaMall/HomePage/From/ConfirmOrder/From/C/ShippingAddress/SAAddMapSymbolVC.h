//
//  SAAddMapSymbolVCViewController.h
//  EntityConvenient
//
//  Created by 石山岭 on 2017/3/2.
//  Copyright © 2017年 石山岭. All rights reserved.
//

#import "BaseViewController.h"

@protocol SAAddMapSymbolVCDelegate <NSObject>
/**
 *里面有经纬度 和 地址名称
 */
-(void)ShippingAddress:(NSDictionary *)addressDic;

@end

@interface SAAddMapSymbolVC : BaseViewController

@property (nonatomic, weak)id<SAAddMapSymbolVCDelegate>delegate;

@end
