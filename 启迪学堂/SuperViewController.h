//
//  SuperViewController.h
//  TheFlash
//
//  Created by 蒲石 on 15/1/27.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HandleTools.h"
//debug 输出
#define DEBUG_MODE
#ifdef DEBUG_MODE
#define DebugLog( s, ... ) NSLog( @"<%p %@:(%d)> %@", self, [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DebugLog( s, ... )
#endif
#define IPHONE5 ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(640,1136), [[UIScreen mainScreen] currentMode].size) : NO)//判断是否为iphone5
#define IOS7  (([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0)? YES:NO)
#define IOS8  (([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)? YES:NO)

#define CellChangeSelectedColor cell.selectionStyle = UITableViewCellSelectionStyleNone//cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];cell.selectedBackgroundView.backgroundColor =[UIColor clearColor]
//#define webAddress [NSString stringWithFormat:@"http://123.57.32.5:10010/manage/api/view.do?ranNum=%d&",arc4random()]
//#define webAddresspost @"http://123.57.32.5:10010/manage/api/view.do"
#define WIDTH self.view.frame.size.width
#define HEIGHT self.view.frame.size.height
#define KEY_WINDOW  [[UIApplication sharedApplication]keyWindow]
#define CellChangeSelectedColor cell.selectionStyle = UITableViewCellSelectionStyleNone//cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame];cell.selectedBackgroundView.backgroundColor =[UIColor clearColor]

#define WebAddress @"http://qdschool.eternesoft.com/api/"

@interface SuperViewController : UIViewController
@property(nonatomic,strong)NSString*rightbarimg;
@property(nonatomic,strong)UIButton*rightbarbtn;
@property(nonatomic,strong)NSString*leftbarimg;
@property(nonatomic,strong)UIButton*leftbarbtn;
@property(nonatomic,strong)UIImageView*navigationBarLeftImg;
@property(nonatomic,strong)UIImageView*navigationBarRightImg;
@property(nonatomic,strong)UILabel*navigationtitle;

@end
