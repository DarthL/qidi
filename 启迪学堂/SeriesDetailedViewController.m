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
    self.view.backgroundColor = [HandleTools colorStringToInt:@"0xf5f5f5"];
    segmentedControl = [[UISegmentedControl alloc] initWithItems:@[@"基本信息",@"微课列表"]];
    segmentedControl.frame = CGRectMake(0, 0, WIDTH, 40);
    segmentedControl.selectedSegmentIndex = 0;
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
    
//    basicTable = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, WIDTH-30, viewscroll.frame.size.height-64) style:UITableViewStyleGrouped];
//    basicTable.delegate = self;
//    basicTable.dataSource = self;
//    basicTable.backgroundColor = [UIColor grayColor];
//    [viewscroll addSubview:basicTable];

    UIView *baseView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, viewscroll.frame.size.height - 64)];
    baseView.backgroundColor = [UIColor clearColor];
    [viewscroll addSubview:baseView];
    
    UIImageView *targetImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, 58, 21)];
    targetImageView.image = [UIImage imageNamed:@"kechengmubiao_icon"];
    [baseView addSubview:targetImageView];
    
    UITextView *targetTextView = [[UITextView alloc] init];
    NSString *text = @"本课程目标为：本课程目标为：本课程目标为：本课程目标为：本课程目标为：本课程目标为：本课程目标为：本课程目标为：本课程目标为：本课程目标为：本课程目标为：本课程目标为：本课程目标为：本课程目标为：";
    targetTextView.text = text;
    targetTextView.frame = CGRectMake(0, targetImageView.frame.size.height+targetImageView.frame.origin.y + 10, WIDTH, 0);
    float height = [self heightForTextView:targetTextView WithText:text];
    targetTextView.frame = CGRectMake(0, targetImageView.frame.size.height+targetImageView.frame.origin.y + 10, WIDTH, height);
    [baseView addSubview:targetTextView];

    UIImageView *suitableImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, targetTextView.frame.size.height+targetTextView.frame.origin.y + 10, 58, 21)];
    suitableImageView.image = [UIImage imageNamed:@"shiyingrenqun_icon"];
    [baseView addSubview:suitableImageView];
    
    
    
    
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

//    [self.rightbarbtn setTitle:@"收藏" forState:UIControlStateNormal];
//    [self.rightbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.rightbarbtn setImage:[UIImage imageNamed:@"collect_button"] forState:UIControlStateNormal];
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
        
        UILabel *courseTopic = [[UILabel alloc] initWithFrame:CGRectMake(40, 15, 250, 18)];
        courseTopic.text = @"第一节：概论";
        [cell.contentView addSubview:courseTopic];
        
        UIImageView *videoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(courseTopic.frame.origin.x, courseTopic.frame.origin.y+courseTopic.frame.size.height+10, 20, 13)];
        videoImageView.image = [UIImage imageNamed:@"video_icon.png"];
        [cell.contentView addSubview:videoImageView];
        
        UILabel *timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(videoImageView.frame.size.width+videoImageView.frame.origin.x+10, videoImageView.frame.origin.y-2, 50, 15)];
        timeLabel.text = @"05:10";
        [timeLabel sizeToFit];
        timeLabel.textAlignment = NSTextAlignmentLeft;
        [cell.contentView addSubview:timeLabel];
        
        UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(timeLabel.frame.origin.x+timeLabel.frame.size.width+8, timeLabel.frame.origin.y, 50, 15)];
        priceLabel.text = @"免费";
        [priceLabel sizeToFit];
        priceLabel.backgroundColor = [HandleTools colorStringToInt:@"0xff8901"];
        priceLabel.textColor = [UIColor whiteColor];
        priceLabel.layer.cornerRadius = 5.0f;
        priceLabel.layer.masksToBounds = YES;
        [cell.contentView addSubview:priceLabel];
        
        UILabel *learnStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(priceLabel.frame.origin.x+priceLabel.frame.size.width+8, timeLabel.frame.origin.y, 50, 15)];
        learnStatusLabel.text = @"已学习";
        [learnStatusLabel sizeToFit];
        learnStatusLabel.backgroundColor = [HandleTools colorStringToInt:@"5db561"];
        learnStatusLabel.textColor = [UIColor whiteColor];
        learnStatusLabel.layer.cornerRadius = 5.0f;
        learnStatusLabel.layer.masksToBounds = YES;
        [cell.contentView addSubview:learnStatusLabel];
        
        //cell.textLabel.text = @"高一物理第一集";
        
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    if (tableView == basicTable) {
//    
//    }
//    else{
//        return 60;
//    }

    return 70;
}


#pragma mark 根据文本获取textView的高度
- (float) heightForTextView: (UITextView *)textView WithText: (NSString *) strText{
    UITextView *detailTextView = [[UITextView alloc]initWithFrame:CGRectMake(0, 0, textView.frame.size.width, 0)];
    detailTextView.font = textView.font;
    detailTextView.text = strText;
    CGSize deSize = [detailTextView sizeThatFits:CGSizeMake(textView.frame.size.width,CGFLOAT_MAX)];
    return deSize.height;
}


@end
