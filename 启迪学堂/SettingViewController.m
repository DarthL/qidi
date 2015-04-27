//
//  SettingViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/10.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "SettingViewController.h"
#import "AboutUsViewController.h"
@interface SettingViewController ()<UITableViewDataSource,UITableViewDelegate>

@end

@implementation SettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[HandleTools colorStringToInt:@"f5f5f5"];
    UITableView* SubtableView=[[UITableView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64-20) style:UITableViewStyleGrouped];
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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.leftbarbtn setTitle:@"后退" forState:UIControlStateNormal];
    [self.leftbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.leftbarbtn addTarget:self action:@selector(toback) forControlEvents:UIControlEventTouchUpInside];
    [self.navigationtitle setText:@"设置"];
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
    
    if(indexPath.section==2)
    {
        AboutUsViewController*view=[[AboutUsViewController alloc]init];
        [self.navigationController pushViewController:view animated:YES];
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
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
    if (indexPath.section==0) {
        cell.textLabel.text=@"非wifi下视频可以播放";
        UISwitch *wifiswitch = [[UISwitch alloc] initWithFrame:CGRectMake(WIDTH - 65, 25, 40, 25)];
        [cell.contentView addSubview:wifiswitch];
    }else if(indexPath.section==1){
        cell.textLabel.text=@"版本更新";
        
        UILabel *newVersionLabel = [[UILabel alloc] initWithFrame:CGRectMake(85, 15, 40, 15)];
        newVersionLabel.text = @"New";
        newVersionLabel.textColor = [UIColor whiteColor];
        [newVersionLabel sizeToFit];
        newVersionLabel.layer.cornerRadius = 7.0f;
        newVersionLabel.layer.masksToBounds = YES;
        newVersionLabel.backgroundColor = [UIColor redColor];
        newVersionLabel.layer.cornerRadius = 5.0f;
        [cell.contentView addSubview:newVersionLabel];
        
        UILabel *versionLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH -65, 35, 40, 15)];
        versionLabel.text = @"V1.0";
        //versionLabel.textColor = [HandleTools colorStringToInt:@"0xf5f5f5"];
        [cell.contentView addSubview:versionLabel];
    }
    else{
        cell.textLabel.text=@"关于启迪学堂";
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
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
