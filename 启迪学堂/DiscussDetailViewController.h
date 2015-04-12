//
//  DiscussDetailViewController.h
//  启迪学堂
//
//  Created by DarthL on 15/4/11.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SuperViewController.h"
@interface DiscussDetailViewController : SuperViewController<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) NSString *topic;
@property(nonatomic,strong) NSString *author;
@property(nonatomic,strong) NSString *timeString;
@property(nonatomic,strong) UIImage *profile;
@property(nonatomic,strong) NSString *content;
@property(nonatomic,assign) int readNumber;
@property(nonatomic,assign) int replyNumber;
@end
