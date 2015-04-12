//
//  writeNoteViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/8.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "writeNoteViewController.h"

@interface writeNoteViewController ()
{
    UITextView*textview;
}
@end

@implementation writeNoteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerForKeyboardNotifications];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    textview=[[UITextView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, HEIGHT-64)];
    [textview becomeFirstResponder];
    [self.view addSubview:textview];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.leftbarbtn setTitle:@"后退" forState:UIControlStateNormal];
    [self.leftbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.leftbarbtn addTarget:self action:@selector(toback) forControlEvents:UIControlEventTouchUpInside];
    
    [self.rightbarbtn setTitle:@"发送" forState:UIControlStateNormal];
    [self.rightbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.rightbarbtn addTarget:self action:@selector(toback) forControlEvents:UIControlEventTouchUpInside];

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
- (void) registerForKeyboardNotifications
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWasShown:) name:UIKeyboardDidShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter]  addObserver:self selector:@selector(keyboardWasHidden:) name:UIKeyboardDidHideNotification object:nil];
}
- (void) keyboardWasShown:(NSNotification *) notif
{
    NSDictionary *info = [notif userInfo];
    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    CGRect frame=textview.frame;
    frame.size.height=HEIGHT-keyboardSize.height;
    textview.frame=frame;

//    NSLog(@"keyBoard:%f", keyboardSize.height);  //216
    ///keyboardWasShown = YES;
}
- (void) keyboardWasHidden:(NSNotification *) notif
{
    NSDictionary *info = [notif userInfo];
    
    NSValue *value = [info objectForKey:UIKeyboardFrameBeginUserInfoKey];
    CGSize keyboardSize = [value CGRectValue].size;
    CGRect frame=textview.frame;
    frame.size.height=HEIGHT-keyboardSize.height;
    textview.frame=frame;
//    NSLog(@"keyboardWasHidden keyBoard:%f", keyboardSize.height);
    // keyboardWasShown = NO;
    
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
