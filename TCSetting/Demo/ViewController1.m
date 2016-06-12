//
//  ViewController1.m
//  TCSetting
//
//  Created by 陈 胜 on 16/4/20.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import "ViewController1.h"
#import "TCSettingCellModel.h"

@interface ViewController1 ()

@end

@implementation ViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"账号与安全";
}

- (NSArray *)loadSettingDatasource {
    NSMutableArray *datasource = [NSMutableArray array];
    
    TCSettingCellModel *cellModel11 = [[TCSettingCellModel alloc] init];
    cellModel11.title = @"微信号";
    cellModel11.detail = @"123456789";
    NSArray *section1 = @[cellModel11];
    [datasource addObject:section1];
    
    TCSettingCellModel *cellModel21 = [[TCSettingCellModel alloc] init];
    cellModel21.title = @"QQ号";
    cellModel21.detail = @"123456789";
    cellModel21.accessoryType = TCCellAccessoryDisclosureIndicator;
    TCSettingCellModel *cellModel22 = [[TCSettingCellModel alloc] init];
    cellModel22.title = @"手机号";
    cellModel22.detail = @"123456789";
    cellModel22.accessoryType = TCCellAccessoryDisclosureIndicator;
    TCSettingCellModel *cellModel23 = [[TCSettingCellModel alloc] init];
    cellModel23.title = @"邮箱地址";
    cellModel23.detail = @"未验证";
    cellModel23.accessoryType = TCCellAccessoryDisclosureIndicator;
    NSArray *section2 = @[cellModel21, cellModel22, cellModel23];
    [datasource addObject:section2];
    
    TCSettingCellModel *cellModel31 = [[TCSettingCellModel alloc] init];
    cellModel31.title = @"声音锁";
    cellModel31.accessoryType = TCCellAccessoryDisclosureIndicator;
    TCSettingCellModel *cellModel32 = [[TCSettingCellModel alloc] init];
    cellModel32.title = @"微信密码";
    cellModel32.accessoryType = TCCellAccessoryDisclosureIndicator;
    TCSettingCellModel *cellModel33 = [[TCSettingCellModel alloc] init];
    cellModel33.title = @"账号保护";
    cellModel33.accessoryType = TCCellAccessoryDisclosureIndicator;
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor grayColor];
    label.text = @"未保护";
    label.font = [UIFont systemFontOfSize:14];
    [label sizeToFit];
    cellModel33.detailView = [[UIView alloc] init];
    [cellModel33.detailView addSubview:label];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"profileLockOff"];
    CGFloat labelHeight = label.frame.size.height;
    CGFloat labelWidth = label.frame.size.width;
    imageView.frame = CGRectMake(0, 0, labelHeight, labelHeight);
    [cellModel33.detailView addSubview:imageView];
    CGRect frame = cellModel11.detailView.frame;
    frame.size.width = labelWidth + imageView.frame.size.width;
    frame.size.height = labelHeight;
    cellModel33.detailView.frame = frame;
    label.frame = CGRectMake(imageView.frame.size.width + 3, 0, labelWidth + 3, labelHeight);
    TCSettingCellModel *cellModel34 = [[TCSettingCellModel alloc] init];
    cellModel34.title = @"微信安全中心";
    cellModel34.accessoryType = TCCellAccessoryDisclosureIndicator;
    cellModel34.footerText = @"如果遇到账号信息泄露、忘记密码、咋骗等账号安全问题，可前往微信安全中心";
    NSArray *section3 = @[cellModel31, cellModel32, cellModel33, cellModel34];
    [datasource addObject:section3];
    
    return datasource;
}

@end
