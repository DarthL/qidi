//
//  CourseTableViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/7.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "CourseTableViewController.h"
#import "UIImageView+WebCache.h"
#import "AppDelegate.h"
#import "playerlistViewController.h"
#import "ShowPlayerViewController.h"
#import "SeriesDetailedViewController.h"
@interface CourseTableViewController ()<UITableViewDataSource,UITableViewDelegate>
{

}
@end

@implementation CourseTableViewController
@synthesize SubtableView;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255 green:242.0/255 blue:239.0/255 alpha:1];
    SubtableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height) style:UITableViewStyleGrouped];
    SubtableView.tag = CourseTag;
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
    

    AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
//    playerlistViewController*playerview=[[playerlistViewController alloc]init];
//    playerview.hidesBottomBarWhenPushed=YES;
//    [delegate.coursenavigation pushViewController:playerview animated:YES];

    if (tableView.tag == CourseTag) {
        ShowPlayerViewController *showPlayerVC = [[ShowPlayerViewController alloc] init];
        showPlayerVC.hidesBottomBarWhenPushed = YES;
        [delegate.coursenavigation pushViewController:showPlayerVC animated:YES];
    }
    else if(tableView.tag == FavCourseTag){
        ShowPlayerViewController *showPlayerVC = [[ShowPlayerViewController alloc] init];
        showPlayerVC.hidesBottomBarWhenPushed = YES;
        [delegate.minenavigation pushViewController:showPlayerVC animated:YES];
    }
    else if(tableView.tag == FavSeriesTag){
        SeriesDetailedViewController *seriesVC  = [[SeriesDetailedViewController alloc] init];
        seriesVC.hidesBottomBarWhenPushed = YES;
        [delegate.minenavigation pushViewController:seriesVC animated:YES];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* titleCellIdentifier = [NSString stringWithFormat:@"lwcell:%d_%d",indexPath.section,indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:titleCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:titleCellIdentifier];
    }else{
        [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    cell.contentView.backgroundColor=[UIColor whiteColor];
    CellChangeSelectedColor;
    UIImageView*imgview=[[UIImageView alloc]initWithFrame:CGRectMake(10,10 , 100, 75)];
    //            imgview.backgroundColor=[UIColor grayColor];
    //            [imgview setImage:[UIImage imageNamed:@"文章默认"]];
    
    
    NSString*strURL=@"http://img0.pconline.com.cn/pconline/1306/13/3340324_2.jpg";
    [imgview setImageWithURL:[NSURL URLWithString:strURL] placeholderImage:[UIImage imageNamed:@"tabicon"]];
    [cell.contentView addSubview:imgview];

    UILabel*title=[[UILabel alloc]initWithFrame:CGRectMake(imgview.frame.origin.x+imgview.frame.size.width+15, imgview.frame.origin.y, 200, 20)];
    title.backgroundColor=[UIColor clearColor];
    title.textColor=[UIColor blackColor];
    title.font=[UIFont systemFontOfSize:20];
    title.text=@"内部测试题";
    [cell.contentView addSubview:title];
    
    UIImageView *teacherImage = [[UIImageView alloc] initWithFrame:CGRectMake(title.frame.origin.x, title.frame.origin.y+title.frame.size.height+30, 13, 14)];
    teacherImage.image = [UIImage imageNamed:@"teacher_icon"];
    [cell.contentView addSubview:teacherImage];
    
    UILabel *teacherNameLabel = [[UILabel alloc] initWithFrame:CGRectMake(teacherImage.frame.origin.x+teacherImage.frame.size.width+5, teacherImage.frame.origin.y, 0, 14)];
    teacherNameLabel.text = @"EE程老师";
    [teacherNameLabel sizeToFit];
    teacherNameLabel.textColor = [HandleTools colorStringToInt:@"0xe3e3e3"];
    [cell.contentView addSubview:teacherNameLabel];
    
    UIImageView *studentImage = [[UIImageView alloc] initWithFrame:CGRectMake(WIDTH - 70, title.frame.origin.y+title.frame.size.height+30, 17, 14)];
    studentImage.image = [UIImage imageNamed:@"numbers_icon"];
    [cell.contentView addSubview:studentImage];
    
    UILabel *studentNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(studentImage.frame.origin.x+studentImage.frame.size.width+5, studentImage.frame.origin.y, 0, 14)];
    studentNumLabel.text = @"123";
    [studentNumLabel sizeToFit];
    studentNumLabel.textColor = [HandleTools colorStringToInt:@"0xe3e3e3"];
    [cell.contentView addSubview:studentNumLabel];
    
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
