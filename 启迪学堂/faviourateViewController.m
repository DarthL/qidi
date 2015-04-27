//
//  faviourateViewController.m
//  启迪学堂
//
//  Created by 梁伟 on 15/4/16.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "faviourateViewController.h"
#import "favSeriesViewController.h"
#import "favMicroLessonsViewController.h"
#import "CourseTableViewController.h"
@interface faviourateViewController ()
{
    UISegmentedControl*segmentedControl;
    UIScrollView *viewscroll;
//    favSeriesViewController *favSeriesVC;
//    favMicroLessonsViewController *favMicroLessonsVC;

    CourseTableViewController *favSeriesVC;
    CourseTableViewController *favMicroLessonsVC;
}
@end

@implementation faviourateViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255 green:242.0/255 blue:239.0/255 alpha:1];
    
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"收藏系列",@"收藏微课",nil];
    //初始化UISegmentedControl
    
    segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    segmentedControl.frame = CGRectMake(0 , 0, WIDTH, 40.0);
    segmentedControl.selectedSegmentIndex = 0;//设置默认选择项索引
    segmentedControl.backgroundColor = [UIColor whiteColor];
    segmentedControl.tintColor = [UIColor clearColor];
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
                                             NSForegroundColorAttributeName: [HandleTools colorStringToInt:@"0x00b4ff"]};
    [segmentedControl setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
                                               NSForegroundColorAttributeName: [HandleTools colorStringToInt:@"0x93bfcc"]};
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

    
    //???favSeriesViewController *favVC写成临时变量就会报错
    favSeriesVC = [[CourseTableViewController alloc] init];
    favSeriesVC.view.frame = CGRectMake(0, 0, WIDTH, viewscroll.frame.size.height);
    favSeriesVC.SubtableView.frame = CGRectMake(0, 0, WIDTH, viewscroll.frame.size.height);
    favSeriesVC.SubtableView.tag = FavSeriesTag;
    [viewscroll addSubview:favSeriesVC.view];

    
    favMicroLessonsVC = [[CourseTableViewController alloc]init];
    favMicroLessonsVC.view.frame = CGRectMake(WIDTH,0, WIDTH, viewscroll.frame.size.height);
    favMicroLessonsVC.SubtableView.frame = CGRectMake(0,0, WIDTH, viewscroll.frame.size.height);
    favMicroLessonsVC.SubtableView.tag = FavCourseTag;
    [viewscroll addSubview:favMicroLessonsVC.view];


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
-(void)segmentAction:(UISegmentedControl *)seg{
    
    [viewscroll setContentOffset:CGPointMake((WIDTH)*seg.selectedSegmentIndex, 0) animated:YES];
    
}


@end
