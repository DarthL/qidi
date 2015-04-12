//
//  writeCommentViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/8.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "writeCommentViewController.h"
#define START_TAG 1000
@interface writeCommentViewController ()<UITextViewDelegate>

@end

@implementation writeCommentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255 green:242.0/255 blue:239.0/255 alpha:1];
    UILabel*title=[[UILabel alloc]initWithFrame:CGRectMake(10, 10, 100, 15)];
    title.backgroundColor=[UIColor clearColor];
    title.text=@"评价课程";
    title.textColor=[UIColor blackColor];
    [self.view addSubview:title];
    UIView*lineview=[[UIView alloc]initWithFrame:CGRectMake(0, 5+title.frame.origin.y+title.frame.size.height, WIDTH, 2)];
    lineview.backgroundColor=[UIColor greenColor];
    [self.view addSubview:lineview];
    
    UILabel*scoreLabel=[[UILabel alloc]initWithFrame:CGRectMake(10, lineview.frame.origin.y+30, 100, 15)];
    scoreLabel.backgroundColor=[UIColor clearColor];
    scoreLabel.text=@"请打分：";
    scoreLabel.textColor=[UIColor blackColor];
    [scoreLabel sizeToFit];
    [self.view addSubview:scoreLabel];
    
    for(int i=0;i<5;i++)
    {
        UIButton*stars=[[UIButton alloc]initWithFrame:CGRectMake(scoreLabel.frame.origin.x+scoreLabel.frame.size.width+40*i, scoreLabel.frame.origin.y, 20, 20)];
        stars.backgroundColor=[UIColor purpleColor];
        stars.tag=START_TAG+i;
        [stars addTarget:self action:@selector(chstars:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:stars];
    }

    UITextView*textfield=[[UITextView alloc]initWithFrame:CGRectMake(10,scoreLabel.frame.origin.y+scoreLabel.frame.size.height+20 , WIDTH-20, 80)];
    textfield.backgroundColor=[UIColor whiteColor];
    textfield.returnKeyType=UIReturnKeyDone;
    textfield.delegate=self;
    [self.view addSubview:textfield];
    
    UIButton*combtn=[[UIButton alloc]initWithFrame:CGRectMake(20, textfield.frame.origin.y+textfield.frame.size.height+20, WIDTH-40, 40)];
    combtn.backgroundColor=[UIColor greenColor];
    [combtn setTitle:@"评价" forState:UIControlStateNormal];
    [combtn addTarget:self action:@selector(toback) forControlEvents:UIControlEventTouchUpInside];
    [combtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [self.view addSubview:combtn];
    
    

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
-(void)chstars:(UIButton*)btn
{
    for(int i=0;i<5;i++)
    {
        UIButton*btn=(UIButton*)[self.view viewWithTag:i+START_TAG];
        btn.backgroundColor=[UIColor purpleColor];

    }
    long index=btn.tag-START_TAG;
    for(int i=0;i<=index;i++)
    {
        UIButton*btn=(UIButton*)[self.view viewWithTag:i+START_TAG];
        btn.backgroundColor=[UIColor redColor];
    }
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
