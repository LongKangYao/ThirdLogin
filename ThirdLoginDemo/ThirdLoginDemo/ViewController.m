//
//  ViewController.m
//  ThirdLoginDemo
//
//  Created by bioongroup on 15/7/20.
//  Copyright (c) 2015年 ylk. All rights reserved.
//

#import "ViewController.h"
#import "Header.h"

@interface ViewController ()
{
    /**
     * 显示登录状态
     */
    UILabel     *statusLab;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initNavBarAndView];
}
-(void)initNavBarAndView
{
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithTitle:@"登录"
                                                                 style:UIBarButtonItemStylePlain
                                                                target:self
                                                                action:@selector(goToLogin)];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    statusLab           = [[UILabel alloc]init];
    statusLab.center    = self.view.center;
    statusLab.bounds    = CGRectMake(0, 0, 200, 44);
    statusLab.textColor = [UIColor blackColor];
    statusLab.text      = @"当前未登录";
    statusLab.textAlignment     = NSTextAlignmentCenter;
    statusLab.backgroundColor   = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:235.0/255 alpha:1];

    [self.view addSubview:statusLab];
    
}
-(void)goToLogin
{
    LoginViewController *loginVC = [[LoginViewController alloc]init];
    
    loginVC.blockUser = ^void (SSDKUser *user){
        statusLab.text = user.nickname;
    };
    [self.navigationController  pushViewController:loginVC animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
