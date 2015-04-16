//
//  MineViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/7.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "MineViewController.h"
#import "homeworkViewController.h"
#import "AppDelegate.h"
#import "littleCourseViewController.h"
#import "noteViewController.h"
#import "NoticeViewController.h"
#import "CallbackViewController.h"
#import "SettingViewController.h"
#import "GroupsViewController.h"
#import "faviourateViewController.h"
@interface MineViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation MineViewController
- (id)init{
    
    self = [super init];
    if (self) {
        [self.tabBarItem setImage:[UIImage imageNamed:@"tabicon"]];
        self.tabBarItem.title = @"我";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255 green:242.0/255 blue:239.0/255 alpha:1];
    UIView*mineview=[[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 65)];
    mineview.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:mineview];
    
   UITableView* SubtableView=[[UITableView alloc] initWithFrame:CGRectMake(0, mineview.frame.origin.y+mineview.frame.size.height+5, WIDTH, HEIGHT-65*2-50) style:UITableViewStyleGrouped];
    SubtableView.delegate=self;
    SubtableView.dataSource=self;
    SubtableView.backgroundView = nil;
    SubtableView.backgroundColor = [UIColor clearColor];//此处设置tableview的背景色
    SubtableView.userInteractionEnabled=YES;
    SubtableView. showsHorizontalScrollIndicator=NO;
    SubtableView. showsVerticalScrollIndicator=NO;
    SubtableView.scrollEnabled=NO;
    SubtableView.separatorColor=self.view.backgroundColor;
    [self.view addSubview:SubtableView];

    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationtitle setText:@"我"];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - table delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.section) {
        case 0:
        {
            
            AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
            homeworkViewController*homeview=[[homeworkViewController alloc]init];
            homeview.hidesBottomBarWhenPushed=YES;
            [delegate.minenavigation pushViewController:homeview animated:YES];
        }
            break;
        case 1:
        {
            AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
            faviourateViewController *favVC = [[faviourateViewController alloc]init];
            favVC.hidesBottomBarWhenPushed=YES;
            [delegate.minenavigation pushViewController:favVC animated:YES];
            
        }
            break;
        case 2:
        {
            AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
            littleCourseViewController*lcourseview=[[littleCourseViewController alloc]init];
            lcourseview.hidesBottomBarWhenPushed=YES;
            [delegate.minenavigation pushViewController:lcourseview animated:YES];

        }
            break;
        case 3:
        {
            AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
            noteViewController*noteview=[[noteViewController alloc]init];
            noteview.hidesBottomBarWhenPushed=YES;
            [delegate.minenavigation pushViewController:noteview animated:YES];

        }
            break;
        case 4:
        {
            AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
            GroupsViewController*view=[[GroupsViewController alloc]init];
            view.hidesBottomBarWhenPushed=YES;
            [delegate.minenavigation pushViewController:view animated:YES];

        }
            break;
        case 5:
        {
            AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
            NoticeViewController*noteview=[[NoticeViewController alloc]init];
            noteview.hidesBottomBarWhenPushed=YES;
            [delegate.minenavigation pushViewController:noteview animated:YES];
        }
            break;
        case 6:
        {
            AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
            SettingViewController*view=[[SettingViewController alloc]init];
            view.hidesBottomBarWhenPushed=YES;
            [delegate.minenavigation pushViewController:view animated:YES];
        }
            break;
        case 7:
        {
            AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
            CallbackViewController*view=[[CallbackViewController alloc]init];
            view.hidesBottomBarWhenPushed=YES;
            [delegate.minenavigation pushViewController:view animated:YES];

        }
            break;
            
        default:
            break;
    }

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 7;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (HEIGHT-65)/7-2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* titleCellIdentifier = [NSString stringWithFormat:@"cell:%d_%d",indexPath.section,indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:titleCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:titleCellIdentifier];
    }else{
        [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    cell.contentView.backgroundColor=[UIColor whiteColor];
    CellChangeSelectedColor;
    switch (indexPath.section) {
        case 0:
            cell.textLabel.text=@"作业";
            break;
        case 1:
            cell.textLabel.text=@"收藏";
            break;
        case 2:
            cell.textLabel.text=@"微课";
            break;
        case 3:
            cell.textLabel.text=@"笔记";
            break;
        case 4:
            cell.textLabel.text=@"班组";
            break;
        case 5:
            cell.textLabel.text=@"通知";
            break;
        case 6:
            cell.textLabel.text=@"设置";
            break;
        case 7:
            cell.textLabel.text=@"意见反馈";
            break;
            
        default:
            break;
    }
    return cell;
}
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.001;
}


-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.001;
}

-(UIView*)tableView:(UITableView*)tableView viewForHeaderInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
}

-(UIView*)tableView:(UITableView*)tableView viewForFooterInSection:(NSInteger)section
{
    return [[UIView alloc] initWithFrame:CGRectZero];
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
