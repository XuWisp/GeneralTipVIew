//
//  TipViewManager.h
//  CasaMielBAM
//
//  Created by xush on 2018/6/29.
//  Copyright © 2018年 徐沙洪. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PopBGView.h"

@interface TipViewManager : NSObject

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) PopBGView *popV;

+(instancetype)sharedManager;

- (void)showTipWithView:(UIView *)view;
- (void)hideTipView;


@end
