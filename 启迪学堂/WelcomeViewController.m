//
//  WelcomeViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/9.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "WelcomeViewController.h"
#import "UMSocial.h"
#import "AppDelegate.h"
#import "EMSDKFull.h"
#import "RegisterViewController.h"
//#import "RegViewController.h"

@interface WelcomeViewController ()<UITextFieldDelegate>
{
    AppDelegate*delegate;
    UITextField*passwd;
    UITextField*loginnum;
}

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];

    self.view.backgroundColor=[UIColor whiteColor];
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    UIView *aboveView = [[UIView alloc] init];
    aboveView.frame = CGRectMake(0, 0, WIDTH, 380);
    aboveView.backgroundColor = [HandleTools colorStringToInt:@"0x2d9ad2"];
    [self.view addSubview:aboveView];
    
    UIView *flowerBorderView = [[UIView alloc] init];
    
    flowerBorderView.frame = CGRectMake(0, 380, WIDTH, 40);
    [flowerBorderView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"bg_flower"]]];
    [self.view addSubview:flowerBorderView];
    
    {
        
        UIImageView *loginInputView = [[UIImageView alloc] init];
        loginInputView.frame = CGRectMake(50, 180, WIDTH-100, 90);
        UIImage *image = [UIImage imageNamed:@"input_area"];
        image = [image stretchableImageWithLeftCapWidth:7 topCapHeight:6];
        loginInputView.image = image;
        [self.view addSubview:loginInputView];
        
        
        loginnum=[[UITextField alloc]initWithFrame:CGRectMake(18, 3, loginInputView.frame.size.width - 50, 40)];
        loginnum.placeholder=@"邮箱/手机号";
        loginnum.backgroundColor=[UIColor clearColor];
        loginnum.delegate=self;
        [loginInputView addSubview:loginnum];
        
        UIButton *pullBtn = [[UIButton alloc] initWithFrame:CGRectMake(loginInputView.frame.size.width - 15-15, loginnum.frame.origin.x, 15, 8)];
        [pullBtn setBackgroundImage:[UIImage imageNamed:@"select_id_button"] forState:UIControlStateNormal];
        [pullBtn addTarget:self action:@selector(popHistoryAccount) forControlEvents:UIControlEventTouchUpInside];
        
        [loginInputView addSubview:pullBtn];
        
        //画直线
        
        passwd=[[UITextField alloc]initWithFrame:CGRectMake(18, loginnum.frame.origin.y+loginnum.frame.size.height ,loginInputView.frame.size.width - 50, 40)];
        passwd.placeholder=@"密码";
        passwd.secureTextEntry=YES;
        passwd.delegate=self;
        passwd.backgroundColor=[UIColor clearColor];
        [loginInputView addSubview:passwd];
        
        UIButton*loginbtn=[[UIButton alloc]initWithFrame:CGRectMake(50,loginInputView.frame.size.height+loginInputView.frame.origin.y+20,WIDTH-100,35)];
        loginbtn.backgroundColor=[HandleTools colorStringToInt:@"0x116591"];
        [loginbtn setTitle:@"登录" forState:UIControlStateNormal];
        loginbtn.layer.cornerRadius = 5.0f;
        [loginbtn addTarget:self action:@selector(loginonapp) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:loginbtn];
    
        UIButton *forgotPwdBtn = [[UIButton alloc] initWithFrame:CGRectMake(50, loginbtn.frame.size.height+loginbtn.frame.origin.y + 20, 80,15)];
        NSMutableAttributedString *str = [[NSMutableAttributedString alloc] initWithString:@"忘记密码？"];
        NSRange strRange = {0,[str length]};
        [str addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:strRange];
        [str addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:strRange];
        [str addAttribute:NSFontAttributeName value:[UIFont fontWithName:@"Helvetica" size:13] range:strRange];
        [forgotPwdBtn setAttributedTitle:str forState:UIControlStateNormal];
        [forgotPwdBtn addTarget:self action:@selector(forgotPwdBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:forgotPwdBtn];
    
        
        UIButton*registbtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-loginbtn.frame.origin.x-38, forgotPwdBtn.frame.origin.y, 38, 20)];
        [registbtn setTitle:@"注册" forState:UIControlStateNormal];
        registbtn.titleLabel.font = [UIFont fontWithName:@"Helvetica" size:18];
        [registbtn addTarget:self action:@selector(toregister) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:registbtn];
        
        UILabel *otherAccountLoginLabel = [[UILabel alloc] init];
        otherAccountLoginLabel.text = @"其他账号登录";
        [otherAccountLoginLabel sizeToFit];
        otherAccountLoginLabel.frame = CGRectMake(WIDTH * 0.5 - otherAccountLoginLabel.frame.size.width * 0.5, flowerBorderView.frame.size.height+flowerBorderView.frame.origin.y+ 10, otherAccountLoginLabel.frame.size.width, otherAccountLoginLabel.frame.size.height);
        otherAccountLoginLabel.textColor = [HandleTools colorStringToInt:@"0x2d9ad2"];
        [self.view addSubview:otherAccountLoginLabel];
        
        
        UIButton *qqBtn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH *0.25 - 67 * 0.75, otherAccountLoginLabel.frame.origin.y+otherAccountLoginLabel.frame.size.height + 18, 67, 67)];
        [qqBtn setBackgroundImage:[UIImage imageNamed:@"qq_login_button"] forState:UIControlStateNormal];
        [qqBtn addTarget:self action:@selector(loginQQ) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:qqBtn];
        
        
        UIButton *WBbtn = [[UIButton alloc]initWithFrame:CGRectMake(WIDTH*0.5 - 67*0.5, otherAccountLoginLabel.frame.origin.y+otherAccountLoginLabel.frame.size.height + 18, 67, 67)];
        [WBbtn setBackgroundImage:[UIImage imageNamed:@"sina_login_button"] forState:UIControlStateNormal];
        [WBbtn addTarget:self action:@selector(loginWB) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:WBbtn];
        
        
        UIButton *rrbtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH*0.75- 67*0.25, otherAccountLoginLabel.frame.origin.y+otherAccountLoginLabel.frame.size.height + 18, 67, 67)];
        [rrbtn setBackgroundImage:[UIImage imageNamed:@"renren_login_button"] forState:UIControlStateNormal];
        [rrbtn addTarget:self action:@selector(loginRR) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:rrbtn];
    }
    
    
    

    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:NO];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)loginWB
{
    BOOL isOauth = [UMSocialAccountManager isOauthWithPlatform:UMShareToSina];
    if(!isOauth)
    {
      UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToSina];
    snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response)
                                  {
                                      NSLog(@"response is %@",response);
                                      
                                       if(response.responseCode== UMSResponseCodeSuccess)
                                       {
                                           
                                           
                                           [[UMSocialDataService defaultDataService] requestSocialAccountWithCompletion:^(UMSocialResponseEntity *accountResponse){
                                               
                                               [self getMyinfo:[[[accountResponse.data objectForKey:@"accounts"] objectForKey:UMShareToSina] objectForKey:@"username"] id:[[[accountResponse.data objectForKey:@"accounts"] objectForKey:UMShareToSina] objectForKey:@"usid"]];
                                               
                                                    [self inLogin];

                                           }];


                                       }
                                  });
       
    }else
    {
        [[UMSocialDataService defaultDataService] requestSocialAccountWithCompletion:^(UMSocialResponseEntity *accountResponse){
            
            [self getMyinfo:[[[accountResponse.data objectForKey:@"accounts"] objectForKey:UMShareToSina] objectForKey:@"username"] id:[[[accountResponse.data objectForKey:@"accounts"] objectForKey:UMShareToSina] objectForKey:@"usid"]];
            
            [self inLogin];
            
        }];


    }
    
    
    
}
-(void)loginQQ
{
    BOOL isOauth = [UMSocialAccountManager isOauthWithPlatform:UMShareToQzone];
    if(!isOauth)
    {
        UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToQzone];
        snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response)
                                      {
                                          NSLog(@"response is %@",response);
                                          
                                          if(response.responseCode== UMSResponseCodeSuccess)
                                          {
                                              [[UMSocialDataService defaultDataService] requestSocialAccountWithCompletion:^(UMSocialResponseEntity *accountResponse){
                                                  
                                                  [self getMyinfo:[[[accountResponse.data objectForKey:@"accounts"] objectForKey:UMShareToQzone] objectForKey:@"username"] id:[[[accountResponse.data objectForKey:@"accounts"] objectForKey:UMShareToQzone] objectForKey:@"usid"]];
                                                  
                                                  [self inLogin];
                                                  
                                              }];
                                              
                                          }

                                      });
    }else
    {
        [[UMSocialDataService defaultDataService] requestSocialAccountWithCompletion:^(UMSocialResponseEntity *accountResponse){
            
            [self getMyinfo:[[[accountResponse.data objectForKey:@"accounts"] objectForKey:UMShareToQzone] objectForKey:@"username"] id:[[[accountResponse.data objectForKey:@"accounts"] objectForKey:UMShareToQzone] objectForKey:@"usid"]];
            
            [self inLogin];
            
        }];

    }
   
}
-(void)loginRR
{
    BOOL isOauth = [UMSocialAccountManager isOauthWithPlatform:UMShareToRenren];
    if(!isOauth)
    {
        UMSocialSnsPlatform *snsPlatform = [UMSocialSnsPlatformManager getSocialPlatformWithName:UMShareToRenren];
        snsPlatform.loginClickHandler(self,[UMSocialControllerService defaultControllerService],YES,^(UMSocialResponseEntity *response)
                                      {
                                          NSLog(@"response is %@",response);
                                          
                                          if(response.responseCode== UMSResponseCodeSuccess)
                                          {
                                              [[UMSocialDataService defaultDataService] requestSocialAccountWithCompletion:^(UMSocialResponseEntity *accountResponse){
                                                  
                                                  [self getMyinfo:[[[accountResponse.data objectForKey:@"accounts"] objectForKey:UMShareToRenren] objectForKey:@"username"] id:[[[accountResponse.data objectForKey:@"accounts"] objectForKey:UMShareToRenren] objectForKey:@"usid"]];
                                                  
                                                  [self inLogin];
                                                  
                                              }];
                                              
                                          }

                                      });
    }else
    {
        [[UMSocialDataService defaultDataService] requestSocialAccountWithCompletion:^(UMSocialResponseEntity *accountResponse){
            
            [self getMyinfo:[[[accountResponse.data objectForKey:@"accounts"] objectForKey:UMShareToRenren] objectForKey:@"username"] id:[[[accountResponse.data objectForKey:@"accounts"] objectForKey:UMShareToRenren] objectForKey:@"usid"]];
            
            [self inLogin];
            
        }];

    }
  
}
-(void)getMyinfo:(NSString*)username id:(NSString*)userid
{
    delegate.meInfo.nickName=username;
    delegate.meInfo.userId=userid;
}
-(void)inLogin
{
    EMError *error = nil;
    BOOL isSuccess = [[EaseMob sharedInstance].chatManager registerNewAccount:[NSString stringWithFormat:@"qidi%@",delegate.meInfo.userId] password:@"111111" error:&error];
    if (isSuccess) {
        NSLog(@"注册成功");
    }else
    {
    NSDictionary *loginInfo = [[EaseMob sharedInstance].chatManager loginWithUsername:[NSString stringWithFormat:@"qidi%@",delegate.meInfo.userId] password:@"111111" error:&error];
    if (!error && loginInfo) {
        NSLog(@"登陆成功");
    }
        else
        {
            UIAlertView *alertview=[[UIAlertView alloc] initWithTitle:@"提示" message:@"网络错误，请检查网络"
                                                                                                                 delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                                                                //[alertview show];修复闪屏
                                                                [alertview performSelectorOnMainThread: @selector(show)
                                                                                            withObject: nil
                                                                                         waitUntilDone: YES];
            return;

        }

    }
    
   
    
    delegate.window.rootViewController=delegate.tabbar;
}
#pragma mark - 普通登陆及注册

-(void)toregister
{
    RegisterViewController*registview=[[RegisterViewController alloc]init];
    [self.navigationController pushViewController:registview animated:YES];
//    RegViewController* reg=[[RegViewController alloc] init];
//    [self presentViewController:reg animated:YES completion:^{
//        
//    }];

}
-(void)loginonapp
{
    
        NSString*key=[HandleTools md5:[NSString stringWithFormat:@"qidi@)!$%@",passwd.text]];
        NSString*password=[HandleTools md5:passwd.text];
        NSString*strurl=[NSString stringWithFormat:@"%@loginonapp?userName=%@&passwd=%@&key=%@",WebAddress,loginnum.text,password,key];

        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            NSDictionary*dict= [HandleTools AsiGetSync:strurl];
            NSNumber*code;
            if(dict.count>0)
            {
                for (id key in dict) {
                    if([key isEqualToString:@"code"])
                    {
                        code=[dict objectForKey:@"code"];
                        if([code isEqualToNumber:[NSNumber numberWithInt:1]])
                        {
                            NSLog(@"hehe");
                            NSDictionary*data=[dict objectForKey:@"data"];
                            AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
                            [HandleTools diction2Bean:data bean:delegate.meInfo];
                            dispatch_sync(dispatch_get_main_queue(), ^{
                                [self inLogin];

                            });
                        }else
                        {
                            UIAlertView *alertview=[[UIAlertView alloc] initWithTitle:@"提示" message:@"抱歉，请检查"
                                                                             delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                            //[alertview show];修复闪屏
                            [alertview performSelectorOnMainThread: @selector(show)
                                                        withObject: nil
                                                     waitUntilDone: YES];

                        }
                    }
                }
            }
            
        });
    

}
#pragma mark - textfielddelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder ];
    return YES;
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
