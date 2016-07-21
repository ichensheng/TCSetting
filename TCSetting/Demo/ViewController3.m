//
//  ViewController3.m
//  TCSetting
//
//  Created by 陈 胜 on 16/4/20.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import "ViewController3.h"
#import "TCSettingTableViewCell.h"

@interface ViewController3 () <TCSettingTableViewCellDelegate>

@end

@implementation ViewController3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"隐私";
    UIView *footerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 30.0f)];
    footerView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    self.tableView.tableFooterView = footerView;
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
    cellModel11.title = @"加我为朋友时需要验证加我为朋友时需要验证加我为朋友时需要验证加我为朋友时需要验证加我为朋友时需要验证";
    cellModel11.headerText = @"通讯录";
    cellModel11.accessoryType = TCCellAccessorySwitch;
    cellModel11.checked = YES;
    NSArray *section1 = @[cellModel11];
    [datasource addObject:section1];
    
    TCSettingCellModel *cellModel21 = [[TCSettingCellModel alloc] init];
    cellModel21.title = @"通过QQ号搜索是到我";
    cellModel21.accessoryType = TCCellAccessorySwitch;
    cellModel21.checked = YES;
    NSArray *section2 = @[cellModel21];
    [datasource addObject:section2];
    
    TCSettingCellModel *cellModel31 = [[TCSettingCellModel alloc] init];
    cellModel31.title = @"可通过手机号搜索到我";
    cellModel31.accessoryType = TCCellAccessorySwitch;
    cellModel31.checked = YES;
    TCSettingCellModel *cellModel32 = [[TCSettingCellModel alloc] init];
    cellModel32.title = @"向我推荐通讯录朋友";
    cellModel32.accessoryType = TCCellAccessorySwitch;
    cellModel32.checked = YES;
    cellModel32.footerText = @"开启后，为你推荐已经开通微信的手机联系人";
    NSArray *section3 = @[cellModel31, cellModel32];
    [datasource addObject:section3];
    
    TCSettingCellModel *cellModel41 = [[TCSettingCellModel alloc] init];
    cellModel41.title = @"通过微信号搜索到我";
    cellModel41.accessoryType = TCCellAccessorySwitch;
    cellModel41.checked = YES;
    cellModel41.footerText = @"关闭后，其他用户将不能通过微信号搜索到你";
    NSArray *section4 = @[cellModel41];
    [datasource addObject:section4];
    
    TCSettingCellModel *cellModel51 = [[TCSettingCellModel alloc] init];
    cellModel51.title = @"通讯录黑名单";
    cellModel51.accessoryType = TCCellAccessoryDisclosureIndicator;
    NSArray *section5 = @[cellModel51];
    [datasource addObject:section5];
    
    TCSettingCellModel *cellModel61 = [[TCSettingCellModel alloc] init];
    cellModel61.title = @"不让他(她)看我的朋友圈";
    cellModel61.headerText = @"朋友圈";
    cellModel61.accessoryType = TCCellAccessoryDisclosureIndicator;
    TCSettingCellModel *cellModel62 = [[TCSettingCellModel alloc] init];
    cellModel62.title = @"不看他(她)的朋友圈";
    cellModel62.accessoryType = TCCellAccessoryDisclosureIndicator;
    NSArray *section6 = @[cellModel61, cellModel62];
    [datasource addObject:section6];
    
    TCSettingCellModel *cellModel71 = [[TCSettingCellModel alloc] init];
    cellModel71.title = @"允许陌生人查看十张照片";
    cellModel71.accessoryType = TCCellAccessorySwitch;
    NSArray *section7 = @[cellModel71];
    [datasource addObject:section7];
    
    return datasource;
}

@end
