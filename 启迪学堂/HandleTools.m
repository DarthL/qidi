//
//  HandleTools.m
//  shitu
//
//  Created by 蒲石 on 15/1/21.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "HandleTools.h"
#import "AppDelegate.h"
@implementation HandleTools
+(UIColor*)colorStringToInt:(NSString *)color
{
    //    const char *cstr;
    //    int iPosition = 0;
    //    int nColor = 0;
    //    cstr = [colorStrig UTF8String];
    //
    //    //判断是否有#号
    //    if (cstr[0] == '#') iPosition = 1;//有#号，则从第1位开始是颜色值，否则认为第一位就是颜色值
    //    else iPosition = 0;
    //
    //    //第1位颜色值
    //    iPosition = iPosition + colorNo*2;
    //    if (cstr[iPosition] >= '0' && cstr[iPosition] < '9') nColor = (cstr[iPosition] - '0') * 16;
    //    else  nColor = (cstr[iPosition] - 'A' + 10) * 16;
    //
    //    //第2位颜色值
    //    iPosition++;
    //    if (cstr[iPosition] >= '0' && cstr[iPosition] < '9') nColor = nColor + (cstr[iPosition] - '0');
    //    else nColor = nColor + (cstr[iPosition] - 'A' + 10);
    //
    //    return nColor;
    NSString *cString = [[color stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]] uppercaseString];
    
    // String should be 6 or 8 characters
    if ([cString length] < 6) {
        return [UIColor clearColor];
    }
    
    // strip 0X if it appears
    if ([cString hasPrefix:@"0X"])
        cString = [cString substringFromIndex:2];
    if ([cString hasPrefix:@"#"])
        cString = [cString substringFromIndex:1];
    if ([cString length] != 6)
        return [UIColor clearColor];
    
    // Separate into r, g, b substrings
    NSRange range;
    range.location = 0;
    range.length = 2;
    
    //r
    NSString *rString = [cString substringWithRange:range];
    
    //g
    range.location = 2;
    NSString *gString = [cString substringWithRange:range];
    
    //b
    range.location = 4;
    NSString *bString = [cString substringWithRange:range];
    
    // Scan values
    unsigned int r, g, b;
    [[NSScanner scannerWithString:rString] scanHexInt:&r];
    [[NSScanner scannerWithString:gString] scanHexInt:&g];
    [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    return [UIColor colorWithRed:((float) r / 255.0f) green:((float) g / 255.0f) blue:((float) b / 255.0f) alpha:1.0f];
}
+(BOOL)checkNetWork
{
    Reachability *r = [Reachability reachabilityWithHostname:@"www.baidu.com"];
    return r.isReachable;
}

+(NSDictionary*)AsiGetSync:(NSString*)strURL
{
    NSURL*url=[NSURL URLWithString:strURL];
    ASIHTTPRequest*request=[ASIHTTPRequest requestWithURL:url];
    [request startSynchronous];
    NSLog(@"请求完成");
    NSError*error=[request error];
    if(!error)
    {
        NSData*data=[request responseData];
        NSString *result = [[NSString alloc] initWithData:data  encoding:NSUTF8StringEncoding];
        NSDictionary*dict=[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
        return dict;
        
        
    }else
    {
//        UIAlertView *alertview=[[UIAlertView alloc] initWithTitle:@"提示" message:@"抱歉，网络错误\n请检查网络"
//                                                         delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
//        //[alertview show];修复闪屏
//        [alertview performSelectorOnMainThread: @selector(show)
//                                    withObject: nil
//                                 waitUntilDone: YES];
        
        return nil;
    }
    
}

@end
