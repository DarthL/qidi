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
//    {
//        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake((WIDTH-80)/2, 50, 80, 40)];
//        btn.backgroundColor=[UIColor greenColor];
//        [btn setTitle:@"创建班组" forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(create) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:btn];
//    }
//    
//    
//    {
//        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake((WIDTH-80)/2, 50*2, 80, 40)];
//        btn.backgroundColor=[UIColor greenColor];
//        [btn setTitle:@"加入该班组" forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(join) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:btn];
//        
//    }
//   
//    {
//        
//        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake((WIDTH-80)/2, 50*3, 80, 40)];
//        btn.backgroundColor=[UIColor greenColor];
//        [btn setTitle:@"进入聊天" forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(tocom) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:btn];
//        
//    }
//    
//    {
//        
//        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake((WIDTH-80)/2, 50*4, 80, 40)];
//        btn.backgroundColor=[UIColor greenColor];
//        [btn setTitle:@"进入论坛" forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(todics) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:btn];
//        
//    }
//    {
//        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake((WIDTH-80)/2, 50*5, 80, 40)];
//        btn.backgroundColor=[UIColor greenColor];
//        [btn setTitle:@"退出班组" forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(outclass) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:btn];
//        
//    }
//    {
//        UIButton*btn=[[UIButton alloc]initWithFrame:CGRectMake((WIDTH-80)/2, 50*6, 80, 40)];
//        btn.backgroundColor=[UIColor greenColor];
//        [btn setTitle:@"获取班组" forState:UIControlStateNormal];
//        [btn addTarget:self action:@selector(getinfo) forControlEvents:UIControlEventTouchUpInside];
//        [self.view addSubview:btn];
//        
//    }

    UIImageView *profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 50, 50)];
    profileImageView.image = [UIImage imageNamed:@"profile.jpg"];
    [self.view addSubview:profileImageView];
    
    UILabel *groupNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(profileImageView.frame.origin.x+profileImageView.frame.size.width+20, 20, 200, 20)];
    groupNameLabel.text = @"微课后院";
    groupNameLabel.textAlignment = NSTextAlignmentLeft;
    [self.view addSubview:groupNameLabel];
    
    UIImageView *groupNumImage = [[UIImageView alloc] initWithFrame:CGRectMake(groupNameLabel.frame.origin.x, groupNameLabel.frame.origin.y+groupNameLabel.frame.size.height+10, 16, 14)];
    groupNumImage.image = [UIImage imageNamed:@"numbers_icon"];
    [self.view addSubview:groupNumImage];
    
    UILabel *groupNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(groupNumImage.frame.origin.x+groupNumImage.frame.size.width+10, groupNumImage.frame.origin.y, 50, 15)];
    groupNumLabel.text = @"55";
    [self.view addSubview:groupNumLabel];
    
    UIButton *joinGroupBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH - 100, 25, 80, 45)];
    joinGroupBtn.backgroundColor = [HandleTools colorStringToInt:@"ff8901"];
    [joinGroupBtn setTitle:@"加入该班组" forState:UIControlStateNormal];
    joinGroupBtn.titleLabel.textColor = [UIColor whiteColor];
    [joinGroupBtn addTarget:self action:@selector(join) forControlEvents:UIControlEventTouchUpInside];
    joinGroupBtn.layer.cornerRadius = 5.0f;
    joinGroupBtn.layer.masksToBounds = YES;
    [self.view addSubview:joinGroupBtn];
    
    UIView *groupDetailView = [[UIView alloc] initWithFrame:CGRectMake(0, 100, WIDTH, 85)];
    groupDetailView.backgroundColor = [HandleTools colorStringToInt:@"feeede"];
    [self.view addSubview:groupDetailView];
    
    UILabel *groupInsLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, WIDTH - 20, 20)];
    groupInsLabel.text = @"此班组为娱乐而生，让我们八一八";
    groupInsLabel.textColor = [HandleTools colorStringToInt:@"ff8901"];
    [groupDetailView addSubview:groupInsLabel];
    
    UILabel *createtime = [[UILabel alloc] initWithFrame:CGRectMake(10, groupInsLabel.frame.origin.y+groupInsLabel.frame.size.height + 10, 120, 15)];
    createtime.text = @"创建时间:2013-3-12";
    createtime.font = [UIFont fontWithName:@"Helvetica" size:12];
    [createtime sizeToFit];
    [groupDetailView addSubview:createtime];
    
    UILabel *leaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH/2, createtime.frame.origin.y, 200, 15)];
    leaderLabel.text = @"组长:";
    leaderLabel.font = [UIFont fontWithName:@"Helvetica" size:12];
    [leaderLabel sizeToFit];
    [groupDetailView addSubview:leaderLabel];
    
    UILabel *leaderName = [[UILabel alloc] initWithFrame:CGRectMake(leaderLabel.frame.origin.x+leaderLabel.frame.size.width+10, leaderLabel.frame.origin.y, 200, 15)];
    leaderName.text = @"Sandy";
    leaderName.font = [UIFont fontWithName:@"Helvetica" size:12];
    [leaderName sizeToFit];
    leaderName.textColor = [HandleTools colorStringToInt:@"ff8901"];
    [groupDetailView addSubview:leaderName];

    UIButton *toChatBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, groupDetailView.frame.origin.y+groupDetailView.frame.size.height+ 30, 125, 35)];
    toChatBtn.backgroundColor = [HandleTools colorStringToInt:@"97bf4d"];
    toChatBtn.titleLabel.textColor =[UIColor whiteColor];
    [toChatBtn setTitle:@"进入聊天" forState:UIControlStateNormal];
    toChatBtn.layer.cornerRadius = 5.0f;
    [toChatBtn addTarget: self action:@selector(toChat) forControlEvents:UIControlEventTouchDragInside];
    [self.view addSubview:toChatBtn];
    
    UIButton *toDiscuss = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH-20-125, toChatBtn.frame.origin.y, 125, 35)];
    toDiscuss.backgroundColor = [HandleTools colorStringToInt:@"00b4ff"];
    toDiscuss.titleLabel.textColor =[UIColor whiteColor];
    [toDiscuss setTitle:@"进入论坛" forState:UIControlStateNormal];
    toDiscuss.layer.cornerRadius = 5.0f;
    [toDiscuss addTarget: self action:@selector(todics) forControlEvents:UIControlEventTouchDragInside];
    [self.view addSubview:toDiscuss];
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
-(void)toChat
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
