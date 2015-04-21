//
//  HandleTools.h
//  shitu
//
//  Created by 蒲石 on 15/1/21.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Reachability.h"
#import "ASIHTTPRequest.h"
@interface HandleTools : NSObject
+(UIColor*)colorStringToInt:(NSString *)color;
+(BOOL)checkNetWork;
+(NSDictionary*)AsiGetSync:(NSString*)strURL;
+(id)diction2Bean:(NSDictionary*)dic bean:(id)abean;
+(BOOL) IsEnableWIFI;
+(NSString*)md5:(NSString*)strURL;//md5加密过程
+(NSString *) utf8ToUnicode:(NSString *)string;


@end
