//
//  DiscussDetailViewController.m
//  启迪学堂
//
//  Created by DarthL on 15/4/11.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "DiscussDetailViewController.h"
#import "CommentObject.h"
#import "HandleTools.h"
#import "ReplyViewController.h"
#define FirstCellHeight 260

static NSString *CELLID = @"discussCommentCell";

@interface DiscussDetailViewController ()
{
    UILabel *labelTopic;
    UILabel *labelAuthor;
    UILabel *labelDate;
    UIImageView *imageViewProfile;
    UITextView *textViewContent;
    UIButton *showInFlashBtn;
    UIImageView *imageViewRead;
    UIImageView *imageViewReply;
    UILabel *labelRead;
    UILabel *labelReply;
    
    UIView *aboveView;
    UITableView *commentTableView;
    NSMutableArray *commentObjects;
    
    UIButton *topBtn;
    
    ReplyViewController *replyVC;

}
@end

@implementation DiscussDetailViewController
@synthesize topic = _topic;
@synthesize author = _author;
@synthesize timeString = _timeString;
@synthesize profile = _profile;
@synthesize content = _content;
@synthesize readNumber = _readNumber;
@synthesize replyNumber = _replyNumber;

- (id)init{
    
    self = [super init];
    if (self) {
        

    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //单机测试
    CommentObject *comment1 = [[CommentObject alloc] initWithDict:@{@"NICKNAME":@"dreamhack",@"PROFILE":[UIImage imageNamed:@"profile.jpg"],@"DATE":@"2014-09-11",@"COMMENT":@"您好，上面有wdcp的教程"}];
    CommentObject *comment2 = [[CommentObject alloc] initWithDict:@{@"NICKNAME":@"dreamhack",@"PROFILE":[UIImage imageNamed:@"profile.jpg"],@"DATE":@"2014-09-11",@"COMMENT":@"您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程您好，上面有wdcp的教程"}];
    CommentObject *comment3 = [[CommentObject alloc] initWithDict:@{@"NICKNAME":@"dreamhack",@"PROFILE":[UIImage imageNamed:@"profile.jpg"],@"DATE":@"2014-09-11",@"COMMENT":@"您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程,您好，上面有wdcp的教程您好，上面有wdcp的教程jkasjkajfklajfklajflkdjalfkjaklfajhfjahfjkahfjkahfjkahfjkahjkfh范德萨范德萨发生的方式都是告诉告诉过三年模拟出美女没处女每次V迷惹我认为方法没给你发没事故发生经过考虑是否"}];
    commentObjects = [NSMutableArray arrayWithObjects:comment1,comment2,comment1,comment3, nil];
    //
    
    
    self.navigationController.title = _topic;
    self.view.backgroundColor = [HandleTools colorStringToInt:@"0xe1e1e1"];
    
    
    
    
    {
        aboveView = [[UIView alloc] init];
        aboveView.frame = CGRectMake(0, 0, WIDTH, FirstCellHeight);
        aboveView.backgroundColor = [UIColor whiteColor];
        
        labelTopic = [[UILabel alloc] init];
        labelTopic.frame = CGRectMake(20, 20, WIDTH, 15);
        labelTopic.text = _topic;
        [aboveView addSubview:labelTopic];
        
        imageViewProfile = [[UIImageView alloc] init];
        imageViewProfile.frame = CGRectMake(20, labelTopic.frame.origin.y+labelTopic.frame.size.height + 10, 40, 40);
        imageViewProfile.image = [UIImage imageNamed:@"profile.jpg"];
        imageViewProfile.layer.cornerRadius = 20;
        imageViewProfile.layer.masksToBounds = YES;
        [aboveView addSubview:imageViewProfile];
        
        labelAuthor = [[UILabel alloc] init];
        labelAuthor.frame = CGRectMake(imageViewProfile.frame.origin.x+imageViewProfile.frame.size.width + 10, imageViewProfile.frame.origin.y, WIDTH - labelAuthor.frame.origin.x - 10, imageViewProfile.frame.size.height*0.3);
        labelAuthor.text = _author;
        labelAuthor.textColor = [UIColor greenColor];
        [labelAuthor sizeToFit];
        [aboveView addSubview:labelAuthor];
        
        labelDate = [[UILabel alloc] init];
        labelDate.frame = CGRectMake(labelAuthor.frame.origin.x, labelAuthor.frame.origin.y+labelAuthor.frame.size.height+5, WIDTH, labelAuthor.frame.size.height);
        labelDate.text = @"2014-04-30";
        labelDate.textColor = [UIColor grayColor];
        [labelDate sizeToFit];
        [aboveView addSubview:labelDate];
        
        textViewContent = [[UITextView alloc] init];
        textViewContent.frame = CGRectMake(30, imageViewProfile.frame.size.height+imageViewProfile.frame.origin.y + 10, WIDTH - 60, 130);
        textViewContent.text = @"如题，看到有个帖子说不支持WDCP。";//_content;
        textViewContent.font = [UIFont boldSystemFontOfSize:20];
        textViewContent.editable = NO;
        [aboveView addSubview:textViewContent];
        
        showInFlashBtn = [[UIButton alloc] init];
        showInFlashBtn.frame = CGRectMake(20, textViewContent.frame.origin.y+textViewContent.frame.size.height + 10, 100, 20);
        [showInFlashBtn setTitle:@"Flash课时演示" forState:UIControlStateNormal];
        [showInFlashBtn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
        [showInFlashBtn setBackgroundColor:[UIColor whiteColor]];
        showInFlashBtn.showsTouchWhenHighlighted = YES;
        [showInFlashBtn addTarget:self action:@selector(showInFlashBtnClicked) forControlEvents:UIControlEventTouchUpInside];
        showInFlashBtn.titleLabel.font = [UIFont boldSystemFontOfSize:14];
        [aboveView addSubview:showInFlashBtn];
        
        labelReply = [[UILabel alloc] init];
        labelReply.frame = CGRectMake(WIDTH - 25, showInFlashBtn.frame.origin.y, 20, 20);
        labelReply.text = [NSString stringWithFormat:@"%d",_replyNumber];
        [labelReply sizeToFit];
        [aboveView addSubview:labelReply];
        
        imageViewReply = [[UIImageView alloc] init];
        imageViewReply.frame = CGRectMake(labelReply.frame.origin.x - 20 - 10, labelReply.frame.origin.y, 20, 20);
        imageViewReply.image = [UIImage imageNamed:@"profile.jpg"];
        [aboveView addSubview:imageViewReply];
        
        labelRead = [[UILabel alloc] init];
        labelRead.frame = CGRectMake(imageViewReply.frame.origin.x-20-20, labelReply.frame.origin.y, 20, 20);
        labelRead.text = [NSString stringWithFormat:@"%d",_readNumber];
        [labelRead sizeToFit];
        [aboveView addSubview:labelRead];
        
        imageViewRead = [[UIImageView alloc] init];
        imageViewRead.frame = CGRectMake(labelRead.frame.origin.x-20-10, labelReply.frame.origin.y, 20, 20);
        imageViewRead.image = [UIImage imageNamed:@"profile.jpg"];
        [aboveView addSubview:imageViewRead];
        
    }
    
    {

        
        commentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,/*HEIGHT * 0.4*/ WIDTH, HEIGHT-64) style:UITableViewStyleGrouped];
        commentTableView.delegate = self;
        commentTableView.dataSource = self;

        
        [self.view addSubview:commentTableView];
        
    }
    
    //悬浮按钮
    topBtn = [[UIButton alloc] init];
    topBtn.frame = CGRectMake(WIDTH - 60, HEIGHT - 200, 40, 40);
    [topBtn setBackgroundColor:[UIColor blackColor]];
    [topBtn addTarget:self action:@selector(toReply) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topBtn];
    [self.view addSubview:topBtn];
    

    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationtitle setText:_topic];
    [self.leftbarbtn setTitle:@"后退" forState:UIControlStateNormal];
    [self.leftbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.leftbarbtn addTarget:self action:@selector(toback) forControlEvents:UIControlEventTouchUpInside];

    
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];

    
}
-(void)toback
{
    [self.navigationController popViewControllerAnimated:YES];
    
}

