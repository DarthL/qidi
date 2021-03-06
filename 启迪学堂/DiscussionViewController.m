//
//  DiscussionViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/7.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "DiscussionViewController.h"
#import "HandleTools.h"
#import "DiscussDetailViewController.h"
#import "NewTopicViewController.h"
static NSString *CELLID = @"discussCell";

static NSString *kTOPIC = @"TOPIC";
static NSString *kAUTHOR = @"AUTHOR";
static NSString *kCONTENT = @"CONTENT";
static NSString *kTIME = @"TIME";
static NSString *kREPLY = @"REPLY";
static NSString *kREAD = @"READ";

@interface DiscussionViewController ()
{
    UITableView *dicusTable;
    NSMutableArray *discussArray;
    NSMutableArray *groupArray;
    
    
    UIButton *topBtn;
    DiscussDetailViewController *discussDetailVC;
    NewTopicViewController *newTopicVC;
}
@end

@implementation DiscussionViewController
- (id)init{
    
    self = [super init];
    if (self) {
        [self.tabBarItem setImage:[UIImage imageNamed:@"tabicon"]];
        self.tabBarItem.title = @"讨论";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];

    // Do any additional setup after loading the view.
    
    //单机
    NSDictionary *discussDic = @{@"TOPIC":@"WDCP面板下怎么安装？",@"AUTHOR":@"李元奎在北京",@"CONTENT":@"如题，看到有个帖子说不支持WDCP。",@"TIME":@"2",@"REPLY":@(1),@"READ":@(100)};
    NSDictionary *discussDic2 = @{@"TOPIC":@"WDCP面板下怎么安装？",@"AUTHOR":@"orjnksadkhfad",@"CONTENT":@"如题，看到有个帖子说不支持WDCP。",@"TIME":@"2",@"REPLY":@(1),@"READ":@(100)};
    discussArray = [NSMutableArray arrayWithObjects:discussDic,discussDic2,discussDic,nil];
    
    groupArray = [NSMutableArray arrayWithObjects:@"清水中学\n三年一班",@"清水中学\n高三数学班",@"清水中学\n英语教学组", nil];
    //
    

    UIScrollView *dicussScrollView = [[UIScrollView alloc] init];
    dicussScrollView.frame = CGRectMake(0, 0, WIDTH, 40);
    dicussScrollView.backgroundColor = [HandleTools colorStringToInt:@"0xffffff"];
    dicussScrollView.showsHorizontalScrollIndicator = NO;
    
    
    
    float scrollwidth=(groupArray.count+2)*110+10;
    if (scrollwidth > WIDTH) {
        dicussScrollView.contentSize = CGSizeMake(scrollwidth, dicussScrollView.frame.size.height);
    }
    for (int i = 0; i < groupArray.count; i++) {
        
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = i;
        btn.frame = CGRectMake(110*i+10, 0, 100, 40);
        [btn addTarget:self action:@selector(groupBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        //[btn setTitle:groupArray[0] forState:UIControlStateNormal];
        //btn.titleLabel.numberOfLines = 0;
        btn.backgroundColor = [UIColor clearColor];
        [btn setShowsTouchWhenHighlighted:YES];
        btn.layer.cornerRadius = 25/2.0;
        
        UILabel *btnLabel = [[UILabel alloc] init];
        btnLabel.frame = CGRectMake(20, 5, 60, 35);
        btnLabel.text = groupArray[i];
        btnLabel.font = [UIFont boldSystemFontOfSize:12];
        btnLabel.numberOfLines = 0;
        [btn addSubview:btnLabel];

        [dicussScrollView addSubview:btn];
    }
    [self.view addSubview:dicussScrollView];
    
    
    {
    dicusTable = [[UITableView alloc] initWithFrame:CGRectMake(0, dicussScrollView.frame.origin.y+dicussScrollView.frame.size.height, WIDTH, HEIGHT) style:UITableViewStyleGrouped];
    dicusTable.delegate = self;
    dicusTable.dataSource = self;
    [self.view addSubview:dicusTable];
    }
    
    
    //悬浮按钮
    topBtn = [[UIButton alloc] init];
    topBtn.frame = CGRectMake(WIDTH - 60, HEIGHT - 200, 40, 40);
    [topBtn setBackgroundImage:[UIImage imageNamed:@"post_button.png"] forState:UIControlStateNormal];
    [topBtn addTarget:self action:@selector(toNewTopic) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topBtn];
//    [self.view bringSubviewToFront:topBtn];
    
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationtitle setText:@"讨论"];

    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)groupBtnClicked{

    
}

- (void)toNewTopic{

    newTopicVC = [[NewTopicViewController alloc] init];
    [self.navigationController pushViewController:newTopicVC animated:YES];
}

#pragma mark - TableView DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return discussArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELLID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CELLID];
    }else{
        [cell.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
    }
    CellChangeSelectedColor;
    cell.backgroundColor=[UIColor whiteColor];
    
    
    NSDictionary *curDiscussInfo = [discussArray objectAtIndex:[indexPath row]];
    
    UILabel *topicTextView = [[UILabel alloc] init];
    topicTextView.frame = CGRectMake(10, 10, WIDTH, 25);
    topicTextView.textColor = [HandleTools colorStringToInt:@"0x282828"];
    topicTextView.font = [UIFont boldSystemFontOfSize:13];
    topicTextView.userInteractionEnabled = NO;
    topicTextView.text = curDiscussInfo[kTOPIC];
    [topicTextView sizeToFit];
    [cell.contentView addSubview:topicTextView];
    
    UILabel *authorlabel = [[UILabel alloc] init];
    authorlabel.frame = CGRectMake(topicTextView.frame.origin.x, topicTextView.frame.origin.y+topicTextView.frame.size.height + 10, 100, 20);
    authorlabel.text = curDiscussInfo[kAUTHOR];
    authorlabel.font = [UIFont fontWithName:@"Helvetica" size:11];
    authorlabel.textColor = [HandleTools colorStringToInt:@"0xe99511"];
    [authorlabel sizeToFit];
    [cell.contentView addSubview:authorlabel];
    
    UILabel *timelabel = [[UILabel alloc] init];
    timelabel.frame = CGRectMake(authorlabel.frame.origin.x+authorlabel.frame.size.width + 20, authorlabel.frame.origin.y, 100, 20);
    timelabel.text = [NSString stringWithFormat:@"%@小时前",curDiscussInfo[kTIME]];
    timelabel.font = [UIFont fontWithName:@"Helvetica" size:11];
    [timelabel setTextColor:[HandleTools colorStringToInt:@"0x078700"]];
    [timelabel sizeToFit];
    [cell.contentView addSubview:timelabel];
    
    UIImageView *readNumImage = [[UIImageView alloc] init];
    readNumImage.frame = CGRectMake(WIDTH - 107, timelabel.frame.origin.y, 14, 8);
    [readNumImage setImage:[UIImage imageNamed:@"see_icon"]];
    [cell.contentView addSubview:readNumImage];
    
    UILabel *readNumLabel = [[UILabel alloc] init];
    readNumLabel.frame = CGRectMake(readNumImage.frame.origin.x+readNumImage.frame.size.width + 2, readNumImage.frame.origin.y, 0, 10);
    readNumLabel.text = @"12345";
    readNumLabel.font = [UIFont fontWithName:@"Helvetica" size:10];
    [readNumLabel sizeToFit];
    [cell.contentView addSubview:readNumLabel];
    
    UIImageView *replyNumImage = [[UIImageView alloc] init];
    replyNumImage.frame = CGRectMake(WIDTH - 48, timelabel.frame.origin.y, 12, 11);
    [replyNumImage setImage:[UIImage imageNamed:@"comment_icon"]];
    [cell.contentView addSubview:replyNumImage];
    
    UILabel *replyNumLabel = [[UILabel alloc] init];
    replyNumLabel.frame = CGRectMake(replyNumImage.frame.origin.x+replyNumImage.frame.size.width + 2, replyNumImage.frame.origin.y, 0, 10);
    replyNumLabel.text = @"66";
    replyNumLabel.font = [UIFont fontWithName:@"Helvetica" size:10];
    [replyNumLabel sizeToFit];
    [cell.contentView addSubview:replyNumLabel];
    
//    UILabel *replyandReadLabel = [[UILabel alloc] init];
//    replyandReadLabel.frame = CGRectMake(WIDTH - 100, 80, 100, 10);
//    replyandReadLabel.text = [NSString stringWithFormat:@"回:%@  阅:%@",curDiscussInfo[kREPLY],curDiscussInfo[kREAD]];
//    [cell.contentView addSubview:replyandReadLabel];
    

    
    
    return cell;
    
    

}


#pragma mark - Table Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    discussDetailVC = [[DiscussDetailViewController alloc] init];
    discussDetailVC.hidesBottomBarWhenPushed =YES;
    discussDetailVC.topic = [[discussArray objectAtIndex:[indexPath row]] objectForKey:kTOPIC];
    discussDetailVC.author = [[discussArray objectAtIndex:[indexPath row]] objectForKey:kAUTHOR];
    discussDetailVC.content = [[discussArray objectAtIndex:[indexPath row]] objectForKey:kCONTENT];
    discussDetailVC.readNumber = [[[discussArray objectAtIndex:[indexPath row]] objectForKey:kREAD] intValue];
    discussDetailVC.replyNumber = [[[discussArray objectAtIndex:[indexPath row]] objectForKey:kREPLY] intValue];
    
    [self.navigationController pushViewController:discussDetailVC animated:YES];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 70;
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
