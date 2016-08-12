//
//  UINavigationController+Demo.m
//  TCSetting
//
//  Created by 陈 胜 on 16/8/12.
//  Copyright © 2016年 陈胜. All rights reserved.
//

#import "UINavigationController+Demo.h"

@implementation UINavigationController (Demo)

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return [self.topViewController supportedInterfaceOrientations];
}

- (BOOL)shouldAutorotate {
    return [self.topViewController shouldAutorotate];
}

@end
