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
#define FirstCellHeight 75

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
    self.view.backgroundColor = [HandleTools colorStringToInt:@"0xf5f5f5"];
    
    
    
    
    {
        aboveView = [[UIView alloc] init];
        aboveView.frame = CGRectMake(0, 6, WIDTH, FirstCellHeight);
        aboveView.backgroundColor = [UIColor whiteColor];
        


        
        UILabel *topicTextView = [[UILabel alloc] init];
        topicTextView.frame = CGRectMake(10, 10, WIDTH, 25);
        topicTextView.textColor = [HandleTools colorStringToInt:@"0x282828"];
        topicTextView.font = [UIFont boldSystemFontOfSize:13];
        topicTextView.userInteractionEnabled = NO;
        topicTextView.text = _topic;
        [topicTextView sizeToFit];
        [aboveView addSubview:topicTextView];
        
        imageViewProfile = [[UIImageView alloc] init];
        imageViewProfile.frame = CGRectMake(12,  topicTextView.frame.origin.y+topicTextView.frame.size.height + 8, 20, 20);
        imageViewProfile.image = [UIImage imageNamed:@"profile.jpg"];
        imageViewProfile.layer.cornerRadius = 10;
        imageViewProfile.layer.masksToBounds = YES;
        [aboveView addSubview:imageViewProfile];
        
        UILabel *authorlabel = [[UILabel alloc] init];
        authorlabel.frame = CGRectMake(imageViewProfile.frame.origin.x + imageViewProfile.frame.size.width + 8, topicTextView.frame.origin.y+topicTextView.frame.size.height + 10, 100, 20);
        authorlabel.text = _author;
        authorlabel.font = [UIFont fontWithName:@"Helvetica" size:11];
        authorlabel.textColor = [HandleTools colorStringToInt:@"0xff8901"];
        [authorlabel sizeToFit];
        [aboveView addSubview:authorlabel];
        

        
        UILabel *timelabel = [[UILabel alloc] init];
        timelabel.frame = CGRectMake(authorlabel.frame.origin.x+authorlabel.frame.size.width + 20, authorlabel.frame.origin.y, 100, 20);
        timelabel.text = [NSString stringWithFormat:@"%@小时前",@"1"];
        timelabel.font = [UIFont fontWithName:@"Helvetica" size:11];
        [timelabel setTextColor:[HandleTools colorStringToInt:@"0x078700"]];
        [timelabel sizeToFit];
        [aboveView addSubview:timelabel];
        
        UIImageView *readNumImage = [[UIImageView alloc] init];
        readNumImage.frame = CGRectMake(WIDTH - 107, timelabel.frame.origin.y, 14, 8);
        [readNumImage setImage:[UIImage imageNamed:@"see_icon"]];
        [aboveView addSubview:readNumImage];
        
        UILabel *readNumLabel = [[UILabel alloc] init];
        readNumLabel.frame = CGRectMake(readNumImage.frame.origin.x+readNumImage.frame.size.width + 2, readNumImage.frame.origin.y, 0, 10);
        readNumLabel.text = @"12345";
        readNumLabel.font = [UIFont fontWithName:@"Helvetica" size:10];
        [readNumLabel sizeToFit];
        [aboveView addSubview:readNumLabel];
        
        UIImageView *replyNumImage = [[UIImageView alloc] init];
        replyNumImage.frame = CGRectMake(WIDTH - 48, timelabel.frame.origin.y, 12, 11);
        [replyNumImage setImage:[UIImage imageNamed:@"comment_icon"]];
        [aboveView addSubview:replyNumImage];
        
        UILabel *replyNumLabel = [[UILabel alloc] init];
        replyNumLabel.frame = CGRectMake(replyNumImage.frame.origin.x+replyNumImage.frame.size.width + 2, replyNumImage.frame.origin.y, 0, 10);
        replyNumLabel.text = @"66";
        replyNumLabel.font = [UIFont fontWithName:@"Helvetica" size:10];
        [replyNumLabel sizeToFit];
        [aboveView addSubview:replyNumLabel];
        

        
    }
    
    {

        
        commentTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0,/*HEIGHT * 0.4*/ WIDTH, HEIGHT-64) style:UITableViewStyleGrouped];
        commentTableView.delegate = self;
        commentTableView.dataSource = self;
        commentTableView.separatorColor = [HandleTools colorStringToInt:@"0xe7e7e7"];
        
        [self.view addSubview:commentTableView];
        
    }
    
    //悬浮按钮
    topBtn = [[UIButton alloc] init];
    topBtn.frame = CGRectMake(WIDTH - 60, HEIGHT - 200, 40, 40);
    [topBtn setBackgroundImage:[UIImage imageNamed:@"comment_button.png"] forState:UIControlStateNormal];
    
    [topBtn addTarget:self action:@selector(toReply) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:topBtn];
    [self.view addSubview:aboveView];
    

    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationtitle setText:_topic];
    [self.leftbarbtn setTitle:@"后退" forState:UIControlStateNormal];
