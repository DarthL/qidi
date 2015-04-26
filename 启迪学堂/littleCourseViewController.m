//
//  littleCourseViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/10.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "littleCourseViewController.h"
#import "ShowPlayerViewController.h"
#import "AppDelegate.h"
#import "UIImageView+WebCache.h"
@interface littleCourseViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation littleCourseViewController

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
    ShowPlayerViewController*showview=[[ShowPlayerViewController alloc]init];
    showview.hidesBottomBarWhenPushed=YES;
    [delegate.minenavigation pushViewController:showview animated:YES];

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 7;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
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
    
    UILabel *toLessonLabel = [[UILabel alloc] initWithFrame:CGRectMake(title.frame.origin.x, title.frame.origin.y+title.frame.size.height + 12, 0, 12)];
    toLessonLabel.textColor = [HandleTools colorStringToInt:@"0xa8a8a8"];
    toLessonLabel.text = @"学习到课时：";
    [toLessonLabel sizeToFit];
    [cell.contentView addSubview:toLessonLabel];
    
    UILabel *toLessonName = [[UILabel alloc] initWithFrame:CGRectMake(toLessonLabel.frame.size.width+toLessonLabel.frame.origin.x+5, toLessonLabel.frame.origin.y,0, 12)];
    toLessonName.text = @"高一物理";
    toLessonName.textColor = [HandleTools colorStringToInt:@"ff8b00"];
    [toLessonName sizeToFit];
    [cell.contentView addSubview:toLessonName];
    
    UIProgressView *studyProgressView = [[UIProgressView alloc] initWithFrame:CGRectMake(toLessonLabel.frame.origin.x, toLessonLabel.frame.origin.y+toLessonLabel.frame.size.height + 12, WIDTH-toLessonLabel.frame.origin.x - 50, 0)];
    studyProgressView.progress = 0.8;
    studyProgressView.progressTintColor = [HandleTools colorStringToInt:@"ff8b00"];
    [cell.contentView addSubview:studyProgressView];
    
    UILabel *studyProgressLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH-45, studyProgressView.frame.origin.y - 10, 0, 15)];
    studyProgressLabel.text = @"80%";
    studyProgressLabel.textColor = [HandleTools colorStringToInt:@"ff8b00"];
    [studyProgressLabel sizeToFit];
    [cell.contentView addSubview:studyProgressLabel];
    
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
