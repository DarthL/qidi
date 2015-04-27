//
//  notedetailViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/10.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "notedetailViewController.h"
#import "writeNoteViewController.h"
#import "ShowPlayerViewController.h"
@interface notedetailViewController ()

@end

@implementation notedetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255 green:242.0/255 blue:239.0/255 alpha:1];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.leftbarbtn setTitle:@"后退" forState:UIControlStateNormal];
    [self.leftbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.leftbarbtn addTarget:self action:@selector(toback) forControlEvents:UIControlEventTouchUpInside];
    
    [self.rightbarbtn setTitle:@"编辑" forState:UIControlStateNormal];
    [self.rightbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.rightbarbtn addTarget:self action:@selector(towritenote) forControlEvents:UIControlEventTouchUpInside];
    [super viewWillAppear:animated];
    
    UIButton*playerview=[[UIButton alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 60)];
    playerview.backgroundColor=[UIColor whiteColor];
    
    UILabel *noteTopic = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, WIDTH-30, 20)];
    noteTopic.text = @"Cocos-2d JS事件处理机制";
    noteTopic.textColor = [HandleTools colorStringToInt:@"0x00b4ff"];
    [playerview addSubview:noteTopic];
    
    UIImageView *rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 35, 15, 17, 30)];
    rightImage.image = [UIImage imageNamed:@"rightarrow_button"];
    [playerview addSubview:rightImage];
    [playerview addTarget:self action:@selector(toshowplay) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:playerview];
    
    UITextView *noteContent = [[UITextView alloc] initWithFrame:CGRectMake(0, playerview.frame.origin.y+playerview.frame.size.height + 5, WIDTH, HEIGHT - 64 -30)];
    noteContent.text = @"这是我的第一个笔记，这是我的第一个笔记";
    [self.view addSubview:noteContent];
    
    
}
-(void)toback
{
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
}
-(void)towritenote
{
    writeNoteViewController*noteview=[[writeNoteViewController alloc]init];
    [self.navigationController pushViewController:noteview animated:YES];
}
-(void)toshowplay
{
    ShowPlayerViewController*showview=[[ShowPlayerViewController alloc]init];
    [self.navigationController pushViewController:showview animated:YES];
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
