//
//  ZJStatusHUD.h
//  ZJStatusHUD
//
//  Created by 张杰 on 16/5/24.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZJStatusHUD : NSObject
/**
 *  显示带图片的普通信息
 *
 *  @param msg   信息
 *  @param image 图片
 */
+ (void)showMessage:(NSString *)msg image:(UIImage *)image;

/**
 * 普通信息
 */
+ (void)showSuccess:(NSString *)msg;
/**
 *  显示失败信息
 *
 *  @param msg 传入失败后要输出的信息
 */
+ (void)showError:(NSString *)msg;

/**
 *  显示成功信息
 *
 *  @param msg 传入加载中的输出信息
 */
+ (void)showLoading:(NSString *)msg;

/**
 *  @param msg 传入输出信息
 */
+ (void)showMessage:(NSString *)msg;

/**
 *  隐藏
 */
+ (void)hide;

@end
