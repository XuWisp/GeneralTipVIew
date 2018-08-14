//
//  TipViewManager.m
//  CasaMielBAM
//
//  Created by xush on 2018/6/29.
//  Copyright © 2018年 徐沙洪. All rights reserved.
//

#import "TipViewManager.h"
#import "UIView+WispFrame.h"

@implementation TipViewManager

#pragma mark - LifeCycle
+(instancetype)sharedManager {
    static dispatch_once_t onceToken;
    static TipViewManager *instance;
    dispatch_once(&onceToken, ^{
        instance = [[TipViewManager alloc] init];
        [[UIApplication sharedApplication].keyWindow addSubview:instance.popV];
    });
    return instance;
}

#pragma mark - lazyload

- (PopBGView *)popV {
    if (!_popV) {
        _popV = [[PopBGView alloc] initWithFrame:(CGRectMake(0, 0, kScreenW, [UIScreen mainScreen].bounds.size.height))];
    }
    return _popV;
}

#pragma mark - action

- (void)showTipWithView:(UIView *)view {
    // CasamielBAM-1.0.1(1) <修改提示弹窗页面加载多个页面的缺陷> begin
    [self.popV.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    view.center = CGPointMake(self.popV.width/2, self.popV.height/2);
    [self.popV addSubview:view];
    // CasamielBAM-1.0.1(1) <修改提示弹窗页面加载多个页面的缺陷> end
    [self.popV pushViewBottom];
}

- (void)hideTipView {
    [self.popV popViewBottom];
}


@end
