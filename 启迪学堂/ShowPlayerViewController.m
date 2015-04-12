//
//  ShowPlayerViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/8.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "ShowPlayerViewController.h"
#import "writeNoteViewController.h"
#import "AppDelegate.h"
#import "writeCommentViewController.h"
@interface ShowPlayerViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView*bgscrollview;
    UIScrollView*viewscroll;
    UISegmentedControl*segmentedControl;
    UITableView*SubtableView;
}
@end

@implementation ShowPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255 green:242.0/255 blue:239.0/255 alpha:1];
    bgscrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64)];
    bgscrollview.backgroundColor=[UIColor clearColor];
    bgscrollview.scrollEnabled=YES;
    [bgscrollview setContentSize:CGSizeMake(WIDTH,HEIGHT)];
    bgscrollview.userInteractionEnabled=YES;
    bgscrollview.backgroundColor=[UIColor clearColor];
    [self.view addSubview:bgscrollview];

    UIImageView*playerimg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 160)];
    playerimg.backgroundColor=[UIColor greenColor];
    [bgscrollview addSubview:playerimg];
    
    UIView*alltitle=[[UIView alloc]initWithFrame:CGRectMake(0, playerimg.frame.origin.y+playerimg.frame.size.height, WIDTH, 80)];
    alltitle.backgroundColor=[UIColor redColor];
    [bgscrollview addSubview:alltitle];
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"微课评价",@"我的笔记",nil];
    //初始化UISegmentedControl
    
    segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    segmentedControl.frame = CGRectMake(0 , alltitle.frame.size.height+alltitle.frame.origin.y, WIDTH, 50.0);
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
    [bgscrollview addSubview:segmentedControl];
    
    
    viewscroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, segmentedControl.frame.origin.y+segmentedControl.frame.size.height, WIDTH, 0)];
    viewscroll.backgroundColor=[UIColor clearColor];
    viewscroll.scrollEnabled=NO;
    [viewscroll setContentSize:CGSizeMake(WIDTH*2,0)];
    viewscroll.userInteractionEnabled=YES;
    viewscroll.backgroundColor=[UIColor clearColor];
    [bgscrollview addSubview:viewscroll];

    
    for(int i=0;i<5;i++)
    {
        UIImageView*stars=[[UIImageView alloc]initWithFrame:CGRectMake(10+20*i, 20, 15, 15)];
        stars.backgroundColor=[UIColor purpleColor];
        [viewscroll addSubview:stars];
    }
    
    UILabel*starsnum=[[UILabel alloc]initWithFrame:CGRectMake(10+20*4+20, 20, 100, 20)];
    starsnum.backgroundColor=[UIColor clearColor];
    starsnum.text=@"4.1分(7人)";
    starsnum.textColor=[UIColor blackColor];
    [viewscroll addSubview:starsnum];
    
    UIButton*commentbtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-40, 10, 30, 30)];
    commentbtn.backgroundColor=[UIColor yellowColor];
    [commentbtn addTarget:self action:@selector(toWritecomment) forControlEvents:UIControlEventTouchUpInside];

    [viewscroll addSubview:commentbtn];
    
    SubtableView=[[UITableView alloc] initWithFrame:CGRectMake(10, 20+40, self.view.frame.size.width-20, 0) style:UITableViewStyleGrouped];
    SubtableView.delegate=self;
    SubtableView.dataSource=self;
    SubtableView.backgroundView = nil;
    SubtableView.backgroundColor = [UIColor clearColor];//此处设置tableview的背景色
    SubtableView.userInteractionEnabled=YES;
    SubtableView. showsHorizontalScrollIndicator=NO;
    SubtableView. showsVerticalScrollIndicator=NO;
    SubtableView.scrollEnabled=NO;
    SubtableView.separatorColor=self.view.backgroundColor;
    [viewscroll addSubview:SubtableView];
    
    dispatch_async(dispatch_get_main_queue(), ^{
        
    SubtableView.frame=CGRectMake(SubtableView.frame.origin.x, SubtableView.frame.origin.y, SubtableView.frame.size.width, SubtableView.contentSize.height);
    viewscroll.frame=CGRectMake(0, segmentedControl.frame.origin.y+segmentedControl.frame.size.height, WIDTH, SubtableView.contentSize.height+60);
    [bgscrollview setContentSize:CGSizeMake(WIDTH,viewscroll.frame.origin.y+viewscroll.frame.size.height+64)];
    
    });

    
    
    {
    UIButton*notebtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH*2-40, 10, 30, 30)];
    notebtn.backgroundColor=[UIColor yellowColor];
        [notebtn addTarget:self action:@selector(toWritenote) forControlEvents:UIControlEventTouchUpInside];
    [viewscroll addSubview:notebtn];

    UITextView*noteview=[[UITextView alloc]initWithFrame:CGRectMake(WIDTH+10, 50, WIDTH-20, 200)];
    noteview.text=@"hehe";
    noteview.editable=NO;
    [viewscroll addSubview:noteview];
    }


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
-(void)changepage
{
    
    if (segmentedControl.selectedSegmentIndex>=4-1){//bean.littleimgs.count-1) {
        [viewscroll setContentOffset:CGPointMake((WIDTH)*(2-1), 0) animated:YES];
        
    }else
        [viewscroll setContentOffset:CGPointMake((WIDTH)*segmentedControl.selectedSegmentIndex, 0) animated:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)toWritenote
{
//    AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    writeNoteViewController*writenoteview=[[writeNoteViewController alloc]init];
    writenoteview.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:writenoteview animated:YES];
}
-(void)toWritecomment
{
//    AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    writeCommentViewController*writecomview=[[writeCommentViewController alloc]init];
    writecomview.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:writecomview animated:YES];
}
#pragma mark - table delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 10;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
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
    cell.textLabel.text=@"评论";
    return  cell;
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
