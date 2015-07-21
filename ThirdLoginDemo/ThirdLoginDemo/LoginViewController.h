//
//  LoginViewController.h
//  ThirdLoginDemo
//
//  Created by bioongroup on 15/7/20.
//  Copyright (c) 2015年 ylk. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Header.h"
/**
 * 定义回调函数
 */
typedef void (^ChangeBgColor)(SSDKUser *user);

@interface LoginViewController : UIViewController

/**
 * 声明block变量
 */
@property (nonatomic ,copy)ChangeBgColor blockUser;

@end
