//
//  TCSettingTableViewCell.h
//  TCSetting
//
//  Created by 陈 胜 on 16/5/24.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCSettingCellModel.h"

static const CGFloat kSectionHeaderAndFooterMarginLeft = 15.0f;

@protocol TCSettingTableViewCellDelegate;
@interface TCSettingTableViewCell : UITableViewCell

@property (nonatomic, strong) TCSettingCellModel *cellModel;
@property (nonatomic, weak) id<TCSettingTableViewCellDelegate>delegate;
@property (nonatomic, weak) UITableView *tableView;

@end

@protocol TCSettingTableViewCellDelegate <NSObject>

@optional

/**
 *  checked有变化时回调该方法
 *
 *  @param tableViewCell 被点击的cell
 *  @param cellModel     cell数据model，checked已经被置为最新的值了
 *  @param indexPath     cell位置
 */
- (void)tableViewCell:(TCSettingTableViewCell *)tableViewCell
        withCellModel:(TCSettingCellModel *)cellModel
          atIndexPath:(NSIndexPath *)indexPath;

@end
