//
//  PopBGView.m
//  CASAMIEL
//
//  Created by 徐沙洪 on 2018/3/17.
//  Copyright © 2018年 徐沙洪. All rights reserved.
//

#import "PopBGView.h"
#import "UIView+WispFrame.h"


@interface PopBGView ()

@property (nonatomic, assign) CGFloat pickerHeight;

@end


@implementation PopBGView

#pragma mark - init

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

#pragma mark - Lazy loading


#pragma mark - other

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = [touches anyObject];
    // 判断当前是否是空白处的高度范围，或是支付方式的视图，是则下移弹窗，不是则不作任何处理
    if (touch.view == self) {
        [self popViewBottom];
        if (self.isRemove) {
            [self removeFromSuperview];
        }
    }
}

- (void)popViewBottom {
    self.backgroundColor = [UIColor clearColor];
    @weakify(self);
    [UIView animateWithDuration:0.5 animations:^{
        @strongify(self);
        self.frame = CGRectMake(0, kScreenH, kScreenW, kScreenH);
    } completion:^(BOOL finished) {
        [[NSNotificationCenter defaultCenter] postNotificationName:PopViewHideNoti object:nil];
    }];
}

- (void)popViewToShopCar {
    self.backgroundColor = [UIColor clearColor];
    @weakify(self);
    
    [UIView animateWithDuration:0.5 animations:^{
        @strongify(self);
        self.transform = CGAffineTransformMakeScale(0.1f, 0.1f);
        self.transform = CGAffineTransformRotate(self.transform,M_PI);
        
        [UIView animateWithDuration:0.3 delay:0.2 options:UIViewAnimationOptionLayoutSubviews animations:^{
            self.frame = CGRectMake(kScreenW*1, kScreenH*0.3, kScreenW, kScreenH);
            self.transform = CGAffineTransformMakeScale(0.01f, 0.01f);
            
        } completion:^(BOOL finished) {
            self.transform = CGAffineTransformMakeScale(1, 1);
            self.frame = CGRectMake(0, kScreenH, kScreenW, kScreenH);
            [[NSNotificationCenter defaultCenter] postNotificationName:PopViewHideNoti object:nil];
            
        }];
    } completion:^(BOOL finished) {
    }];
    
}

- (void)pushViewBottom {
    self.hidden = NO;
    self.frame = CGRectMake(0, kScreenH, kScreenW, kScreenH);
    self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0];
    @weakify(self)
    [UIView animateWithDuration:0.5 animations:^{
        @strongify(self)
        [self setFrame:CGRectMake(0, 0, kScreenW, kScreenH)];
    } completion:^(BOOL finished) {
        @strongify(self)
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.4];
        [[NSNotificationCenter defaultCenter] postNotificationName:PopViewShowNoti object:nil];
    }];
}

@end
