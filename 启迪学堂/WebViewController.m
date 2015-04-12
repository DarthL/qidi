//
//  WebViewController.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/7.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "WebViewController.h"
@interface WebViewController ()<UIWebViewDelegate>
{
    UIImageView*indicatorViewbg;
    UIActivityIndicatorView*indicatorview;
    UIImageView*successindicatorview;
    UILabel*cominglabel;

}
@end

@implementation WebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor redColor];
    {
        
        UIWebView*webview=[[UIWebView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height-64)];
        webview.delegate=self;
        webview.userInteractionEnabled=YES;
        webview.opaque=YES;
        NSString* urlstring=[NSString stringWithFormat:@"http://www.baidu.com"];
        urlstring=[urlstring stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL*url=[NSURL URLWithString:urlstring];
        
        NSURLRequest*request=[NSURLRequest requestWithURL:url cachePolicy:NSURLRequestReloadRevalidatingCacheData timeoutInterval:40];
        [webview loadRequest:request];
        [webview setScalesPageToFit:YES];
        NSLog(@"webview ismain:%@",[[NSThread currentThread] isMainThread]?@"YES":@"NO");
        [self.view addSubview:webview];
    }
    [self addindicatorView];

}
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.leftbarbtn setTitle:@"后退" forState:UIControlStateNormal];
    [self.leftbarbtn setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [self.leftbarbtn addTarget:self action:@selector(toback) forControlEvents:UIControlEventTouchUpInside];
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


-(void)addindicatorView
{
    indicatorViewbg=[[UIImageView alloc]initWithFrame:CGRectMake(WIDTH/2-80/2, 120, 80, 60)];
    [indicatorViewbg setImage:[UIImage imageNamed:@"bg_pub_1"]];
    indicatorViewbg.alpha=0;
    [self.view addSubview:indicatorViewbg];
    
    indicatorview=[[UIActivityIndicatorView alloc]initWithFrame:CGRectMake(indicatorViewbg.frame.size.width/2-15/2.0, 10, 15, 15)];
    [indicatorview setActivityIndicatorViewStyle:UIActivityIndicatorViewStyleGray];//设置进度轮显示类型
    [indicatorViewbg addSubview:indicatorview];
    [indicatorview startAnimating];
    
    
    successindicatorview=[[UIImageView alloc]initWithFrame:indicatorview.frame];
    [successindicatorview setImage:[UIImage imageNamed:@"bg_pub_2"]];
    [indicatorViewbg addSubview:successindicatorview];
    
    cominglabel=[[UILabel alloc]initWithFrame:CGRectMake(indicatorViewbg.frame.size.width/2-150/2.0, indicatorview.frame.origin.y+indicatorview.frame.size.height+12, 150, 15)];
    cominglabel.backgroundColor=[UIColor clearColor];
    //    cominglabel.text=@"评论中...";
    cominglabel.textAlignment=UITextAlignmentCenter;
    cominglabel.font=[UIFont systemFontOfSize:13];
    [indicatorViewbg addSubview:cominglabel];
    
}
-(void)showindicatorView
{
    successindicatorview.alpha=0;
    indicatorview.alpha=1;
    indicatorViewbg.alpha=1;
    cominglabel.text=@"加载中...";
}
-(void)successindicatorview
{
    indicatorview.alpha=0;
    successindicatorview.alpha=1;
    indicatorViewbg.alpha=1;
    cominglabel.text=@"加载成功";
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    indicatorViewbg.alpha=0;
    [UIView commitAnimations];
    //    [indicatorViewbg removeFromSuperview];
    
}
-(void)faildindicatorview
{
    indicatorview.alpha=0;
    successindicatorview.alpha=1;
    indicatorViewbg.alpha=1;
    cominglabel.text=@"加载失败";
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:2];
    indicatorViewbg.alpha=0;
    [UIView commitAnimations];
    //    [indicatorViewbg removeFromSuperview];
    
}
-(void)removeindicatorViewbg
{
    [indicatorViewbg removeFromSuperview];
}
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [self showindicatorView];
}
-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [self successindicatorview];
}
-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    [self faildindicatorview];
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
