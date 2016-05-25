//
//  ZJStatusHUD.m
//  ZJStatusHUD
//
//  Created by 张杰 on 16/5/24.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ZJStatusHUD.h"

#define screenH [UIScreen mainScreen].bounds.size.height
#define screenW [UIScreen mainScreen].bounds.size.width
static CGFloat const ZJMessageDuration = 2;
static CGFloat const ZJAnimationDuration = 0.25;
static NSTimer *timer_;
@implementation ZJStatusHUD

static UIWindow *window_;

/**
 *  创建窗口
 */

+ (void)setupWindow
{
    CGFloat windowH = 20;
    CGRect frame = CGRectMake(0, - windowH, screenW, windowH);
    
    window_.hidden = YES;
    window_ = [[UIWindow alloc] init];
    window_.frame = frame;
    window_.windowLevel = UIWindowLevelAlert;
    window_.backgroundColor = [UIColor grayColor];
    window_.hidden = NO;
    
    //动画
    frame.origin.y = 0;
    [UIView animateWithDuration:ZJAnimationDuration animations:^{
        window_.frame = frame;
    }];
}

/**
 *  显示成功信息
 *  @param msg 传入成功后要输出的信息
 */
+ (void)showSuccess:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"success"]];
}

/**
 *  显示失败信息
 *  @param msg 传入失败后要输出的信息
 */
+ (void)showError:(NSString *)msg
{
    [self showMessage:msg image:[UIImage imageNamed:@"error"]];
}

/**
 *  显示成功信息
 *  @param msg 传入加载中的输出信息
 */
+ (void)showLoading:(NSString *)msg
{
    //停止定时器
    [timer_ invalidate];
    timer_ = nil;
    
    [self setupWindow];
    
    //添加文字
    UILabel *label = [[UILabel alloc] init];
    label.frame = window_.bounds;
    label.text = msg;
    label.font = [UIFont systemFontOfSize:13];
    label.textColor = [UIColor whiteColor];
    label.textAlignment =  NSTextAlignmentCenter;
    [window_ addSubview:label];
    
    //添加指示器
    UIActivityIndicatorView *loadView= [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:(UIActivityIndicatorViewStyleWhite)];
    //算出文字的宽度
    CGFloat msgW = [msg sizeWithAttributes:@{NSFontAttributeName : [UIFont systemFontOfSize:13]}].width;
    CGFloat centerX =( window_.bounds.size.width - msgW ) * 0.5 - 20;
    CGFloat centerY = window_.bounds.size.height * 0.5;
    loadView.center = CGPointMake(centerX, centerY);
    [loadView startAnimating];
    [window_ addSubview:loadView];
    
}

/**
 *  @param msg 传入输出信息
 */
+ (void)showMessage:(NSString *)msg
{
    [self showMessage:msg image:nil];
}


+ (void)showMessage:(NSString *)msg image:(UIImage *)image
{
    //每次进入这个方法都要关闭上一个timer
    [timer_ invalidate];
    timer_ = nil;
    
    [self setupWindow];
    //添加按钮
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [button setTitle:msg forState:(UIControlStateNormal)];
    button.titleLabel.font = [UIFont systemFontOfSize:13];
    button.frame = window_.bounds;
    
    //如果有图片才设置图片和间距
    if (image) {
        [button setImage:image forState:(UIControlStateNormal)];
        button.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    }
    
    [window_ addSubview:button];
    
    //添加定时器
    timer_ = [NSTimer scheduledTimerWithTimeInterval:ZJMessageDuration target:self selector:@selector(hide) userInfo:nil repeats:NO];
}

/**
 *  隐藏
 */
+ (void)hide
{
    [UIView animateWithDuration:ZJAnimationDuration animations:^{
        CGFloat windowH = 20;
        window_.transform = CGAffineTransformMakeTranslation(0, -windowH);
        
    } completion:^(BOOL finished) {
        window_.hidden = YES;
        window_ = nil;
    }];
}
@end
