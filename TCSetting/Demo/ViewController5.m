//
//  ViewController5.m
//  TCSetting
//
//  Created by 陈 胜 on 16/5/4.
//  Copyright © 2016年 iTech Technology. All rights reserved.
//

#import "ViewController5.h"
#import "TCSettingCellModel.h"

@interface ViewController5 ()

@end

@implementation ViewController5

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"设置";
}

- (NSArray *)loadSettingDatasource {
    NSMutableArray *datasource = [NSMutableArray array];
    
    /**
     *  第一分组
     */
    TCSettingCellModel *cellModel11 = [[TCSettingCellModel alloc] init];
    cellModel11.title = @"全天开启免打扰";
    cellModel11.accessoryType = TCCellAccessoryCheckmark;
    cellModel11.tintColor = [UIColor redColor];
    TCSettingCellModel *cellModel12 = [[TCSettingCellModel alloc] init];
    cellModel12.title = @"只在夜间开启免打扰";
    cellModel12.accessoryType = TCCellAccessoryCheckmark;
    cellModel12.tintColor = [UIColor greenColor];
    TCSettingCellModel *cellModel13 = [[TCSettingCellModel alloc] init];
    cellModel13.title = @"关闭免打扰";
    cellModel13.accessoryType = TCCellAccessoryCheckmark;
    cellModel13.footerText = @"消息免打扰说明";
    cellModel13.footerAlignment = NSTextAlignmentCenter;
    NSArray *section1 = @[cellModel11, cellModel12, cellModel13];
    [datasource addObject:section1];
    
    
    return datasource;
}

@end
