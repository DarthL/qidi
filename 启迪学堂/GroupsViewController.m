//
//  GroupsViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/10.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "GroupsViewController.h"
#import "GroupTableViewController.h"
@interface GroupsViewController ()
{
    UISegmentedControl*segmentedControl;
    UIScrollView*viewscroll;
    GroupTableViewController*mygroupview;
    GroupTableViewController*hotgroupview;
    GroupTableViewController*newgroupview;
    GroupTableViewController*allgroupview;



}
@end

@implementation GroupsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255 green:242.0/255 blue:239.0/255 alpha:1];
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"我的班组",@"最热班组",@"新晋班组",@"全部班组",nil];
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
    [viewscroll setContentSize:CGSizeMake(WIDTH*4,HEIGHT-segmentedControl.frame.size.height-64-44)];
    viewscroll.userInteractionEnabled=YES;
    viewscroll.backgroundColor=[UIColor clearColor];
    [self.view addSubview:viewscroll];
    
    mygroupview=[[GroupTableViewController alloc]init];
    mygroupview.view.frame=CGRectMake(0, 0, WIDTH,viewscroll.frame.size.height);
    mygroupview.SubtableView.frame=CGRectMake(0, 0, WIDTH, viewscroll.frame.size.height);
    [viewscroll addSubview:mygroupview.view];
    
    hotgroupview=[[GroupTableViewController alloc]init];
    hotgroupview.view.frame=CGRectMake(WIDTH, 0, WIDTH,viewscroll.frame.size.height);
    hotgroupview.SubtableView.frame=CGRectMake(0, 0, WIDTH, viewscroll.frame.size.height);
    [viewscroll addSubview:hotgroupview.view];
    
    newgroupview=[[GroupTableViewController alloc]init];
    newgroupview.view.frame=CGRectMake(WIDTH*2, 0, WIDTH,viewscroll.frame.size.height);
    newgroupview.SubtableView.frame=CGRectMake(0, 0, WIDTH, viewscroll.frame.size.height);
    [viewscroll addSubview:newgroupview.view];
    
    
    UISearchBar*allsearch=[[UISearchBar alloc]initWithFrame:CGRectMake(WIDTH*3, 0, WIDTH, 45)];
    [viewscroll addSubview:allsearch];
    allgroupview=[[GroupTableViewController alloc]init];
    allgroupview.view.frame=CGRectMake(WIDTH*3, allsearch.frame.size.height, WIDTH,viewscroll.frame.size.height);
    allgroupview.SubtableView.frame=CGRectMake(0, 0, WIDTH, viewscroll.frame.size.height-allsearch.frame.size.height);
    [viewscroll addSubview:allgroupview.view];





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
        [viewscroll setContentOffset:CGPointMake((WIDTH)*(4-1), 0) animated:YES];
        
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
            
        case 2:
            
            break;
            
        case 3:
            
            break;
            
        default:
            
            break;
            
    }
    
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
