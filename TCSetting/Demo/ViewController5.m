//
//  ViewController5.m
//  TCSetting
//
//  Created by 陈 胜 on 16/5/4.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import "ViewController5.h"
#import "TCSettingCellModel.h"
#import "TCSettingTableViewCell.h"

@interface ViewController5 () <TCSettingTableViewCellDelegate>

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
    cellModel13.footerText = @"开启后，“QQ邮箱提醒”在收到邮件后，手机不会震动与发出提示音。如果设置为“只在夜间开启”，则只在22:00到8:00间生效。";
    cellModel13.footerAlignment = NSTextAlignmentCenter;
    NSArray *section1 = @[cellModel11, cellModel12, cellModel13];
    [datasource addObject:section1];
    
    
    TCSettingCellModel *cellModel21 = [[TCSettingCellModel alloc] init];
    cellModel21.title = @"全天开启免打扰";
    cellModel21.accessoryType = TCCellAccessoryCheckmark;
    cellModel21.tintColor = [UIColor redColor];
    TCSettingCellModel *cellModel22 = [[TCSettingCellModel alloc] init];
    cellModel22.title = @"只在夜间开启免打扰";
    cellModel22.accessoryType = TCCellAccessoryCheckmark;
    cellModel22.tintColor = [UIColor greenColor];
    TCSettingCellModel *cellModel23 = [[TCSettingCellModel alloc] init];
    cellModel23.title = @"关闭免打扰";
    cellModel23.accessoryType = TCCellAccessoryCheckmark;
    cellModel23.footerText = @"开启后，“QQ邮箱提醒”在收到邮件后，手机不会震动与发出提示音。如果设置为“只在夜间开启”，则只在22:00到8:00间生效。";
    cellModel23.footerAlignment = NSTextAlignmentCenter;
    NSArray *section2 = @[cellModel21, cellModel22, cellModel23];
    [datasource addObject:section2];
    
    return datasource;
}

#pragma mark - TCSettingTableViewCellDelegate

- (void)tableViewCell:(TCSettingTableViewCell *)tableViewCell
        withCellModel:(TCSettingCellModel *)cellModel
          atIndexPath:(NSIndexPath *)indexPath {
    
    NSLog(@"点击%ld-%ld", indexPath.section, indexPath.row);
    if (cellModel.accessoryType == TCCellAccessoryCheckmark) {
        BOOL mustChecked = NO;
        for (TCSettingCellModel *cellModel in self.settingDatasource[indexPath.section]) {
            if (cellModel.checked) {
                mustChecked = YES;
                break;
            }
        }
        if (!mustChecked) {
            cellModel.checked = YES;
            tableViewCell.accessoryType = UITableViewCellAccessoryCheckmark;
        }
    }
}

@end
