//
//  NewTopicViewController.m
//  启迪学堂
//
//  Created by DarthL on 15/4/11.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "NewTopicViewController.h"

@interface NewTopicViewController ()
{
    UITextView *textViewContent;
}
@end

@implementation NewTopicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    textViewContent = [[UITextView alloc] init];
    textViewContent.frame = CGRectMake(0, 0, WIDTH, HEIGHT-64);
    [self.view addSubview:textViewContent];
    
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationtitle setText:@"发起话题"];
    [self.leftbarbtn setTitle:@"后退" forState:UIControlStateNormal];
    [self.leftbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.leftbarbtn addTarget:self action:@selector(toback) forControlEvents:UIControlEventTouchUpInside];
    
    [self.rightbarbtn setTitle:@"提交" forState:UIControlStateNormal];
    [self.rightbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.rightbarbtn addTarget:self action:@selector(toSubmit) forControlEvents:UIControlEventTouchUpInside];
    
}

-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    
}

- (void)toback{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)toSubmit{
    
    if ([textViewContent.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"内容不能为空" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert performSelectorOnMainThread: @selector(show) withObject: nil waitUntilDone: YES];
    }
    else{
    
        
    }
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
