//
//  TelRegisterViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/15.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "TelRegisterViewController.h"
#import <SMS_SDK/SMS_SDK.h>
#import "ASIFormDataRequest.h"
#import "AppDelegate.h"
@interface TelRegisterViewController ()<UITextFieldDelegate>
{
    UITextField*telnum;
    UITextField*passwd;
    UITextField*codenum;
}
@end

@implementation TelRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255 green:242.0/255 blue:239.0/255 alpha:1];
    // Do any additional setup after loading the view.
    telnum=[[UITextField alloc]initWithFrame:CGRectMake(10, 20, WIDTH-20, 40)];
    telnum.layer.cornerRadius = 5.0f;
    UIImageView *leftViewTEL = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 20, 20)];
    leftViewTEL.image = [UIImage imageNamed:@"mobile_icon.png"];
    telnum.leftViewMode = UITextFieldViewModeAlways;
    telnum.leftView = leftViewTEL;
    telnum.placeholder=@"请输入11位手机号";
    telnum.backgroundColor=[UIColor whiteColor];
    telnum.delegate=self;
    [self.view addSubview:telnum];
    
    UIButton*sendcode=[[UIButton alloc]initWithFrame:CGRectMake(10, telnum.frame.size.height+telnum.frame.origin.y+20, 100, 40)];
    sendcode.backgroundColor = [HandleTools colorStringToInt:@"0x00b4ff"];
    sendcode.layer.cornerRadius = 5.0f;
    [sendcode addTarget:self action:@selector(getCode) forControlEvents:UIControlEventTouchUpInside];
    [sendcode setFont:[UIFont systemFontOfSize:15]];
    [sendcode setTitle:@"验证码" forState:UIControlStateNormal];
    [self.view addSubview:sendcode];
    
    codenum=[[UITextField alloc]initWithFrame:CGRectMake(sendcode.frame.origin.x+sendcode.frame.size.width+10, sendcode.frame.origin.y, WIDTH - 130, 40)];
    codenum.layer.cornerRadius = 5.0f;
    codenum.backgroundColor=[UIColor whiteColor];
    codenum.delegate=self;
    [self.view addSubview:codenum];
    
    passwd=[[UITextField alloc]initWithFrame:CGRectMake(10, sendcode.frame.size.height+sendcode.frame.origin.y+20, WIDTH-20, 40)];
    passwd.placeholder=@"6~32位密码";
    passwd.backgroundColor=[UIColor whiteColor];
    passwd.layer.cornerRadius = 5.0f;
    passwd.delegate=self;
    passwd.secureTextEntry=YES;
    UIImageView *leftViewPwd = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 20, 20)];
    leftViewPwd.image = [UIImage imageNamed:@"passport_icon"];
    passwd.leftViewMode = UITextFieldViewModeAlways;
    passwd.leftView = leftViewPwd;
    [self.view addSubview:passwd];

    UIButton*regbtn=[[UIButton alloc]initWithFrame:CGRectMake(10, passwd.frame.origin.y+passwd.frame.size.height+20, WIDTH-20, 40)];
    regbtn.backgroundColor = [HandleTools colorStringToInt:@"0x00b4ff"];
    regbtn.layer.cornerRadius = 5.0f;
    [regbtn addTarget:self action:@selector(toRegist) forControlEvents:UIControlEventTouchUpInside];
    [regbtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.view addSubview:regbtn];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - textfielddelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder ];
    return YES;
}
#pragma mark - 网络请求
-(void)getCode
{
    [SMS_SDK getVerificationCodeBySMSWithPhone:telnum.text
                                          zone:@"86"
                                        result:^(SMS_SDKError *error)
     {
         if (!error)
         {
             NSLog(@"获取验证码成功");
         }
         else
         {
             UIAlertView* alert=[[UIAlertView alloc] initWithTitle:NSLocalizedString(@"codesenderrtitle", nil)
                                                           message:[NSString stringWithFormat:@"状态码：%zi ,错误描述：%@",error.errorCode,error.errorDescription]
                                                          delegate:self
                                                 cancelButtonTitle:NSLocalizedString(@"sure", nil)
                                                 otherButtonTitles:nil, nil];
             [alert show];
         }
         
     }];
}
-(BOOL)checkCode
{
    NSString*strURL=[NSString stringWithFormat:@"https://api.sms.mob.com/sms/verify"];
    NSURL*url=[NSURL URLWithString:strURL];
    ASIFormDataRequest*actrequest=[ASIFormDataRequest requestWithURL:url];
    [actrequest setPostValue:@"6df5d2d231f3" forKey:@"appkey"];
    [actrequest setPostValue:telnum.text forKey:@"phone"];
    [actrequest setPostValue:@"86" forKey:@"zone"];
    [actrequest setPostValue:codenum.text forKey:@"code"];


    [actrequest startSynchronous];
    NSError*error=[actrequest error];
    if(!error)
    {
        NSData*data=[actrequest responseData];
        NSDictionary*resDict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        NSNumber*status;
        if(resDict.count>0)
        {
            for (id key in resDict) {
                if([key isEqualToString:@"status"])
                {
                    status=[resDict objectForKey:@"status"];
                    if([status isEqualToNumber:[NSNumber numberWithInt:200]])
                    {
                        return YES;
                    }
                }
            }
        }
    }else
    {
        return NO;
    }
    return NO;
    
}
-(void)toRegist
{
    if(1)//([self checkCode])
    {
    NSString*key=[HandleTools md5:[NSString stringWithFormat:@"qidi@)!$%@",telnum.text]];
    NSString*strurl=[NSString stringWithFormat:@"%@registeronapp?phoneNum=%@&userName=%@&passwd=%@&key=%@",WebAddress,telnum.text,telnum.text,passwd.text,key];
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
                        dispatch_sync(dispatch_get_main_queue(), ^{
                            
                        AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
                        [delegate.welcomenavigation popViewControllerAnimated:YES];
                        });

                        UIAlertView *alertview=[[UIAlertView alloc] initWithTitle:@"提示" message:@"注册成功"
                                                                         delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                        //[alertview show];修复闪屏
                        [alertview performSelectorOnMainThread: @selector(show)
                                                    withObject: nil
                                                 waitUntilDone: YES];
                    }else if([code isEqualToNumber:[NSNumber numberWithInt:-2]])
                              {
                                  UIAlertView *alertview=[[UIAlertView alloc] initWithTitle:@"提示" message:@"用户存在"
                                                                                   delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
                                  //[alertview show];修复闪屏
                                  [alertview performSelectorOnMainThread: @selector(show)
                                                              withObject: nil
                                                           waitUntilDone: YES];

                              }
                    else
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
    }else
    {
        UIAlertView *alertview=[[UIAlertView alloc] initWithTitle:@"提示" message:@"验证码错误"
                                                         delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
        //[alertview show];修复闪屏
        [alertview performSelectorOnMainThread: @selector(show)
                                    withObject: nil
                                 waitUntilDone: YES];

    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
@end
