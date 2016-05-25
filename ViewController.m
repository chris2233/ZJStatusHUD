//
//  ViewController.m
//  ZJStatusHUD
//
//  Created by 张杰 on 16/5/24.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "ViewController.h"
#import "ZJStatusHUD.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}
- (IBAction)success
{
    [ZJStatusHUD showSuccess:@"加载成功"];
}

- (IBAction)error
{
    [ZJStatusHUD showError:@"加载出错"];
}

- (IBAction)loading
{
    [ZJStatusHUD showLoading:@"正在加载"];
}

- (IBAction)hide
{
    [ZJStatusHUD hide];
}
- (IBAction)message
{
    [ZJStatusHUD showMessage:@"普通信息"];
}

@end
