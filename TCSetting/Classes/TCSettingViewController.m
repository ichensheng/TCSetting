//
//  TCSettingViewController.m
//  TCSetting
//
//  Created by 陈 胜 on 16/4/20.
//  Copyright © 2016年 iTech Technology. All rights reserved.
//

#import "TCSettingViewController.h"
#import "TCSettingTableViewCell.h"

/**
 *  屏幕宽高
 */
#ifndef kScreenWidth
    #define kScreenWidth [UIScreen mainScreen].bounds.size.width
#endif
#ifndef kScreenHeight
    #define kScreenHeight [UIScreen mainScreen].bounds.size.height
#endif

/**
 *  tableview分隔线颜色
 */
#ifndef kTableViewSeparatorColor
    #define kTableViewSeparatorColor [UIColor colorWithRed:225.0f / 255 green:225.0f / 255 blue:225.0f / 255 alpha:1]
#endif

static const CGFloat kTableViewFooterHeight = 15.0f;    // tableview footer高度
static const CGFloat kFirstSectionHeaderHeight = 15.0f; // 第一个section header高度
static const CGFloat kOtherSectionHeaderHeight = 20.0f; // 其它section header高度
static const CGFloat kSectionFooterHeight = 0.01f;      // section footer高度
static const CGFloat kHeaderMarginBottom = 8.0f;
static const CGFloat kFooterMarginTop = 8.0f;
static const CGFloat kHeaderAndFooterFontSize = 14.0f;

@interface TCSettingViewController () <TCSettingTableViewCellDelegate>

@property (nonatomic, strong, readwrite) NSArray *settingDatasource;

@end

@implementation TCSettingViewController

- (instancetype)init {
    return [super initWithStyle:UITableViewStyleGrouped];
}

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;
    self.tableView.separatorColor = kTableViewSeparatorColor;
    [self setup];
    self.settingDatasource = [self loadSettingDatasource];
}

- (void)viewDidAppear:(BOOL)animated {
    self.tableView.showsVerticalScrollIndicator = NO;
    [super viewDidAppear:animated];
    self.tableView.showsVerticalScrollIndicator = YES;
}

#pragma mark - UITableViewsettingDatasource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.settingDatasource) {
        return self.settingDatasource.count;
    }
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.settingDatasource) {
        NSArray *sectionsettingDatasource = self.settingDatasource[section];
        return sectionsettingDatasource.count;
    }
    return 0;
}

