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
#import "CommentObject.h"
@interface ShowPlayerViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UIScrollView*bgscrollview;
    UIScrollView*viewscroll;
    UISegmentedControl*segmentedControl;
    UITableView*SubtableView;
    NSMutableArray *commentObjects;
}
@end

@implementation ShowPlayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //单机测试
    CommentObject *comment1 = [[CommentObject alloc] initWithDict:@{@"NICKNAME":@"dreamhack",@"PROFILE":[UIImage imageNamed:@"profile.jpg"],@"DATE":@"2014-09-11",@"COMMENT":@"您好，上面有wdcp的教程"}];
    CommentObject *comment2 = [[CommentObject alloc] initWithDict:@{@"NICKNAME":@"dreamhack",@"PROFILE":[UIImage imageNamed:@"profile.jpg"],@"DATE":@"2014-09-11",@"COMMENT":@"您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程您好，上面有wdcp的教程"}];
    CommentObject *comment3 = [[CommentObject alloc] initWithDict:@{@"NICKNAME":@"dreamhack",@"PROFILE":[UIImage imageNamed:@"profile.jpg"],@"DATE":@"2014-09-11",@"COMMENT":@"您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程您好，上面有wdcp的教程jkasjkajfklajfklajflkdjalfkjaklfajhfjahfjkahfjkahfjkahfjkahjkfh范德萨范德萨发生的方式都是告诉告诉过三年模拟出美女没处女每次V迷惹我认为方法没给你发没事故发生经过考虑是否"}];
    commentObjects = [NSMutableArray arrayWithObjects:comment1,comment2,comment1,comment3, nil];
    //
    
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255 green:242.0/255 blue:239.0/255 alpha:1];
    bgscrollview=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64)];
    bgscrollview.backgroundColor=[UIColor clearColor];
    bgscrollview.scrollEnabled=YES;
    [bgscrollview setContentSize:CGSizeMake(WIDTH,HEIGHT)];
    bgscrollview.userInteractionEnabled=YES;
    bgscrollview.backgroundColor=[UIColor clearColor];
    [self.view addSubview:bgscrollview];

    UIImageView*playerimg=[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 170)];
    playerimg.backgroundColor=[UIColor greenColor];
    [bgscrollview addSubview:playerimg];
    

    
    UIView*alltitleView=[[UIView alloc]initWithFrame:CGRectMake(0, playerimg.frame.origin.y+playerimg.frame.size.height, WIDTH, 85)];
    alltitleView.backgroundColor=[UIColor whiteColor];
    [bgscrollview addSubview:alltitleView];
    
    UIImageView *tagImageView = [[UIImageView alloc] init];
    tagImageView.frame = CGRectMake(10, 15, 16, 16);
    [alltitleView addSubview:tagImageView];
    
    UILabel *instructionLabel = [[UILabel alloc] init];
    instructionLabel.frame = CGRectMake(tagImageView.frame.origin.x+tagImageView.frame.size.width+10, tagImageView.frame.origin.y, 0, 16);
    instructionLabel.text = @"本课程讲解PPT设计原理";
    [instructionLabel sizeToFit];
    [alltitleView addSubview:instructionLabel];
    
    UIImageView *studentImage = [[UIImageView alloc] initWithFrame:CGRectMake(10, tagImageView.frame.origin.y+tagImageView.frame.size.height+20, 17, 14)];
    studentImage.image = [UIImage imageNamed:@"numbers_icon"];
    [alltitleView addSubview:studentImage];
    
    UILabel *studentNumLabel = [[UILabel alloc] initWithFrame:CGRectMake(studentImage.frame.origin.x+studentImage.frame.size.width+5, studentImage.frame.origin.y,35, 14)];
    studentNumLabel.text = @"123";
    [alltitleView addSubview:studentNumLabel];

    UIImageView *scoreImage = [[UIImageView alloc] initWithFrame:CGRectMake(studentNumLabel.frame.origin.x+studentNumLabel.frame.size.width+5, studentNumLabel.frame.origin.y, 15, 15)];
    scoreImage.image = [UIImage imageNamed:@"score_icon"];
    [alltitleView addSubview:scoreImage];
    
    UILabel *scoreLabel = [[UILabel alloc] initWithFrame:CGRectMake(scoreImage.frame.origin.x+scoreImage.frame.size.width+5, scoreImage.frame.origin.y,45, 14)];
    scoreLabel.text = @"4.7分";
    [alltitleView addSubview:scoreLabel];
    
    
    UIImageView *priceImage = [[UIImageView alloc] initWithFrame:CGRectMake(scoreLabel.frame.origin.x+scoreLabel.frame.size.width+5, scoreLabel.frame.origin.y, 16, 16)];
    priceImage.image = [UIImage imageNamed:@"price_icon"];
    [alltitleView addSubview:priceImage];
    
    UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(priceImage.frame.origin.x+priceImage.frame.size.width+5, priceImage.frame.origin.y,45, 14)];
    priceLabel.text = @"免费";
    [alltitleView addSubview:priceLabel];
    
    UILabel *learnStatusLabel = [[UILabel alloc] initWithFrame:CGRectMake(WIDTH - 120,priceImage.frame.origin.y, 100, 18)];
    learnStatusLabel.text = @"已学习";
    learnStatusLabel.textColor = [UIColor whiteColor];
    learnStatusLabel.layer.cornerRadius = 5.0f;
    [learnStatusLabel sizeToFit];
    learnStatusLabel.backgroundColor = [HandleTools colorStringToInt:@"0x5eb25d"];
    [alltitleView addSubview:learnStatusLabel];
    
    UIButton *favBtn = [[UIButton alloc] initWithFrame:CGRectMake(WIDTH - 50, alltitleView.frame.origin.y-20, 40, 40)];
    [favBtn setBackgroundImage:[UIImage imageNamed:@"fav_collect_button"] forState:UIControlStateNormal];
    [favBtn addTarget:self action:@selector(toFav) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:favBtn];
    
    
    NSArray *segmentedArray = [[NSArray alloc]initWithObjects:@"微课评价",@"我的笔记",nil];
    //初始化UISegmentedControl
    
    segmentedControl = [[UISegmentedControl alloc]initWithItems:segmentedArray];
    segmentedControl.frame = CGRectMake(0 , alltitleView.frame.size.height+alltitleView.frame.origin.y+1, WIDTH, 40.0);
    segmentedControl.selectedSegmentIndex = 0;//设置默认选择项索引
    segmentedControl.tintColor = [UIColor clearColor];
    segmentedControl.backgroundColor = [UIColor whiteColor];
    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
                                             NSForegroundColorAttributeName: [HandleTools colorStringToInt:@"0x00b4ff"]};
    [segmentedControl setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont boldSystemFontOfSize:16],
                                               NSForegroundColorAttributeName: [HandleTools colorStringToInt:@"0x93bfcc"]};
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
        UIImageView*stars=[[UIImageView alloc]initWithFrame:CGRectMake(10+24*i, 20, 21, 20)];
        stars.backgroundColor=[UIColor clearColor];
        stars.image = [UIImage imageNamed:@"star_gray_big"];
        [viewscroll addSubview:stars];
    }
    
    UILabel*starsnum=[[UILabel alloc]initWithFrame:CGRectMake(10+20*4+20 + 20, 20, 100, 20)];
    starsnum.backgroundColor=[UIColor clearColor];
    starsnum.text=@"4.1分(7人)";
    starsnum.textColor=[HandleTools colorStringToInt:@"0xff8901"];
    [viewscroll addSubview:starsnum];
    
    UIButton*commentbtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH-40, 10, 30, 30)];
    [commentbtn setBackgroundImage:[UIImage imageNamed:@"comment_button"] forState:UIControlStateNormal];
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
    
        UIButton*notebtn=[[UIButton alloc]initWithFrame:CGRectMake(WIDTH*2-70-22, 10, 22, 18)];
        notebtn.backgroundColor=[UIColor clearColor];
        [notebtn setBackgroundImage:[UIImage imageNamed:@"addnote_icon.png"] forState:UIControlStateNormal];
        [notebtn addTarget:self action:@selector(toWritenote) forControlEvents:UIControlEventTouchUpInside];
        [viewscroll addSubview:notebtn];

        UILabel *writeNodeLabel = [[UILabel alloc] initWithFrame:CGRectMake(notebtn.frame.origin.x+notebtn.frame.size.width+5, notebtn.frame.origin.y, 80, 18)];
        writeNodeLabel.textAlignment = NSTextAlignmentLeft;
        writeNodeLabel.textColor = [HandleTools colorStringToInt:@"0x00b4ff"];
        writeNodeLabel.text = @"记笔记";
        [viewscroll addSubview:writeNodeLabel];
        
        UITextView*noteview=[[UITextView alloc]initWithFrame:CGRectMake(WIDTH, 50, WIDTH, 200)];
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

