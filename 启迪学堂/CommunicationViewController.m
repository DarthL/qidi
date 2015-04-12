//
//  CommunicationViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/7.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "CommunicationViewController.h"

@interface CommunicationViewController ()

@end

@implementation CommunicationViewController
- (id)init{
    
    self = [super init];
    if (self) {
        [self.tabBarItem setImage:[UIImage imageNamed:@"tabicon"]];
        self.tabBarItem.title = @"沟通";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor whiteColor];

    // Do any additional setup after loading the view.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.navigationtitle setText:@"沟通"];
    
}
-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
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
