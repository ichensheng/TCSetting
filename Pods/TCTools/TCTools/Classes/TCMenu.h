//
//  TCMenu.h
//  TCTools
//
//  Created by 陈 胜 on 16/6/27.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TCMenuItem : NSObject

@property (nonatomic, copy) NSString *title;    // 标题
@property (nonatomic, copy) NSString *icon;     // 标题左边的小图标
@property (nonatomic, weak) NSObject *target;   // 点击时的消息接收者
@property (nonatomic, assign) SEL action;       // 点击发出的消息

@end

@interface TCMenu : UIView

+ (void)showMenuInView:(UIView *)view menuItems:(NSArray *)menuItems;
+ (void)dismiseMenu;

@end
