//
//  AppDelegate.m
//  ZJStatusHUD
//
//  Created by 张杰 on 16/5/24.
//  Copyright © 2016年 zhangjie. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    UIWindow *window = [[UIWindow alloc] init];
    window.rootViewController = [[ViewController alloc] init];
    [window makeKeyAndVisible];
    
    return YES;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

@end
