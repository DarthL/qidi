//
//  MicroLessonViewController.m
//  启迪学堂
//
//  Created by 梁伟 on 15/4/16.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "SeriesDetailedViewController.h"

@interface SeriesDetailedViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UISegmentedControl *segmentedControl;
    UIScrollView *viewscroll;
    UITableView *basicTable;
    UITableView *microLessonsListTable;
}
@end
@implementation SeriesDetailedViewController
-(void)viewDidLoad{
    

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"基本信息",@"微课列表"]];
    segmentedControl.frame = CGRectMake(0, 0, WIDTH, 32);
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.tintColor = [UIColor clearColor];
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
    
    basicTable = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, WIDTH-30, viewscroll.frame.size.height-64) style:UITableViewStyleGrouped];
    basicTable.delegate = self;
    basicTable.dataSource = self;
    basicTable.backgroundColor = [UIColor grayColor];
    [viewscroll addSubview:basicTable];

    microLessonsListTable = [[UITableView alloc] initWithFrame:CGRectMake(10+WIDTH, 0, WIDTH-30, viewscroll.frame.size.height-64) style:UITableViewStyleGrouped];
    microLessonsListTable.delegate = self;
    microLessonsListTable.dataSource = self;
    [viewscroll addSubview:microLessonsListTable];

}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationtitle setText:@"物理微课系列"];
    [self.leftbarbtn setTitle:@"后退" forState:UIControlStateNormal];
    [self.leftbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.leftbarbtn addTarget:self action:@selector(toback) forControlEvents:UIControlEventTouchUpInside];

    [self.rightbarbtn setTitle:@"收藏" forState:UIControlStateNormal];
    [self.rightbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.rightbarbtn addTarget:self action:@selector(toFav) forControlEvents:UIControlEventTouchUpInside];
    
    
    
}

- (void)toFav{

    
}
- (void)toback
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

-(void)segmentAction:(UISegmentedControl *)seg{

    [viewscroll setContentOffset:CGPointMake((WIDTH)*seg.selectedSegmentIndex, 0) animated:YES];
}

#pragma mark - Table DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (tableView == basicTable) {
        return 2;
    }
    else{
        
        return 5;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString* titleCellIdentifier = [NSString stringWithFormat:@"celllw:%ld_%ld",indexPath.section,indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:titleCellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:titleCellIdentifier];
    }else{
        [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    cell.contentView.backgroundColor=[UIColor whiteColor];
    CellChangeSelectedColor;
    
    if (tableView == basicTable) {

        
        if ([indexPath row] == 0) {
            UILabel *goalLabel = [[UILabel alloc] init];
            goalLabel.frame = CGRectMake(10, 10, 100, 20);
            goalLabel.text = @"系列目标";
            [goalLabel sizeToFit];
            [cell.contentView addSubview:goalLabel];
            
            UITextView *goalDetailTextView = [[UITextView alloc] init];
            goalDetailTextView.frame = CGRectMake(40, goalLabel.frame.size.height+goalLabel.frame.origin.y + 2, WIDTH - 80, 0);
            goalDetailTextView.text = @"本系列课程主要讲了....";
            [cell.contentView addSubview:goalDetailTextView];
        }
        if ([indexPath row] == 1) {
            UILabel *suitablePeopleLabel = [[UILabel alloc] init];
            suitablePeopleLabel.frame = CGRectMake(10, 10, 40, 20);
            suitablePeopleLabel.text = @"适用人群";
            [suitablePeopleLabel sizeToFit];
            [cell.contentView addSubview:suitablePeopleLabel];
            
            UILabel *suitablePeopleDetailLabel = [[UILabel alloc] init];
            suitablePeopleDetailLabel.frame = CGRectMake(40, suitablePeopleLabel.frame.size.height+suitablePeopleLabel.frame.origin.y + 10, WIDTH - 80, 0);
            suitablePeopleDetailLabel.text = @"学生，教师";
            [suitablePeopleLabel sizeToFit];
            [cell.contentView addSubview:suitablePeopleDetailLabel];
        }
        
        
        

    }
    else{
        
        cell.textLabel.text = @"高一物理第一集";
        
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == basicTable) {
    
    }
    else{
        return 60;
    }
    return 120;
}






@end