//    [self.leftbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.leftbarbtn setBackgroundImage:[UIImage imageNamed:@"back_button"] forState:UIControlStateNormal];
    
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
        return 2;
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
        if([indexPath row] == 0){
            [cell.contentView addSubview:aboveView];
        }
        else if ([indexPath row] == 1){
            textViewContent = [[UITextView alloc] init];
            textViewContent.frame = CGRectMake(12, 12, WIDTH - 12,0);
            textViewContent.text = @"如题，看到有个帖子说不支持WDCP。";//_content;
            [textViewContent sizeToFit];
    
            textViewContent.font = [UIFont fontWithName:@"Helvetica" size:12];
            textViewContent.editable = NO;
            CGRect rect = textViewContent.frame;
            [cell.contentView addSubview:textViewContent];
            
            [cell setFrame:CGRectMake(rect.origin.x,rect.origin.y, rect.size.width, rect.size.height+30)];
            [cell.contentView addSubview:textViewContent];
            
        }
        return cell;
    }
    
    
    CommentObject *curComment = [commentObjects objectAtIndex:[indexPath row]];
    
    UIImageView *profileView = [[UIImageView alloc] init];
    profileView.frame = CGRectMake(12, 15, 20, 20);
    profileView.image = curComment.profileImage;
    profileView.layer.cornerRadius = 10;
    profileView.layer.masksToBounds = YES;
    [cell.contentView addSubview:profileView];

    UILabel *nickNameLabel = [[UILabel alloc] init];
    nickNameLabel.frame = CGRectMake(profileView.frame.size.width + profileView.frame.origin.x + 10, profileView.frame.origin.y, 180, 20);
    nickNameLabel.text = curComment.nickName;
    nickNameLabel.textColor = [HandleTools colorStringToInt:@"0xff8901"];
    nickNameLabel.font = [UIFont fontWithName:@"Helvetica" size:11];
    [cell.contentView addSubview:nickNameLabel];
    
    
    UILabel *dateLabel = [[UILabel alloc] init];
    dateLabel.frame = CGRectMake(WIDTH - 100, nickNameLabel.frame.origin.y, 80, nickNameLabel.frame.size.height);
    dateLabel.text = curComment.commentDate;
    dateLabel.textAlignment = NSTextAlignmentRight;
    dateLabel.font = [UIFont fontWithName:@"Helvetica" size:11];
    dateLabel.textColor = [HandleTools colorStringToInt:@"0xc9c9c9"];
    [cell.contentView addSubview:dateLabel];
    
    
    UITextView *commentTextView = [[UITextView alloc] init];
    commentTextView.editable = NO;
    commentTextView.text = curComment.commentBody;
    
    commentTextView.frame = CGRectMake(profileView.frame.origin.x,profileView.frame.origin.y+profileView.frame.size.height,WIDTH - nickNameLabel.frame.origin.x,0);
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
        if ([indexPath row] == 0) {
            return 75;
        }
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
