//
//  LoginViewController.m
//  ThirdLoginDemo
//
//  Created by bioongroup on 15/7/20.
//  Copyright (c) 2015年 ylk. All rights reserved.
//

/**
 *第三方登录按钮的宽高
 */
#define BTN_WIDTH 80

#import "LoginViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self initView];
}
-(void)initView
{

    NSArray *imgArr  = @[@"sinaweibo",@"weixin",@"QQ"];
    
    for (int i = 0; i < imgArr.count; i ++)
    {
        
        UIButton *itemBtn   = [UIButton buttonWithType:UIButtonTypeSystem];
        itemBtn.frame       = CGRectMake(VIEW_WIDTH/2-BTN_WIDTH/2,150+30+i*BTN_WIDTH+i*25, BTN_WIDTH, BTN_WIDTH);
        itemBtn.tag             = 100+i;
        itemBtn.backgroundColor = [UIColor blackColor];
        itemBtn.layer.masksToBounds = YES;
        itemBtn.layer.cornerRadius  = BTN_WIDTH/2.0;
        [itemBtn setBackgroundImage:[UIImage imageNamed:imgArr[i]]
                 forState:UIControlStateNormal];
        [itemBtn addTarget:self
                    action:@selector(clickLoginKind:)
          forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:itemBtn];
    }
}
-(void)clickLoginKind:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    switch (btn.tag)
    {
        case 100:
            NSLog(@"新浪登录");
            [self loginVC:SSDKPlatformTypeSinaWeibo];
            break;
        case 101:
        {
            NSLog(@"微信登录");
            SHOW_ALERT(@"请先完善你的应用id 以及 key !");
            //[self loginVC:SSDKPlatformTypeWechat];
        }
            break;
        case 102:
        {
            NSLog(@"QQ登录");

            SHOW_ALERT(@"请先完善你的应用id 以及 key !");
            //[self loginVC:SSDKPlatformTypeQQ];
        }
            break;
            
        default:
            break;
    }
}
-(void)loginVC:(SSDKPlatformType)platform
{
    [SSEThirdPartyLoginHelper loginByPlatform:platform
                                   onUserSync:^(SSDKUser *user, SSEUserAssociateHandler associateHandler) {
                                       
                                       //在此回调中可以将社交平台用户信息与自身用户系统进行绑定，最后使用一个唯一用户标识来关联此用户信息。
                                       //在此示例中没有跟用户系统关联，则使用一个社交用户对应一个系统用户的方式。将社交用户的uid作为关联ID传入associateHandler。
                                       NSString *str = [NSString stringWithFormat:@"登录成功,用户名是--> :%@",user.nickname];
                                       SHOW_ALERT(str);
                                       
                                       self.blockUser(user);
                                       
                                   }
                                onLoginResult:^(SSDKResponseState state, SSEBaseUser *user, NSError *error) {
                                    
                                    if (state == SSDKResponseStateSuccess)
                                    {
                                        
                                        
                                    }else
                                    {
                                        NSLog(@"登录失败的用户信息---->%@",error.localizedDescription);
                                    }
                                    
                                }];

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
