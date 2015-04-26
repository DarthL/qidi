//
//  CourseViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/7.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "CourseViewController.h"
#import "RecommendViewController.h"
#import "CourseTableViewController.h"
@interface CourseViewController ()
{
    RecommendViewController*recommendview;
    CourseTableViewController*newcourseview;
    CourseTableViewController*hotcourseview;
    CourseTableViewController*allcourseview;

    UISegmentedControl *segmentedControl;
    UIScrollView* viewscroll;
}
@end

@implementation CourseViewController
- (id)init{
    
    self = [super init];
    if (self) {
        [self.tabBarItem setImage:[UIImage imageNamed:@"tabicon"]];
        self.tabBarItem.title = @"课程";
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"推荐",@"最新",@"热门",@"全部",nil];
    //初始化UISegmentedControl
    
    segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    segmentedControl.frame = CGRectMake(0 , 0, WIDTH, 40.0);
    segmentedControl.selectedSegmentIndex = 0;//设置默认选择项索引
    segmentedControl.tintColor = [UIColor clearColor];
    segmentedControl.backgroundColor=[UIColor whiteColor];
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
                                             NSForegroundColorAttributeName: [HandleTools colorStringToInt:@"0x00b4ff"]};
    [segmentedControl setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
                                               NSForegroundColorAttributeName: [HandleTools colorStringToInt:@"0x93bfcc"]};
    [segmentedControl setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    [segmentedControl addTarget:self action:@selector(segmentAction:)forControlEvents:UIControlEventValueChanged];  //添加委托方法
    [self.view addSubview:segmentedControl];
    
   viewscroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, segmentedControl.frame.size.height, WIDTH, HEIGHT-segmentedControl.frame.size.height-64-44)];
    viewscroll.backgroundColor=[UIColor clearColor];
    viewscroll.scrollEnabled=false;
    [viewscroll setContentSize:CGSizeMake(WIDTH*4,HEIGHT-segmentedControl.frame.size.height-64-44)];
    viewscroll.userInteractionEnabled=YES;
    viewscroll.backgroundColor=[UIColor clearColor];
    [self.view addSubview:viewscroll];
    
    recommendview=[[RecommendViewController alloc]init];
    recommendview.view.frame=CGRectMake(0, 0, WIDTH, viewscroll.frame.size.height);
    [viewscroll addSubview:recommendview.view];
    [self segmentAction:segmentedControl];
    
    
    newcourseview=[[CourseTableViewController alloc]init];
    newcourseview.view.frame=CGRectMake(WIDTH, 0, WIDTH,viewscroll.frame.size.height);
    newcourseview.SubtableView.frame=CGRectMake(0, 0, WIDTH, viewscroll.frame.size.height);

    [viewscroll addSubview:newcourseview.view];
    
    hotcourseview=[[CourseTableViewController alloc]init];
    hotcourseview.view.frame=CGRectMake(WIDTH*2, 0, WIDTH,viewscroll.frame.size.height);
    hotcourseview.SubtableView.frame=CGRectMake(0, 0, WIDTH, viewscroll.frame.size.height);

    [viewscroll addSubview:hotcourseview.view];
    

    allcourseview=[[CourseTableViewController alloc]init];
    allcourseview.view.frame=CGRectMake(WIDTH*3, 0, WIDTH,viewscroll.frame.size.height);
    allcourseview.SubtableView.frame=CGRectMake(0, 0, WIDTH, viewscroll.frame.size.height);

    [viewscroll addSubview:allcourseview.view];



  
}
-(void)changepage
{
    
    if (segmentedControl.selectedSegmentIndex>=4-1){//bean.littleimgs.count-1) {
        [viewscroll setContentOffset:CGPointMake((WIDTH)*(4-1), 0) animated:YES];
        
    }else
        [viewscroll setContentOffset:CGPointMake((WIDTH)*segmentedControl.selectedSegmentIndex, 0) animated:YES];
    
}

-(void)viewWillAppear:(BOOL)animated
{

    [super viewWillAppear:animated];
    [self.navigationtitle setText:@"课程"];
    

}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)segmentAction:(UISegmentedControl *)Seg{
    
    NSInteger Index = Seg.selectedSegmentIndex;
    
    [self changepage];
    switch (Index) {
            
        case 0:
            [recommendview startLoad];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
