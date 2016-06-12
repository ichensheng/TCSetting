//
//  TCSettingTableViewCell.m
//  TCSetting
//
//  Created by 陈 胜 on 16/5/24.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import "TCSettingTableViewCell.h"
#import "Masonry.h"

static const CGFloat kTitleMarginLeft = 15.0f;

@interface TCSettingTableViewCell()

@property (nonatomic, strong) UILabel *titleLabel;          // 标题
@property (nonatomic, strong) UILabel *detailLabel;         // 详情
@property (nonatomic, strong) UIView *detailView;           // 详情view
@property (nonatomic, strong) UISwitch *switchView;         // 开关

@end

@implementation TCSettingTableViewCell

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];
}

#pragma mark - Private Methods

- (void)setup {
    __weak typeof(self) weakself = self;
    
    if (self.cellModel.tintColor) {
        self.tintColor = self.cellModel.tintColor;
    }
    
    self.titleLabel.text = self.cellModel.title;
    [_detailLabel removeFromSuperview];
    [_detailView removeFromSuperview];
    self.accessoryView = nil;
    
    /**
     *  设置title约束
     */
    [self.titleLabel sizeToFit];
    [self.titleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(weakself.titleLabel.frame.size);
        make.left.mas_equalTo(kTitleMarginLeft);
        make.centerY.equalTo(weakself.contentView);
    }];
    
    /**
     *  设置详情
     */
    if (self.cellModel.detailView) { // detailView优先
        if (self.cellModel.accessoryType == TCCellAccessoryDisclosureIndicator) {
            [self.detailView mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(self.detailView.frame.size);
                make.right.mas_equalTo(0.0f);
                make.centerY.equalTo(self.contentView);
            }];
        } else { // 没有箭头则detailView作为accessoryView
            self.accessoryView = self.detailView;
        }
    } else if (self.cellModel.detail) {
        self.detailLabel.text = self.cellModel.detail;
        [self.detailLabel sizeToFit];
        if (self.cellModel.accessoryType == TCCellAccessoryNone) { // 没有箭头则detailLabel作为accessoryView
            self.accessoryView = self.detailLabel;
        } else {
            [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                make.size.mas_equalTo(weakself.detailLabel.frame.size);
                make.right.mas_equalTo(0.0f);
                make.centerY.equalTo(weakself.contentView);
            }];
        }
    }
    
    self.selectionStyle = UITableViewCellSelectionStyleDefault;
    switch (self.cellModel.accessoryType) {
        case TCCellAccessoryDisclosureIndicator: {
            self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
            break;
        }
        case TCCellAccessoryDetailDisclosureButton:
            self.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
            break;
        case TCCellAccessoryCheckmark: {
            if (self.cellModel.checked) {
                self.accessoryType = UITableViewCellAccessoryCheckmark;
            } else {
                self.accessoryType = UITableViewCellAccessoryNone;
            }
            break;
        }
        case TCCellAccessoryDetailButton:
            self.accessoryType = UITableViewCellAccessoryDetailButton;
            break;
        case TCCellAccessorySwitch: {
            self.accessoryView = self.switchView;
            self.switchView.on = self.cellModel.checked;
            [self.switchView addTarget:self action:@selector(valueChanged:)
                      forControlEvents:UIControlEventValueChanged];
            self.selectionStyle = UITableViewCellSelectionStyleNone;
            break;
        }
        default: {
            self.accessoryType = UITableViewCellAccessoryNone;
            self.selectionStyle = UITableViewCellSelectionStyleNone;
            break;
        }
    }
}

- (void)valueChanged:(UISwitch *)sender {
    if (self.delegate && [self.delegate respondsToSelector:@selector(didCheckChanged:withCellModel:atCell:)]) {
        [self.delegate didCheckChanged:sender.on withCellModel:self.cellModel atCell:self];
    }
}

#pragma mark - Getters and Setters

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.numberOfLines = 1;
        _titleLabel.font = [UIFont systemFontOfSize:17];
        [self.contentView addSubview:_titleLabel];
    }
    return _titleLabel;
}

- (UILabel *)detailLabel {
    if (!_detailLabel) {
        _detailLabel = [[UILabel alloc] init];
        _detailLabel.numberOfLines = 1;
        _detailLabel.font = [UIFont systemFontOfSize:14];
        _detailLabel.textColor = [UIColor grayColor];
        [self.contentView addSubview:_detailLabel];
    }
    return _detailLabel;
}

- (UIView *)detailView {
    if (_detailView) {
        [_detailView removeFromSuperview];
    }
    _detailView = self.cellModel.detailView;
    [self.contentView addSubview:_detailView];
    return _detailView;
}

- (UISwitch *)switchView {
    if (!_switchView) {
        _switchView = [[UISwitch alloc] init];
    }
    return _switchView;
}

- (void)setCellModel:(TCSettingCellModel *)cellModel {
    _cellModel = cellModel;
    [self setup];
}

@end
