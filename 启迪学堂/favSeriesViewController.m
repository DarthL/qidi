//
//  favSeriesViewController.m
//  启迪学堂
//
//  Created by 梁伟 on 15/4/16.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "favSeriesViewController.h"
#import "UIImageView+WebCache.h"
#import "AppDelegate.h"
#import "MicroLessonSeriesViewController.h"
#import "playerlistViewController.h"
@interface favSeriesViewController ()
{
    NSMutableArray *favSeries;
    MicroLessonSeriesViewController *mlSeriesVC;
}
@end

@implementation favSeriesViewController
@synthesize tableView = _tableView;
- (id)init{
    
    self = [super init];
    if (self) {
        
        //单机测试
        NSDictionary *dic1 = @{@"SERIES":@"高一物理",@"TEACHER":@"梁老师",@"NUMOFSTU":@"6",@"GOAL":@"主要用于讲解高中物理",@"CAPPeople":@"学生，教师"};
        favSeries = [[NSMutableArray alloc] initWithObjects:dic1,dic1, nil];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,WIDTH, HEIGHT - 64) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.backgroundView = nil;
    _tableView.backgroundColor = [UIColor clearColor];//此处设置tableview的背景色
    _tableView.userInteractionEnabled=YES;
    _tableView. showsHorizontalScrollIndicator=NO;
    _tableView. showsVerticalScrollIndicator=NO;
    _tableView.separatorColor=self.view.backgroundColor;
    [self.view addSubview:_tableView];

}
#pragma mark -Table DataSource
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
        playerlistViewController*playerview=[[playerlistViewController alloc]init];
        playerview.hidesBottomBarWhenPushed=YES;
        [delegate.coursenavigation pushViewController:playerview animated:YES];
//    mlSeriesVC = [[MicroLessonSeriesViewController alloc] init];
//    mlSeriesVC.hidesBottomBarWhenPushed = YES;
//    [delegate.coursenavigation pushViewController:mlSeriesVC animated:YES];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return  favSeries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString* titleCellIdentifier = [NSString stringWithFormat:@"celllw:%ld_%ld",indexPath.section,indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:titleCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:titleCellIdentifier];
    }else{
        [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    cell.contentView.backgroundColor=[UIColor whiteColor];
    CellChangeSelectedColor;
    UIImageView*imgview=[[UIImageView alloc]initWithFrame:CGRectMake(10,10 , 100, 100)];
    //            imgview.backgroundColor=[UIColor grayColor];
    //            [imgview setImage:[UIImage imageNamed:@"文章默认"]];
    
    
    NSString*strURL=@"http://img0.pconline.com.cn/pconline/1306/13/3340324_2.jpg";
    [imgview setImageWithURL:[NSURL URLWithString:strURL] placeholderImage:[UIImage imageNamed:@"tabicon"]];
    [cell.contentView addSubview:imgview];
    
    UILabel*title=[[UILabel alloc]initWithFrame:CGRectMake(imgview.frame.origin.x+imgview.frame.size.width+15, imgview.frame.origin.y, 200, 20)];
    title.backgroundColor=[UIColor clearColor];
    title.textColor=[UIColor blackColor];
    title.font=[UIFont systemFontOfSize:20];
    title.text=@"高一物理";
    [cell.contentView addSubview:title];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120;
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
@end

