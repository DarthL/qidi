//
//  ClassHomeViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/11.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "ClassHomeViewController.h"
#import "EMSDKFull.h"
#import "ChatViewController.h"
#import "AppDelegate.h"
@interface ClassHomeViewController ()

@end

@implementation ClassHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    {
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake((WIDTH-80)/2, 50, 80, 40)];
        btn.backgroundColor=[UIColor greenColor];
        [btn setTitle:@"创建班组" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(create) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
    }
    
    
    {
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake((WIDTH-80)/2, 50*2, 80, 40)];
        btn.backgroundColor=[UIColor greenColor];
        [btn setTitle:@"加入该班组" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(join) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
   
    {
        
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake((WIDTH-80)/2, 50*3, 80, 40)];
        btn.backgroundColor=[UIColor greenColor];
        [btn setTitle:@"进入聊天" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(tocom) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
    
    {
        
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake((WIDTH-80)/2, 50*4, 80, 40)];
        btn.backgroundColor=[UIColor greenColor];
        [btn setTitle:@"进入论坛" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(todics) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
    {
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake((WIDTH-80)/2, 50*5, 80, 40)];
        btn.backgroundColor=[UIColor greenColor];
        [btn setTitle:@"退出班组" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(outclass) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }
    {
        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake((WIDTH-80)/2, 50*6, 80, 40)];
        btn.backgroundColor=[UIColor greenColor];
        [btn setTitle:@"获取班组" forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(getinfo) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:btn];
        
    }



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
   
    
}
-(void)join
{
    
    EMError *error = nil;
    [[EaseMob sharedInstance].chatManager joinPublicGroup:@"1428744133705" error:&error];
    if (!error) {
        NSLog(@"入群成功");
    }
}
-(void)tocom
{
    ChatViewController *chatController = [[ChatViewController alloc] initWithChatter:@"1428744133705" isGroup:YES];
    chatController.title = @"hehe";
    AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    [delegate.minenavigation pushViewController:chatController animated:YES];
}
-(void)todics
{}
-(void)outclass
{
    EMError *error = nil;
    [[EaseMob sharedInstance].chatManager leaveGroup:@"1428744133705" error:&error];
    if (!error) {
        NSLog(@"退出群组成功");
    }
}
-(void)create
{
    EMError *error = nil;
    EMGroupStyleSetting *groupStyleSetting = [[EMGroupStyleSetting alloc] init];
    groupStyleSetting.groupMaxUsersCount = 500; // 创建500人的群，如果不设置，默认是200人。
    groupStyleSetting.groupStyle = eGroupStyle_PublicOpenJoin; // 创建不同类型的群组，这里需要才传入不同的类型
    EMGroup *group = [[EaseMob sharedInstance].chatManager createGroupWithSubject:@"qidi" description:@"群组描述" invitees:nil initialWelcomeMessage:@"邀请您加入群组" styleSetting:groupStyleSetting error:&error];
    if(!error){
        NSLog(@"创建成功 -- %@",group.groupId);
    }
}
-(void)getinfo
{
    EMError *error = nil;

   EMGroup *group =  [[EaseMob sharedInstance].chatManager fetchGroupInfo:@"1428744133705" error:&error];

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
