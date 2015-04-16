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
@interface faviourateViewController ()
{
    UISegmentedControl*segmentedControl;
    UIScrollView *viewscroll;
    favSeriesViewController *favSeriesVC;
    favMicroLessonsViewController *favMicroLessonsVC;
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
    segmentedControl.frame = CGRectMake(0 , 0, WIDTH, 50.0);
    segmentedControl.selectedSegmentIndex = 0;//设置默认选择项索引
    segmentedControl.tintColor = [UIColor clearColor];
    segmentedControl.backgroundColor=[UIColor yellowColor];
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
                                             NSForegroundColorAttributeName: [UIColor redColor]};
    [segmentedControl setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
                                               NSForegroundColorAttributeName: [UIColor blackColor]};
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
    favSeriesVC = [[favSeriesViewController alloc] init];
    favSeriesVC.view.frame = CGRectMake(0, 0, WIDTH, viewscroll.frame.size.height);
    favSeriesVC.tableView.frame = CGRectMake(0, 0, WIDTH, viewscroll.frame.size.height);
    [viewscroll addSubview:favSeriesVC.view];

    
    favMicroLessonsVC = [[favMicroLessonsViewController alloc]init];
    favMicroLessonsVC.view.frame = CGRectMake(WIDTH,0, WIDTH, viewscroll.frame.size.height);
    favMicroLessonsVC.tableView.frame = CGRectMake(0,0, WIDTH, viewscroll.frame.size.height);
    [viewscroll addSubview:favMicroLessonsVC.view];


}


-(void)segmentAction:(UISegmentedControl *)seg{
    
    [viewscroll setContentOffset:CGPointMake((WIDTH)*seg.selectedSegmentIndex, 0) animated:YES];
    
}
-(void)changepage
{
    

    
}

@end
