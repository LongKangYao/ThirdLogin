//
//  Header.h
//  ThirdLoginDemo
//
//  Created by bioongroup on 15/7/20.
//  Copyright (c) 2015年 ylk. All rights reserved.
//

#ifndef ThirdLoginDemo_Header_h
#define ThirdLoginDemo_Header_h

#import "ViewController.h"

/**
 导入库
 libicucore.dylib
 libz1.2.5.dylib
 libstdc++.dylib
 JavaScriptCore.framework
*/
#import <ShareSDK/ShareSDK.h>

/**
 *  第三方登录界面
 */
#import "LoginViewController.h"

/**
 * 第三方登录头文件
 */
#import <ShareSDKExtension/SSEThirdPartyLoginHelper.h>

/**
 * 声明屏幕的宽高
 */
#define VIEW_WIDTH      [UIScreen mainScreen].bounds.size.width
#define VIEW_HEIGHT     [UIScreen mainScreen].bounds.size.height

/**
 * 定义弹出框
 */
#define SHOW_ALERT(msg) UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提醒" message:msg delegate:nil cancelButtonTitle:nil otherButtonTitles:@"确定", nil];\
[alert show];

/**
 * 定义颜色值
 */
#define RGB(rgb) [UIColor colorWithRed:(rgb)/255.0 green:(rgb)/255.0 blue:(rgb)/255.0 alpha:1.0]

#endif
