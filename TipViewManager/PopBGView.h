//
//  PopBGView.h
//  CASAMIEL
//
//  Created by 徐沙洪 on 2018/3/17.
//  Copyright © 2018年 徐沙洪. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopBGView : UIView

@property (nonatomic, strong) UIView *mainV;
@property (nonatomic, assign) BOOL isRemove;

// 关闭视图-底部
- (void)popViewBottom;
// 推出视图-底部
- (void)pushViewBottom;
// 关闭视图-购物车 0.7*H
- (void)popViewToShopCar;

@end