- (void)toReply{

    replyVC = [[ReplyViewController alloc] init];
    [self.navigationController pushViewController:replyVC animated:YES];
}

-(void)showInFlashBtnClicked{
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0) {
        return 1;
    }
    return commentObjects.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
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
    
    if ([indexPath section] == 0) {
        [cell.contentView addSubview:aboveView];
        return cell;
    }
    
    
    CommentObject *curComment = [commentObjects objectAtIndex:[indexPath row]];
    
    UIImageView *profileView = [[UIImageView alloc] init];
    profileView.frame = CGRectMake(20, 10, 40, 40);
    profileView.image = curComment.profileImage;
    profileView.layer.cornerRadius = 20;
    profileView.layer.masksToBounds = YES;
    [cell.contentView addSubview:profileView];

    UILabel *nickNameLabel = [[UILabel alloc] init];
    nickNameLabel.frame = CGRectMake(profileView.frame.size.width + profileView.frame.origin.x + 5, profileView.frame.origin.y, WIDTH, profileView.frame.size.height +5);
    nickNameLabel.text = curComment.nickName;
    nickNameLabel.textColor = [UIColor greenColor];
    [nickNameLabel sizeToFit];
    [cell.contentView addSubview:nickNameLabel];
    
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.frame = CGRectMake(WIDTH - 100, nickNameLabel.frame.origin.y, 80, nickNameLabel.frame.size.height);
    dateLabel.text = curComment.commentDate;
    [dateLabel sizeToFit];
    [cell.contentView addSubview:dateLabel];
    
    
    UITextView *commentTextView = [[UITextView alloc] init];
    commentTextView.editable = NO;
    commentTextView.text = curComment.commentBody;
    commentTextView.frame = CGRectMake(nickNameLabel.frame.origin.x,nickNameLabel.frame.origin.y+nickNameLabel.frame.size.height+5,WIDTH - nickNameLabel.frame.origin.x,0);
    [commentTextView sizeToFit];
    CGRect rect = commentTextView.frame;
    [cell.contentView addSubview:commentTextView];
    
    [cell setFrame:CGRectMake(rect.origin.x, rect.origin.y, rect.size.width, rect.size.height+5+nickNameLabel.frame.size.height+10)];
