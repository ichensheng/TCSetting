//
//  TCSettingLikeViewController.m
//  TCSetting
//
//  Created by 陈 胜 on 16/7/13.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import "TCSettingLikeViewController.h"

/**
 *  tableview分隔线颜色
 */
#ifndef kTableViewSeparatorColor
#define kTableViewSeparatorColor [UIColor colorWithRed:225.0f / 255 green:225.0f / 255 blue:225.0f / 255 alpha:1]
#endif

static const CGFloat kTableViewFooterHeight = 15.0f;    // tableview footer高度

@interface TCSettingLikeViewController ()

@end

@implementation TCSettingLikeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.separatorColor = kTableViewSeparatorColor;
    [self tc_setup];
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return kFirstSectionHeaderHeight;
    }
    return kOtherSectionHeaderHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return kSectionFooterHeight;
}

#pragma mark - Private Methods

- (void)tc_setup {
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    CGRect frame = CGRectMake(0, 0, kScreenWidth, kTableViewFooterHeight);
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:frame];
}

@end