#pragma mark - UITableViewDelegate

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TCSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kReuseIdentifier];
    if (!cell) {
        cell = [[TCSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                             reuseIdentifier:kReuseIdentifier];
        cell.cellModel = self.settingDatasource[indexPath.section][indexPath.row];
    }
    cell.delegate = self;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    TCSettingCellModel *cellModel = self.settingDatasource[indexPath.section][indexPath.row];
    if (cellModel) {
        return cellModel.height;
    }
    return 44.0f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    TCSettingCellModel *cellModel = self.settingDatasource[indexPath.section][indexPath.row];
    if (cellModel.operation) {
        cellModel.operation();
    } else if (cellModel.clazz) {
        Class clazz = NSClassFromString(cellModel.clazz);
        UIViewController *controller = [[clazz alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    } else if (cellModel.accessoryType == TCCellAccessoryCheckmark) {
        TCSettingTableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        if (cell.accessoryType == UITableViewCellAccessoryCheckmark) {
            cell.accessoryType = UITableViewCellAccessoryNone;
            if (cell.delegate && [cell.delegate respondsToSelector:@selector(didCheckChanged:withCellModel:atCell:)]) {
                [cell.delegate didCheckChanged:NO withCellModel:cellModel atCell:cell];
            }
        } else {
            cell.accessoryType = UITableViewCellAccessoryCheckmark;
            if (cell.delegate && [cell.delegate respondsToSelector:@selector(didCheckChanged:withCellModel:atCell:)]) {
                [cell.delegate didCheckChanged:YES withCellModel:cellModel atCell:cell];
            }
        }
        for (TCSettingTableViewCell *theCell in [tableView visibleCells]) {
            if (theCell != cell && theCell.accessoryType == UITableViewCellAccessoryCheckmark) {
                theCell.accessoryType = UITableViewCellAccessoryNone;
            }
        }
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    TCSettingCellModel *cellModel = [self.settingDatasource[section] lastObject];
    NSString *headerText = cellModel.headerText;
    if (headerText) {
        UILabel *headerLabel = [[UILabel alloc] init];
        headerLabel.textAlignment = cellModel.headerAlignment;
        headerLabel.text = headerText;
        headerLabel.numberOfLines = 0;
        headerLabel.font = [UIFont systemFontOfSize:kHeaderAndFooterFontSize];
        headerLabel.textColor = [UIColor grayColor];
        CGSize constraintSize = CGSizeMake(kScreenWidth - kSectionHeaderAndFooterMarginLeft  * 2, CGFLOAT_MAX);
        CGSize size = [self boundingSizeWithFont:[UIFont systemFontOfSize:kHeaderAndFooterFontSize]
                                       forString:headerText
                                  constraintSize:constraintSize];
        if (section == 0) {
            if (cellModel.footerAlignment == NSTextAlignmentCenter) {
                CGFloat x = (kScreenWidth - size.width) / 2;
                headerLabel.frame = CGRectMake(x, kFirstSectionHeaderHeight, size.width, size.height);
            } else {
                headerLabel.frame =
                CGRectMake(kSectionHeaderAndFooterMarginLeft, kFirstSectionHeaderHeight, size.width, size.height);
            }
        } else {
            if (cellModel.footerAlignment == NSTextAlignmentCenter) {
                CGFloat x = (kScreenWidth - size.width) / 2;
                headerLabel.frame = CGRectMake(x, kOtherSectionHeaderHeight, size.width, size.height);
            } else {
                headerLabel.frame =
                CGRectMake(kSectionHeaderAndFooterMarginLeft, kOtherSectionHeaderHeight, size.width, size.height);
            }
        }
        UIView *headerView = [[UIView alloc] init];
        [headerView addSubview:headerLabel];
        CGFloat headerViewHeight;
        if (section == 0) {
            headerViewHeight = size.height + kHeaderMarginBottom + kFirstSectionHeaderHeight;
        } else {
            headerViewHeight = size.height + kHeaderMarginBottom + kOtherSectionHeaderHeight;
        }
        headerView.frame = CGRectMake(0, 0, kScreenWidth, headerViewHeight);
        return headerView;
    }
    
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    TCSettingCellModel *cellModel = [self.settingDatasource[section] lastObject];
    NSString *footerText = cellModel.footerText;
    if (footerText) {
        UILabel *footerLabel = [[UILabel alloc] init];
        footerLabel.textAlignment = cellModel.footerAlignment;
        footerLabel.text = footerText;
        footerLabel.numberOfLines = 0;
        footerLabel.font = [UIFont systemFontOfSize:kHeaderAndFooterFontSize];
        footerLabel.textColor = [UIColor grayColor];
        CGSize constraintSize = CGSizeMake(kScreenWidth - kSectionHeaderAndFooterMarginLeft * 2, CGFLOAT_MAX);
        CGSize size = [self boundingSizeWithFont:[UIFont systemFontOfSize:kHeaderAndFooterFontSize]
                                       forString:footerText
                                  constraintSize:constraintSize];
        if (cellModel.footerAlignment == NSTextAlignmentCenter) {
            CGFloat x = (kScreenWidth - size.width) / 2;
            footerLabel.frame = CGRectMake(x, kFooterMarginTop, size.width, size.height);
        } else {
            footerLabel.frame = CGRectMake(kSectionHeaderAndFooterMarginLeft, kFooterMarginTop, size.width, size.height);
        }
        UIView *footerView = [[UIView alloc] init];
        [footerView addSubview:footerLabel];
        CGFloat footerViewHeight;
        if (section == 0) {
            footerViewHeight = size.height + kFooterMarginTop + kSectionFooterHeight;
        } else {
            footerViewHeight = size.height + kFooterMarginTop + kSectionFooterHeight;
        }
        footerView.frame = CGRectMake(0, 0, kScreenWidth, footerViewHeight);
        return footerView;
    }
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    TCSettingCellModel *cellModel = [self.settingDatasource[section] lastObject];
    if (cellModel &&  cellModel.headerText) {
        CGSize constraintSize = CGSizeMake(kScreenWidth - kSectionHeaderAndFooterMarginLeft * 2, CGFLOAT_MAX);
        CGSize size = [self boundingSizeWithFont:[UIFont systemFontOfSize:kHeaderAndFooterFontSize]
                                       forString: cellModel.headerText
                                  constraintSize:constraintSize];
        if (section == 0) {
            return size.height + kHeaderMarginBottom + kFirstSectionHeaderHeight;
        } else {
            return size.height + kHeaderMarginBottom + kOtherSectionHeaderHeight;
        }
    } else {
        if (section == 0) {
            return kFirstSectionHeaderHeight;
        }
        return kOtherSectionHeaderHeight;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    TCSettingCellModel *cellModel = [self.settingDatasource[section] lastObject];
    if (cellModel && cellModel.footerText) {
        CGSize constraintSize = CGSizeMake(kScreenWidth - kSectionHeaderAndFooterMarginLeft * 2, CGFLOAT_MAX);
        CGSize size = [self boundingSizeWithFont:[UIFont systemFontOfSize:kHeaderAndFooterFontSize]
                                       forString:cellModel.footerText
                                  constraintSize:constraintSize];
        return size.height + kFooterMarginTop + kSectionFooterHeight;
    }
    return kSectionFooterHeight;
}

#pragma mark - Private Methods

- (void)setup {
    self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
    CGRect frame = CGRectMake(0, 0, kScreenWidth, kTableViewFooterHeight);
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:frame];
}

- (NSArray *)loadSettingDatasource {
    return nil;
}

- (CGSize)boundingSizeWithFont:(UIFont *)font
                     forString:(NSString *)string
                constraintSize:(CGSize)size {
    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByWordWrapping;
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    return [string boundingRectWithSize:size
                                options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                             attributes:attributes
                                context:nil].size;
}

@end
