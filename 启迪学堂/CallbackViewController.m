//
//  CallbackViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/10.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "CallbackViewController.h"

@interface CallbackViewController ()<UITextViewDelegate,UITextFieldDelegate>
{
    UIView*bgview;
}
@end

@implementation CallbackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255 green:242.0/255 blue:239.0/255 alpha:1];
    // Do any additional setup after loading the view.
    bgview=[[UIView alloc]initWithFrame:CGRectMake(0, 10, WIDTH, 300)];
    bgview.backgroundColor=[UIColor whiteColor];
    [self.view addSubview:bgview];
    {
        UILabel*label=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 200, 20)];
        label.backgroundColor=[UIColor clearColor];
        label.text=@"意见描述：";
        label.textColor=[UIColor blackColor];
        [label sizeToFit];
        [bgview addSubview:label];
        
        UITextView*textview=[[UITextView alloc]initWithFrame:CGRectMake(10, label.frame.origin.y+label.frame.size.height+20, WIDTH-20, 80)];
        textview.backgroundColor=[UIColor clearColor];
        textview.layer.borderWidth=0.5;
        textview.layer.borderColor=[[UIColor grayColor]CGColor];
        textview.delegate=self;
        textview.returnKeyType=UIReturnKeyDone;
        [bgview addSubview:textview];
        
        UILabel*label1=[[UILabel alloc]initWithFrame:CGRectMake(10, textview.frame.origin.y+textview.frame.size.height+20, 200, 20)];
        label1.backgroundColor=[UIColor clearColor];
        label1.text=@"意见分类：";
        label1.textColor=[UIColor blackColor];
        [label1 sizeToFit];
        [bgview addSubview:label1];
        
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake(label1.frame.origin.x+label1.frame.size.width+15, label1.frame.origin.y+5, 20, 20)];
        btn.backgroundColor=[UIColor redColor];
        [bgview addSubview:btn];
        
        UILabel*label2=[[UILabel alloc]initWithFrame:CGRectMake(btn.frame.origin.x+btn.frame.size.width+5, btn.frame.origin.y, 200, 20)];
        label2.backgroundColor=[UIColor clearColor];
        label2.text=@"客户端有bug";
        label2.textColor=[UIColor blackColor];
        [label2 sizeToFit];
        [bgview addSubview:label2];
        
        UIButton*btn1=[[UIButton alloc]initWithFrame:CGRectMake(label1.frame.origin.x+label1.frame.size.width+15, label1.frame.origin.y+5+40, 20, 20)];
        btn1.backgroundColor=[UIColor redColor];
        [bgview addSubview:btn1];
        
        UILabel*label3=[[UILabel alloc]initWithFrame:CGRectMake(btn1.frame.origin.x+btn1.frame.size.width+5, btn1.frame.origin.y, 200, 20)];
        label3.backgroundColor=[UIColor clearColor];
        label3.text=@"客户端有bug";
        label3.textColor=[UIColor blackColor];
        [label3 sizeToFit];
        [bgview addSubview:label3];
        
       
        UILabel*label4=[[UILabel alloc]initWithFrame:CGRectMake(10, btn1.frame.origin.y+btn1.frame.size.height+30, 200, 20)];
        label4.backgroundColor=[UIColor clearColor];
        label4.text=@"你的QQ：";
        label4.textColor=[UIColor blackColor];
        [label4 sizeToFit];
        [bgview addSubview:label4];
        
        UITextField*qqfield=[[UITextField alloc]initWithFrame:CGRectMake(label4.frame.origin.x+label4.frame.size.width+15, label4.frame.origin.y-5, WIDTH-(label4.frame.origin.x+label4.frame.size.width+15)-10, 30)];
        UIView*leftview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, 8, 15)];
        qqfield.leftViewMode=UITextFieldViewModeAlways;
        qqfield.leftView=leftview;
        qqfield.backgroundColor=[UIColor clearColor];
        qqfield.placeholder=@"选填";
        qqfield.layer.borderWidth=0.5;
        qqfield.layer.borderColor=[[UIColor grayColor]CGColor];
        qqfield.delegate=self;
        [bgview addSubview:qqfield];
        


    }
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.leftbarbtn setTitle:@"后退" forState:UIControlStateNormal];
    [self.leftbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.leftbarbtn addTarget:self action:@selector(toback) forControlEvents:UIControlEventTouchUpInside];
    [super viewWillAppear:animated];
    
}
-(void)toback
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text{
    if ([text isEqualToString:@"\n"]){ //判断输入的字是否是回车，即按下return
        //在这里做你响应return键的代码
        [textView resignFirstResponder];
        return NO; //这里返回NO，就代表return键值失效，即页面上按下return，不会出现换行，如果为yes，则输入页面会换行
    }
    
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    [self upanmiate];
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField
{
    [self downanmiate];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [self downanmiate];
    [textField resignFirstResponder];

    return YES;
}
-(void)upanmiate
{
    [UIView beginAnimations:nil context:nil];
    //设置动画时长
    [UIView setAnimationDuration:1.0];
    CGRect frame=bgview.frame;
    frame.origin.y-=100;
    bgview.frame=frame;
    [UIView commitAnimations];
}
-(void)downanmiate
{
    [UIView beginAnimations:nil context:nil];
    //设置动画时长
    [UIView setAnimationDuration:1.0];
    CGRect frame=bgview.frame;
    frame.origin.y+=100;
    bgview.frame=frame;
    [UIView commitAnimations];

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
