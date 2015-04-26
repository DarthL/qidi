//
//  homeworkViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/10.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "homeworkViewController.h"

@interface homeworkViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UISegmentedControl*segmentedControl;
    UIScrollView* viewscroll;
}
@end

@implementation homeworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255 green:242.0/255 blue:239.0/255 alpha:1];

    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"今日作业",@"以往作业",nil];
    //初始化UISegmentedControl
    
    segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    segmentedControl.frame = CGRectMake(0 , 0, WIDTH, 50.0);
    segmentedControl.selectedSegmentIndex = 0;//设置默认选择项索引
    segmentedControl.tintColor = [UIColor clearColor];
    segmentedControl.backgroundColor=[UIColor whiteColor];
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
                                             NSForegroundColorAttributeName: [HandleTools colorStringToInt:@"0x00b4ff"]};
    [segmentedControl setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
                                               NSForegroundColorAttributeName: [HandleTools colorStringToInt:@"0x93bfcc"]};
    [segmentedControl setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    [segmentedControl setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    [segmentedControl addTarget:self action:@selector(segmentAction:)forControlEvents:UIControlEventValueChanged];  //添加委托方法
    [self.view addSubview:segmentedControl];
    
    viewscroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, segmentedControl.frame.size.height, WIDTH, HEIGHT-segmentedControl.frame.size.height-64)];
    viewscroll.backgroundColor=[UIColor clearColor];
    viewscroll.scrollEnabled=false;
    [viewscroll setContentSize:CGSizeMake(WIDTH*2,HEIGHT-segmentedControl.frame.size.height-64)];
    viewscroll.userInteractionEnabled=YES;
    viewscroll.backgroundColor=[UIColor clearColor];
    [self.view addSubview:viewscroll];
    
    UIView*todayview=[[UIView alloc]initWithFrame:CGRectMake(10, 10, WIDTH-20, 200)];
    todayview.backgroundColor=[UIColor clearColor];
//    [viewscroll addSubview:todayview];
    
    UITableView* todayTaskSubtableView=[[UITableView alloc] initWithFrame:CGRectMake(10, 0, WIDTH-20, HEIGHT-segmentedControl.frame.size.height-64) style:UITableViewStyleGrouped];
    todayTaskSubtableView.delegate=self;
    todayTaskSubtableView.dataSource=self;
    todayTaskSubtableView.backgroundView = nil;
    todayTaskSubtableView.backgroundColor = [UIColor clearColor];//此处设置tableview的背景色
    todayTaskSubtableView.userInteractionEnabled=YES;
    todayTaskSubtableView. showsHorizontalScrollIndicator=NO;
    todayTaskSubtableView. showsVerticalScrollIndicator=NO;
    todayTaskSubtableView.scrollEnabled=YES;
    todayTaskSubtableView.separatorColor=self.view.backgroundColor;
    [viewscroll addSubview:todayTaskSubtableView];

    UITableView* historyTaskSubtableView=[[UITableView alloc] initWithFrame:CGRectMake(WIDTH + 10, 0, WIDTH-20, HEIGHT-segmentedControl.frame.size.height-64) style:UITableViewStyleGrouped];
    historyTaskSubtableView.delegate=self;
    historyTaskSubtableView.dataSource=self;
    historyTaskSubtableView.backgroundView = nil;
    historyTaskSubtableView.backgroundColor = [UIColor clearColor];//此处设置tableview的背景色
    historyTaskSubtableView.userInteractionEnabled=YES;
    historyTaskSubtableView. showsHorizontalScrollIndicator=NO;
    historyTaskSubtableView. showsVerticalScrollIndicator=NO;
    historyTaskSubtableView.scrollEnabled=YES;
    historyTaskSubtableView.separatorColor=self.view.backgroundColor;
    [viewscroll addSubview:historyTaskSubtableView];
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
-(void)changepage
{
    
    if (segmentedControl.selectedSegmentIndex>=4-1){//bean.littleimgs.count-1) {
        [viewscroll setContentOffset:CGPointMake((WIDTH)*(2-1), 0) animated:YES];
        
    }else
        [viewscroll setContentOffset:CGPointMake((WIDTH)*segmentedControl.selectedSegmentIndex, 0) animated:YES];
    
}
-(void)segmentAction:(UISegmentedControl *)Seg{
    
    NSInteger Index = Seg.selectedSegmentIndex;
    
    [self changepage];
    switch (Index) {
            
        case 0:
            break;
            
        case 1:
            
            break;
            
            
        default:
            
            break;
            
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - table delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString* titleCellIdentifier = [NSString stringWithFormat:@"cell:%d_%d",indexPath.section,indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:titleCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:titleCellIdentifier];
    }else{
        [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }

    CellChangeSelectedColor;
    if ([indexPath row] == 0) {
        cell.textLabel.text = @"物理作业";
        cell.textLabel.textColor = [HandleTools colorStringToInt:@"0xef9117"];
    }
    else{
    cell.imageView.image = [UIImage imageNamed:@"unfinished_icon"];
    cell.textLabel.text = @"第五章课后练习";
    }
    return cell;
}
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}


-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 8;
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
