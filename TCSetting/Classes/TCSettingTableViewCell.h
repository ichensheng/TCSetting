//
//  TCSettingTableViewCell.h
//  TCSetting
//
//  Created by 陈 胜 on 16/4/20.
//  Copyright © 2016年 iTech Technology. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TCSettingCellModel.h"

static const CGFloat kSectionHeaderAndFooterMarginLeft = 15.0f;

@protocol TCSettingTableViewCellDelegate;
@interface TCSettingTableViewCell : UITableViewCell

@property (nonatomic, strong) TCSettingCellModel *cellModel;
@property (nonatomic, weak) id<TCSettingTableViewCellDelegate>delegate;

@end

@protocol TCSettingTableViewCellDelegate <NSObject>

@optional

/**
 *  checked有变化时调用该方法，子类如果关注则需要继承该方法
 *
 *  @param checked   选中则为YES否则为NO
 *  @param cellModel cell数据model
 *  @param cell      点击的cell
 */
- (void)didCheckChanged:(BOOL)checked
          withCellModel:(TCSettingCellModel *)cellModel
                 atCell:(TCSettingTableViewCell *)cell;

@end

