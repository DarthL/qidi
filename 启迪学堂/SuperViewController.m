//
//  SuperViewController.m
//  TheFlash
//
//  Created by 蒲石 on 15/1/27.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "SuperViewController.h"
@interface SuperViewController ()

@end

@implementation SuperViewController
@synthesize rightbarimg;
@synthesize rightbarbtn;
@synthesize leftbarbtn;
@synthesize leftbarimg;
@synthesize navigationBarLeftImg;
@synthesize navigationBarRightImg;
@synthesize navigationtitle;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    {
        rightbarbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        rightbarbtn.frame =  CGRectMake(0, 0, 65, 44);
        rightbarbtn.backgroundColor = [UIColor clearColor];
        UIBarButtonItem *BarButton = [[UIBarButtonItem alloc] initWithCustomView:rightbarbtn];
        [rightbarbtn.titleLabel setFont:[UIFont fontWithName:@"STHeitiSC-Light" size:18]];
        self.navigationItem.rightBarButtonItem = BarButton;
    }
    {
        leftbarbtn = [UIButton buttonWithType:UIButtonTypeCustom];
        leftbarbtn.frame =  CGRectMake(WIDTH-65, 0, 65, 44);
        leftbarbtn.backgroundColor = [UIColor clearColor];
        UIBarButtonItem *BarButton = [[UIBarButtonItem alloc] initWithCustomView:leftbarbtn];
        [leftbarbtn.titleLabel setFont:[UIFont fontWithName:@"STHeitiSC-Light" size:18]];

        self.navigationItem.leftBarButtonItem = BarButton;
    }
    
}
-(void)viewWillAppear:(BOOL)animated
{//修改navigationbar左右功能键位置大小
    
    navigationBarLeftImg=[[UIImageView alloc] initWithFrame:CGRectMake(10, 7, 105/2.0, 54/2.0)];
    [navigationBarLeftImg setImage:[UIImage imageNamed:leftbarimg]];
    
    navigationBarRightImg=[[UIImageView alloc] initWithFrame:CGRectMake(WIDTH-30, 13, 20, 20)];
    [navigationBarRightImg setImage:[UIImage imageNamed:rightbarimg]];
    
    [self.navigationController.navigationBar addSubview:navigationBarLeftImg];
    [self.navigationController.navigationBar addSubview:navigationBarRightImg];
    
    
    {
        navigationtitle=[[UILabel alloc]initWithFrame:CGRectMake(WIDTH/2-100, 10, 200, 25)];
        navigationtitle.textAlignment=NSTextAlignmentCenter;
        navigationtitle.backgroundColor=[UIColor clearColor];
        navigationtitle.textColor=[HandleTools colorStringToInt:@"#646464"];
        [navigationtitle setFont:[UIFont fontWithName:@"STHeitiSC-Light" size:18]];

        [self.navigationController.navigationBar addSubview:navigationtitle];

    }
//    self.navigationController.navigationBar.backgroundColor = [HandleTools colorStringToInt:@"0x00b4ff"];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [navigationBarLeftImg removeFromSuperview];
    [navigationBarRightImg removeFromSuperview];
    [navigationtitle removeFromSuperview];
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
