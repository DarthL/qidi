//
//  playerlistViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/8.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "playerlistViewController.h"
#import "BasicinfoViewController.h"
#import "CourseListViewController.h"
@interface playerlistViewController ()
{
    UISegmentedControl *segmentedControl;
    UIScrollView*viewscroll;
    BasicinfoViewController*basicinfoview;
    CourseListViewController*courselistview;

}
@end

@implementation playerlistViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"基本信息",@"微课列表",nil];
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
    
    basicinfoview=[[BasicinfoViewController alloc]init];
    basicinfoview.view.frame=CGRectMake(0, 0, WIDTH,viewscroll.frame.size.height);
    basicinfoview.SubtableView.frame=CGRectMake(10, 0, WIDTH-20, viewscroll.frame.size.height);
    [viewscroll addSubview:basicinfoview.view];
    
    courselistview=[[CourseListViewController alloc]init];
    courselistview.view.frame=CGRectMake(WIDTH, 0, WIDTH,viewscroll.frame.size.height);
    courselistview.SubtableView.frame=CGRectMake(10, 40, WIDTH-20, viewscroll.frame.size.height-40);
    [viewscroll addSubview:courselistview.view];

   

    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
