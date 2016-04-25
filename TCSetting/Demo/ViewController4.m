//
//  ViewController4.m
//  TCSetting
//
//  Created by 陈 胜 on 16/4/20.
//  Copyright © 2016年 iTech Technology. All rights reserved.
//

#import "ViewController4.h"
#import "TCSettingTableViewCell.h"

@interface ViewController4 () <TCSettingTableViewCellDelegate>

@end

@implementation ViewController4

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"通用";
}

#pragma mark - TCSettingTableViewCellDelegate

- (void)didCheckChanged:(BOOL)checked
          withCellModel:(TCSettingCellModel *)cellModel
                 atCell:(TCSettingCellModel *)cell {
    
    NSLog(@"%@", @(checked));
}

- (NSArray *)loadSettingDatasource {
    NSMutableArray *datasource = [NSMutableArray array];
    
    TCSettingCellModel *cellModel11 = [[TCSettingCellModel alloc] init];
    cellModel11.title = @"多语言";
    cellModel11.accessoryType = TCCellAccessoryDisclosureIndicator;
    NSArray *section1 = @[cellModel11];
    [datasource addObject:section1];
    
    TCSettingCellModel *cellModel21 = [[TCSettingCellModel alloc] init];
    cellModel21.title = @"字体大小";
    cellModel21.accessoryType = TCCellAccessoryDisclosureIndicator;
    TCSettingCellModel *cellModel22 = [[TCSettingCellModel alloc] init];
    cellModel22.title = @"聊天表情";
    cellModel22.accessoryType = TCCellAccessoryDisclosureIndicator;
    TCSettingCellModel *cellModel23 = [[TCSettingCellModel alloc] init];
    cellModel23.title = @"我的表情";
    cellModel23.accessoryType = TCCellAccessoryDisclosureIndicator;
    TCSettingCellModel *cellModel24 = [[TCSettingCellModel alloc] init];
    cellModel24.title = @"朋友圈小视频";
    cellModel24.accessoryType = TCCellAccessoryDisclosureIndicator;
    NSArray *section2 = @[cellModel21, cellModel22, cellModel23, cellModel24];
    [datasource addObject:section2];
    
    TCSettingCellModel *cellModel31 = [[TCSettingCellModel alloc] init];
    cellModel31.title = @"听筒模式";
    cellModel31.checked = YES;
    cellModel31.accessoryType = TCCellAccessorySwitch;
    NSArray *section3 = @[cellModel31];
    [datasource addObject:section3];
    
    TCSettingCellModel *cellModel41 = [[TCSettingCellModel alloc] init];
    cellModel41.title = @"功能";
    cellModel41.accessoryType = TCCellAccessoryDisclosureIndicator;
    NSArray *section4 = @[cellModel41];
    [datasource addObject:section4];
    
    TCSettingCellModel *cellModel51 = [[TCSettingCellModel alloc] init];
    cellModel51.title = @"聊天记录迁移";
    cellModel51.accessoryType = TCCellAccessoryDisclosureIndicator;
    TCSettingCellModel *cellModel52 = [[TCSettingCellModel alloc] init];
    cellModel52.title = @"清理微信存储空间";
    cellModel52.accessoryType = TCCellAccessoryDisclosureIndicator;
    NSArray *section5 = @[cellModel51, cellModel52];
    [datasource addObject:section5];
    
    return datasource;
}

@end