//    rect.size.height = [self heightForTextView:commentTextView WithText:curComment.commentBody];
//    [commentTextView setFrame:rect];

    return cell;

}

#pragma mark - Table Delegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{

    if ([indexPath section] == 0) {
        return FirstCellHeight;
    }
    UITableViewCell *cell = [self tableView:tableView cellForRowAtIndexPath:indexPath];
    return cell.frame.size.height;
//    CommentObject *curComment = [commentObjects objectAtIndex:[indexPath row]];
//    NSString *text = curComment.commentBody;
//    
//    CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:14.0f] constrainedToSize:CGSizeMake(290, 20000)];
//    CGFloat height = size.height;
//    if (height < 30) {
//        height = 30;
//    }
//    else{
//        height+=10;
//    }
//    height+=50;
//    return height;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 0) {
        return 10;
    }
    return 0.001;
}
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
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

//#pragma mark 获取TEXTVIEW高度
//- (float) heightForTextView: (UITextView *)textView WithText: (NSString *) strText{
//    float fPadding = 16.0; // 8.0px x 2
//    CGSize constraint = CGSizeMake(textView.frame.size.width - fPadding, CGFLOAT_MAX);
//    CGSize size = [strText sizeWithFont: textView.font constrainedToSize:constraint lineBreakMode:UILineBreakModeWordWrap];
//    float fHeight = size.height + 16.0;
//    return fHeight;
//}
@end
