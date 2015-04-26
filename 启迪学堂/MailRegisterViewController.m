//
//  MailRegisterViewController.m
//  启迪学堂
//
//  Created by DarthL on 15/4/26.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "MailRegisterViewController.h"

@interface MailRegisterViewController () <UITextFieldDelegate>
{
    UITextField *mailTextFiled;
    UITextField *passwdTextFiled;
    UITextField *codenumTextFiled;
}
@end

@implementation MailRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255 green:242.0/255 blue:239.0/255 alpha:1];
    mailTextFiled=[[UITextField alloc]initWithFrame:CGRectMake(WIDTH + 10, 20, WIDTH*2-20, 40)];
    mailTextFiled.layer.cornerRadius = 5.0f;
    UIImageView *leftViewTEL = [[UIImageView alloc] initWithFrame:CGRectMake(10, 5, 20, 20)];
    leftViewTEL.image = [UIImage imageNamed:@"mail_icon.png"];
    mailTextFiled.leftViewMode = UITextFieldViewModeAlways;
    mailTextFiled.leftView = leftViewTEL;
    mailTextFiled.placeholder=@"请输入真是邮箱";
    mailTextFiled.backgroundColor=[UIColor whiteColor];
    mailTextFiled.delegate=self;
    [self.view addSubview:mailTextFiled];
    
    

}
#pragma mark - textfielddelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder ];
    return YES;
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