- (void)toFav
{
    
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
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return commentObjects.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
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
    
    CommentObject *curComment = [commentObjects objectAtIndex:[indexPath row]];
    
    UIImageView *profileView = [[UIImageView alloc] init];
    profileView.frame = CGRectMake(15, 18, 35, 35);
    profileView.image = curComment.profileImage;
    profileView.layer.cornerRadius = 35*0.5;
    profileView.layer.masksToBounds = YES;
    [cell.contentView addSubview:profileView];
    
    UILabel *nickNameLabel = [[UILabel alloc] init];
    nickNameLabel.frame = CGRectMake(profileView.frame.size.width + profileView.frame.origin.x + 10, profileView.frame.origin.y -5, 180, 20);
    nickNameLabel.text = curComment.nickName;
    nickNameLabel.textColor = [HandleTools colorStringToInt:@"0xff8901"];
    nickNameLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    [cell.contentView addSubview:nickNameLabel];
    
    
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.frame = CGRectMake(nickNameLabel.frame.origin.x, nickNameLabel.frame.origin.y+nickNameLabel.frame.size.height, 180, 20);
    dateLabel.text = @"今天 12:00";
    dateLabel.font = [UIFont fontWithName:@"Helvetica" size:13];
    dateLabel.textColor = [HandleTools colorStringToInt:@"0xc9c9c9"];
    [cell.contentView addSubview:dateLabel];
    
    
    for(int i=0;i<5;i++)
    {
        UIImageView*stars=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH -20- 20*(5-i), nickNameLabel.frame.origin.y, 17, 16)];
        stars.backgroundColor=[UIColor clearColor];
        stars.image = [UIImage imageNamed:@"star_gray_small"];
        [cell.contentView addSubview:stars];
    }
    
    UITextView *commentTextView = [[UITextView alloc] init];
    commentTextView.editable = NO;
    commentTextView.text = curComment.commentBody;
    commentTextView.font = [UIFont fontWithName:@"Helvetica" size:16];
    commentTextView.frame = CGRectMake(profileView.frame.origin.x,profileView.frame.origin.y+profileView.frame.size.height,WIDTH - nickNameLabel.frame.origin.x,0);
    [commentTextView sizeToFit];
    CGRect rect = commentTextView.frame;
    [cell.contentView addSubview:commentTextView];
    
    [cell setFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height+60)];

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
