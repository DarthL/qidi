//
//  GroupTableViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/10.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "GroupTableViewController.h"
#import "GroupDetailViewController.h"
#import "AppDelegate.h"
@interface GroupTableViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
}
@end

@implementation GroupTableViewController
@synthesize SubtableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255 green:242.0/255 blue:239.0/255 alpha:1];
    SubtableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    SubtableView.delegate=self;
    SubtableView.dataSource=self;
    SubtableView.backgroundView = nil;
    SubtableView.backgroundColor = [UIColor clearColor];//此处设置tableview的背景色
    SubtableView.userInteractionEnabled=YES;
    SubtableView. showsHorizontalScrollIndicator=NO;
    SubtableView. showsVerticalScrollIndicator=NO;
    SubtableView.separatorColor=self.view.backgroundColor;
    [self.view addSubview:SubtableView];
    
    
    
}
#pragma mark - table delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GroupDetailViewController*groupdetail=[[GroupDetailViewController alloc]init];
    AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    [delegate.minenavigation pushViewController:groupdetail animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 90;
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
    
    UIImageView *profileImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 20, 50, 50)];
    profileImageView.image = [UIImage imageNamed:@"profile.jpg"];
    [cell.contentView addSubview:profileImageView];
    
    UILabel *groupNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(profileImageView.frame.origin.x+profileImageView.frame.size.width+20, 20, 200, 20)];
    groupNameLabel.text = @"微课后院";
    groupNameLabel.textAlignment = NSTextAlignmentLeft;
    [cell.contentView addSubview:groupNameLabel];
    
    UIImageView *groupNumImage = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH-60, groupNameLabel.frame.origin.y, 16, 14)];
    groupNumImage.image = [UIImage imageNamed:@"numbers_icon"];
    [cell.contentView addSubview:groupNumImage];
    
    UILabel *groupNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(groupNumImage.frame.origin.x+groupNumImage.frame.size.width+5, groupNumImage.frame.origin.y, 50, 15)];
    groupNumLabel.text = @"55";
//    groupNumLabel.textColor = [HandleTools colorStringToInt:@""]
    [cell.contentView addSubview:groupNumLabel];
    
    UILabel *groupInsLabel = [[UILabel alloc] initWithFrame:CGRectMake(groupNameLabel.frame.origin.x, groupNameLabel.frame.origin.y+groupNameLabel.frame.size.height + 10, 220, 20)];
    groupInsLabel.text = @"此班组为娱乐而生，让我们八一八";
    [cell.contentView addSubview:groupInsLabel];
    
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
