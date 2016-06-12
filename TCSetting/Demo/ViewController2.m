//
//  ViewController2.m
//  TCSetting
//
//  Created by 陈 胜 on 16/4/20.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import "ViewController2.h"
#import "TCSettingCellModel.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"新消息通知";
}

- (NSArray *)loadSettingDatasource {
    NSMutableArray *datasource = [NSMutableArray array];
    
    TCSettingCellModel *cellModel11 = [[TCSettingCellModel alloc] init];
    cellModel11.title = @"接收新消息通知";
    cellModel11.detail = @"已开启";
    cellModel11.footerText = @"如果你要关闭或开启微信的新消息通知，请在iPhonede的\"设置\"-\"通知\"功能中，找到应用程序\"微信\"更改。";
    NSArray *section1 = @[cellModel11];
    [datasource addObject:section1];
    
    TCSettingCellModel *cellModel21 = [[TCSettingCellModel alloc] init];
    cellModel21.title = @"通知显示消息详情";
    cellModel21.accessoryType = TCCellAccessorySwitch;
    cellModel21.footerText = @"关闭后，当收到微信消息时，通知提示将不显示发信人和内容摘要。";
    NSArray *section2 = @[cellModel21];
    [datasource addObject:section2];
    
    TCSettingCellModel *cellModel31 = [[TCSettingCellModel alloc] init];
    cellModel31.title = @"功能消息免打扰";
    cellModel31.accessoryType = TCCellAccessoryDisclosureIndicator;
    cellModel31.footerText = @"设置系统功能消息提示声音和震动的时段。";
    cellModel31.clazz = @"ViewController5";
    NSArray *section3 = @[cellModel31];
    [datasource addObject:section3];
    
    TCSettingCellModel *cellModel41 = [[TCSettingCellModel alloc] init];
    cellModel41.title = @"声音";
    cellModel41.accessoryType = TCCellAccessorySwitch;
    TCSettingCellModel *cellModel42 = [[TCSettingCellModel alloc] init];
    cellModel42.title = @"震动";
    cellModel42.accessoryType = TCCellAccessorySwitch;
    cellModel42.footerText = @"当微信在运行时，你可以设置是否需要声音和震动。";
    NSArray *section4 = @[cellModel41, cellModel42];
    [datasource addObject:section4];
    
    TCSettingCellModel *cellModel51 = [[TCSettingCellModel alloc] init];
    cellModel51.title = @"朋友圈照片更新";
    cellModel51.accessoryType = TCCellAccessorySwitch;
    cellModel51.footerText = @"关闭后，有朋友更新照片时，界面下面的\"发现\"切换按钮上不再出现红点提示。";
    NSArray *section5 = @[cellModel51];
    [datasource addObject:section5];
    
    return datasource;
}

@end
