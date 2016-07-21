//
//  ViewController.m
//  TCSetting
//
//  Created by 陈 胜 on 16/4/20.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import "ViewController.h"
#import "TCSettingCellModel.h"
#import "TCSizeManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
}

- (NSArray *)loadSettingDatasource {
    NSMutableArray *datasource = [NSMutableArray array];
    
    TCSettingCellModel *cellModel11 = [[TCSettingCellModel alloc] init];
    cellModel11.headerText = @"关于账号与安全";
    cellModel11.title = @"账号与安全";
    cellModel11.accessoryType = TCCellAccessoryDisclosureIndicator;
    cellModel11.clazz = @"ViewController1";
    UILabel *label = [[UILabel alloc] init];
    label.textColor = [UIColor grayColor];
    label.text = @"未保护";
    label.font = [UIFont systemFontOfSize:FONT_SIZE(TCFontTextStyle14)];
    [label sizeToFit];
    cellModel11.detailView = [[UIView alloc] init];
    [cellModel11.detailView addSubview:label];
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"profileLockOff"];
    CGFloat labelHeight = label.frame.size.height;
    CGFloat labelWidth = label.frame.size.width;
    CGSize iconSize = ICON_SIZE(TCIconSizeStyle17);
    imageView.frame = CGRectMake(0, 0, iconSize.width, iconSize.height);
    [cellModel11.detailView addSubview:imageView];
    CGRect frame = cellModel11.detailView.frame;
    frame.size.width = labelWidth + imageView.frame.size.width;
    frame.size.height = labelHeight;
    cellModel11.detailView.frame = frame;
    label.frame = CGRectMake(imageView.frame.size.width + 3, 0, labelWidth + 3, labelHeight);
    NSArray *section1 = @[cellModel11];
    [datasource addObject:section1];
    
    TCSettingCellModel *cellModel21 = [[TCSettingCellModel alloc] init];
    cellModel21.title = @"新消息提醒";
    cellModel21.accessoryType = TCCellAccessoryDisclosureIndicator;
    cellModel21.clazz = @"ViewController2";
    TCSettingCellModel *cellModel22 = [[TCSettingCellModel alloc] init];
    cellModel22.title = @"隐私";
    cellModel22.accessoryType = TCCellAccessoryDisclosureIndicator;
    cellModel22.clazz = @"ViewController3";
    TCSettingCellModel *cellModel23 = [[TCSettingCellModel alloc] init];
    cellModel23.title = @"通用";
    cellModel23.accessoryType = TCCellAccessoryDisclosureIndicator;
    cellModel23.clazz = @"ViewController4";
    NSArray *section2 = @[cellModel21, cellModel22, cellModel23];
    [datasource addObject:section2];
    
    TCSettingCellModel *cellModel31 = [[TCSettingCellModel alloc] init];
    cellModel31.title = @"帮助与反馈";
    cellModel31.accessoryType = TCCellAccessoryDisclosureIndicator;
    TCSettingCellModel *cellModel32 = [[TCSettingCellModel alloc] init];
    cellModel32.title = @"关于微信";
    cellModel32.accessoryType = TCCellAccessoryDisclosureIndicator;
    NSArray *section3 = @[cellModel31, cellModel32];
    [datasource addObject:section3];
    
    return datasource;
}

@end
