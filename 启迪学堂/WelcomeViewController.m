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

    self.view.backgroundColor=[UIColor greenColor];
    
    
    {
        loginnum=[[UITextField alloc]initWithFrame:CGRectMake(20, 100, WIDTH-40, 30)];
        loginnum.placeholder=@"邮箱/手机号";
        loginnum.backgroundColor=[UIColor whiteColor];
        loginnum.delegate=self;
        [self.view addSubview:loginnum];
    }
    {
        passwd=[[UITextField alloc]initWithFrame:CGRectMake(20, 140, WIDTH-40, 30)];
        passwd.placeholder=@"密码";
        passwd.secureTextEntry=YES;
        passwd.delegate=self;
        passwd.backgroundColor=[UIColor whiteColor];
        [self.view addSubview:passwd];
        
        UIButton*loginbtn=[[UIButton alloc]initWithFrame:CGRectMake(30, passwd.frame.origin.y+passwd.frame.size.height+10, WIDTH-60, 30)];
        loginbtn.backgroundColor=[UIColor redColor];
        [loginbtn setTitle:@"登陆" forState:UIControlStateNormal];
        [loginbtn addTarget:self action:@selector(loginonapp) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:loginbtn];
        
        UIButton*registbtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-80, loginbtn.frame.origin.y+loginbtn.frame.size.height+10, 60, 30)];
        registbtn.backgroundColor=[UIColor purpleColor];
        [registbtn setTitle:@"注册" forState:UIControlStateNormal];
        [registbtn addTarget:self action:@selector(toregister) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:registbtn];
    }

    
    
    
    {
    UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(80, 300, 30, 30)];
    btn.backgroundColor=[UIColor blueColor];
    [btn setTitle:@"QQ" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(loginQQ) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    }
    {
    UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(80+50, 300, 30, 30)];
    btn.backgroundColor=[UIColor blueColor];
    [btn setTitle:@"WB" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(loginWB) forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:btn];
    }
    {
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(80+50*2, 300, 30, 30)];
        btn.backgroundColor=[UIColor blueColor];
        [btn setTitle:@"RR" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(loginRR) forControlEvents:UIControlEventTouchUpInside];

        [self.view addSubview:btn];
        
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
