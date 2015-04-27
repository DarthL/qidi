//
//  noteViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/10.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "noteViewController.h"
#import "AppDelegate.h"
#import "notedetailViewController.h"
@interface noteViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation noteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255 green:242.0/255 blue:239.0/255 alpha:1];
    UITableView* SubtableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64) style:UITableViewStyleGrouped];
    SubtableView.delegate=self;
    SubtableView.dataSource=self;
    SubtableView.backgroundView = nil;
    SubtableView.backgroundColor = [UIColor clearColor];//此处设置tableview的背景色
    SubtableView.userInteractionEnabled=YES;
    SubtableView. showsHorizontalScrollIndicator=NO;
    SubtableView. showsVerticalScrollIndicator=NO;
    SubtableView.scrollEnabled=YES;
    SubtableView.separatorColor=self.view.backgroundColor;
    [self.view addSubview:SubtableView];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.leftbarbtn setTitle:@"后退" forState:UIControlStateNormal];
    [self.leftbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.leftbarbtn addTarget:self action:@selector(toback) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationtitle setText:@"我的笔记"];
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
#pragma mark - table delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    notedetailViewController*noteview=[[notedetailViewController alloc]init];
    noteview.hidesBottomBarWhenPushed=YES;
    [delegate.minenavigation pushViewController:noteview animated:YES];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 7;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
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
    
    UILabel *noteTopicLabel = [[UILabel alloc] initWithFrame:CGRectMake(15, 15, WIDTH-80, 15)];
    noteTopicLabel.textColor = [HandleTools colorStringToInt:@"fc8c06"];
    noteTopicLabel.text = @"Cocos-2d JS事件处理机制";
    [cell.contentView addSubview:noteTopicLabel];
    
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-70, noteTopicLabel.frame.origin.y, 70, 15)];
    timeLabel.text = @"2014-07-09";
    timeLabel.font = [UIFont fontWithName:@"Helvetica" size:11];
    timeLabel.textAlignment = NSTextAlignmentLeft;
    timeLabel.textColor = [HandleTools colorStringToInt:@"a5a5a5"];
    [cell.contentView addSubview:timeLabel];
    
    UITextView *noteContentTextView =[[UITextView alloc] initWithFrame:CGRectMake(noteTopicLabel.frame.origin.x, noteTopicLabel.frame.origin.y+noteTopicLabel.frame.size.height + 15, WIDTH - 45, 50)];
    noteContentTextView.text = @"这是我的第一个笔记";
    noteContentTextView.editable = NO;
    [cell.contentView addSubview:noteContentTextView];
    
    
    
    
    return cell;
}
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 2;
}


-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 2;
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
