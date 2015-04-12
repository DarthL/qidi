//
//  RecommendViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/7.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "RecommendViewController.h"
#import "UIImageView+WebCache.h"
#import "CourseTableViewController.h"
#import "AppDelegate.h"
#import "WebViewController.h"
@interface RecommendViewController ()<UIGestureRecognizerDelegate>
{
    CustomPageControl*pagecontroller;
    int PngCount;
    UIScrollView*imgscroll;
    CourseTableViewController*coursetableview;


}
@end

@implementation RecommendViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor colorWithRed:242.0/255 green:242.0/255 blue:239.0/255 alpha:1];
    imgscroll=[[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 150)];
    imgscroll.backgroundColor=[UIColor clearColor];
    imgscroll.scrollEnabled=false;
    [imgscroll setContentSize:CGSizeMake(WIDTH*PngCount,150)];
    imgscroll.userInteractionEnabled=YES;
    [self.view addSubview:imgscroll];
    
    {
        pagecontroller=[[CustomPageControl alloc]initWithFrame:CGRectMake(0, 150-20, WIDTH, 18)];
        pagecontroller.numberOfPages=1;
        pagecontroller.currentPage=0;
        pagecontroller.backgroundColor=[UIColor clearColor];
        pagecontroller.currentColor=[UIColor whiteColor];
        pagecontroller.otherColour=[UIColor grayColor];
        [pagecontroller addTarget:self action:@selector(changepage) forControlEvents:UIControlEventValueChanged];
        [self.view addSubview:pagecontroller];
    }
    
    

    for(int i=1;i<4;i++)
    {
        {
            UISwipeGestureRecognizer*swipeGestureRight=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleGesture:)];
            swipeGestureRight.delegate = self;
            swipeGestureRight.numberOfTouchesRequired = i;
            swipeGestureRight.direction = UISwipeGestureRecognizerDirectionRight;
            [imgscroll addGestureRecognizer:swipeGestureRight];
            
            
            UISwipeGestureRecognizer*swipeGestureLeft=[[UISwipeGestureRecognizer alloc]initWithTarget:self action:@selector(handleGesture:)];
            swipeGestureLeft.delegate = self;
            swipeGestureLeft.numberOfTouchesRequired = i;
            swipeGestureLeft.direction = UISwipeGestureRecognizerDirectionLeft;
            [imgscroll addGestureRecognizer:swipeGestureLeft];
            
        }
    }
    
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(timerFired:) userInfo:nil repeats:YES];
    
    coursetableview=[[CourseTableViewController alloc]init];
    coursetableview.view.frame=CGRectMake(0, imgscroll.frame.size.height, WIDTH, self.view.frame.size.height-imgscroll.frame.size.height);
    coursetableview.SubtableView.frame=CGRectMake(0, 0, WIDTH, self.view.frame.size.height-imgscroll.frame.size.height-150);
    [self.view addSubview:coursetableview.view];

    
    
    

}
-(void)timerFired:(NSTimer *)timer{
    if(PngCount>0)
    {
    pagecontroller.currentPage =(pagecontroller.currentPage+ 1)%PngCount;
    if(pagecontroller.currentPage<PngCount)
    {
        [self changepage];
    }
    }
    
}
#pragma mark 切换图片及左滑切换页面
-(void)handleGesture:(UISwipeGestureRecognizer *)gestureRecognizer
{
    UIView*view=[gestureRecognizer view];
    UISwipeGestureRecognizerDirection direction = gestureRecognizer.direction;
    switch (direction) {
        case UISwipeGestureRecognizerDirectionLeft:
        {
            if(view==imgscroll)
            {
                pagecontroller.currentPage += 1;
                if(pagecontroller.currentPage<PngCount)
                {
                    [self changepage];
                }
            }
            
            
        }
            break;
        case UISwipeGestureRecognizerDirectionRight:
        {
            
            
            //                if(asi_delegate_error==NO)
            
            if(view==imgscroll)
            {
                pagecontroller.currentPage -= 1;
                if(pagecontroller.currentPage>-1)
                {
                    [self changepage];
                }
            }
            
        }
            break;
        default:
            break;
    }
}

-(void)changepage
{
    
    if (pagecontroller.currentPage>=PngCount-1){//bean.littleimgs.count-1) {
        [imgscroll setContentOffset:CGPointMake((WIDTH)*(PngCount-1), 0) animated:YES];
        
    }else
        [imgscroll setContentOffset:CGPointMake((WIDTH)*pagecontroller.currentPage, 0) animated:YES];
    
}
-(void)startLoad
{
    PngCount=3;

    if(PngCount>0)
    {
        //放置图片位置
        [imgscroll setContentSize:CGSizeMake(WIDTH*PngCount,120)];
        for(int i=0;i<PngCount;i++)
        {
            UIImageView*imgview=[[UIImageView alloc]initWithFrame:CGRectMake(imgscroll.frame.size.width*i,0 , imgscroll.frame.size.width, imgscroll.frame.size.height)];
            //            imgview.backgroundColor=[UIColor grayColor];
            //            [imgview setImage:[UIImage imageNamed:@"文章默认"]];
            
            
            NSString*strURL=@"http://img0.pconline.com.cn/pconline/1306/13/3340324_2.jpg";
            [imgview setImageWithURL:[NSURL URLWithString:strURL] placeholderImage:[UIImage imageNamed:@"tabicon"]];
            
            
            UIButton*imgbtn=[[UIButton alloc]initWithFrame:imgview.frame];
            imgbtn.backgroundColor=[UIColor clearColor];
            [imgbtn addTarget:self action:@selector(toimgWebview) forControlEvents:UIControlEventTouchUpInside];
            [imgscroll addSubview:imgbtn];
            
            [imgscroll addSubview:imgview];
            
            
            
        }
        [pagecontroller setNumberOfPages:PngCount];
        
    }
    
   
}
-(void)toimgWebview
{
    AppDelegate*delegate=(AppDelegate*)[[UIApplication sharedApplication]delegate];
    WebViewController*webview=[[WebViewController alloc]init];
    webview.hidesBottomBarWhenPushed = YES;
    [delegate.coursenavigation pushViewController:webview animated:YES];
    
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
