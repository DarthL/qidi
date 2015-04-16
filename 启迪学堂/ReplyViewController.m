//
//  ReplyViewController.m
//  启迪学堂
//
//  Created by 梁伟 on 15/4/16.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "ReplyViewController.h"
@interface ReplyViewController ()
{
    UITextView *textViewContent;
}
@end

@implementation ReplyViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    textViewContent = [[UITextView alloc] init];
    textViewContent.frame = CGRectMake(0, 0, WIDTH, HEIGHT-64);
    [self.view addSubview:textViewContent];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationtitle setText:@"添加回复"];
    [self.leftbarbtn setTitle:@"后退" forState:UIControlStateNormal];
    [self.leftbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.leftbarbtn addTarget:self action:@selector(toback) forControlEvents:UIControlEventTouchUpInside];
    
    [self.rightbarbtn setTitle:@"提交" forState:UIControlStateNormal];
    [self.rightbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.rightbarbtn addTarget:self action:@selector(toReply) forControlEvents:UIControlEventTouchUpInside];
    
}


- (void)toback{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)toReply{
    
    if ([textViewContent.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"内容不能为空" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert performSelectorOnMainThread: @selector(show) withObject: nil waitUntilDone: YES];
    }
    else{
        
        
    }
}
@end
