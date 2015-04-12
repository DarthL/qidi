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
@interface WelcomeViewController ()
{
    AppDelegate*delegate;

}

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];

    self.view.backgroundColor=[UIColor greenColor];
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
    [self.navigationController setNavigationBarHidden:YES];
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
    delegate.meInfo.username=username;
    delegate.meInfo.myId=userid;
}
-(void)inLogin
{
    EMError *error = nil;
    BOOL isSuccess = [[EaseMob sharedInstance].chatManager registerNewAccount:[NSString stringWithFormat:@"qidi%@",delegate.meInfo.myId] password:@"111111" error:&error];
    if (isSuccess) {
        NSLog(@"注册成功");
    }else
    {
    NSDictionary *loginInfo = [[EaseMob sharedInstance].chatManager loginWithUsername:[NSString stringWithFormat:@"qidi%@",delegate.meInfo.myId] password:@"111111" error:&error];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
