//
//  TCSettingCellModel.m
//  ios-setting-page
//
//  Created by 陈 胜 on 16/4/20.
//  Copyright © 2016年 iTech Technology. All rights reserved.
//

#import "TCSettingCellModel.h"

@implementation TCSettingCellModel

- (CGFloat)height {
    if (_height == 0.0f) {
        _height = 44.0f;
    }
    return _height;
}

@end
