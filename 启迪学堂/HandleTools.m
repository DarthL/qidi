//
//  HandleTools.m
//  shitu
//
//  Created by 蒲石 on 15/1/21.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "HandleTools.h"
#import "AppDelegate.h"
#import <objc/runtime.h>
#import <CommonCrypto/CommonDigest.h>

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
//把json树解析成实体bean
+(id)diction2Bean:(NSDictionary*)dic bean:(id)abean
{
    unsigned int outCount;
    objc_property_t *properties = class_copyPropertyList([abean class], &outCount);
    for(int i=0;i<outCount;i++)
    {
        objc_property_t property=properties[i];
        
        NSString *key=[NSString stringWithCString:property_getName(property) encoding:NSASCIIStringEncoding];
        
        id value=[dic objectForKey:key];
        if(value==nil)
        {
            //cannot found properties
            continue;
        }
        if([value isKindOfClass:[NSNull class]])
        {
            //null Object found for properties
            continue;
            
        }
        
        
        //根据不同的类型，生成对应的类
        NSString *types=[NSString stringWithCString:property_getAttributes(property)
                                           encoding:NSASCIIStringEncoding];
        NSString *clazz=nil;
        NSString *method=[NSString stringWithFormat:@"set%@%@:",
                          [[key substringToIndex:1] uppercaseString],
                          [key substringFromIndex:1]];
        if([types characterAtIndex:1]=='@')
        {
            clazz=[[types componentsSeparatedByString:@"\"" ]objectAtIndex:1];
        }
        if(clazz==nil)
        {
            [abean performSelector:NSSelectorFromString(method) withObject:value];
        }
        else if([clazz compare:@"NSString"options: NSCaseInsensitiveSearch]==NSOrderedSame)
        {
            [abean performSelector:NSSelectorFromString(method) withObject:value];
        }
        else if([clazz compare:@"NSNumber"options: NSCaseInsensitiveSearch]==NSOrderedSame)
        {
            [abean performSelector:NSSelectorFromString(method) withObject:value];
        }
        else if([clazz compare:@"NSArray"options: NSCaseInsensitiveSearch]==NSOrderedSame)
        {
            [abean performSelector:NSSelectorFromString(method) withObject:value];
        }
        // add by bhs 04.21
        else if ([clazz compare:@"NSMutableArray"options:NSCaseInsensitiveSearch]==NSOrderedSame)
        {
            [abean performSelector:NSSelectorFromString(method) withObject:value];
        }
        else
        {
            //set child prop
            id sub=[[NSClassFromString(clazz) alloc] init];
            
            [HandleTools diction2Bean:value bean:sub];
            
            [abean performSelector:NSSelectorFromString(method) withObject:sub];
            
        }
        
        
    }
    //    while ((key = [enumerator nextObject])) {
    //        // do something with object...
    //
    //    if([abean respondsToSelector: NSSelectorFromString(key)])
    //       {
    //        //   [abean properties]
    //           id value=[dic objectForKey:key];
    //       }
    //    }
    return abean;
}
+(BOOL) IsEnableWIFI{
    return([[Reachability reachabilityForLocalWiFi] currentReachabilityStatus] != NotReachable);
}

+(NSString*)md5:(NSString*)strURL//md5加密过程
{
    const char*cStr=[strURL UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}
+(NSString *) utf8ToUnicode:(NSString *)string

{
    
    NSUInteger length = [string length];
    
    NSMutableString *s = [NSMutableString stringWithCapacity:0];
    
    for (int i = 0;i < length; i++)
        
    {
        
        unichar _char = [string characterAtIndex:i];
        
        //判断是否为英文和数字
        
        if (_char <= '9' && _char >= '0')
            
        {
            
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i, 1)]];
            
        }
        
        else if(_char >= 'a' && _char <= 'z')
            
        {
            
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i, 1)]];
            
            
            
        }
        
        else if(_char >= 'A' && _char <= 'Z')
            
        {
            
            [s appendFormat:@"%@",[string substringWithRange:NSMakeRange(i, 1)]];
            
            
            
        }
        
        else
            
        {
            
            [s appendFormat:@"\\u%x",[string characterAtIndex:i]];
            
        }
        
    }
    
    return s;
    
}
@end

