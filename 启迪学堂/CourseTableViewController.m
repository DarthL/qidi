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
    playerlistViewController*playerview=[[playerlistViewController alloc]init];
    playerview.hidesBottomBarWhenPushed=YES;
    [delegate.coursenavigation pushViewController:playerview animated:YES];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 6;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
     return 120;
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
    title.text=@"内部测试题";
    [cell.contentView addSubview:title];
    
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
