//
//  TCSettingLikeViewController.m
//  TCSetting
//
//  Created by 陈 胜 on 16/7/13.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import "TCSettingLikeViewController.h"

@interface TCSettingLikeViewController ()

@end

@implementation TCSettingLikeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
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

@end
