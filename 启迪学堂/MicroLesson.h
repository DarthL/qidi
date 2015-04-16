//
//  MicroLesson.h
//  启迪学堂
//
//  Created by 梁伟 on 15/4/16.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MicroLesson : NSObject
@property(nonatomic,strong) NSString *topic;
@property(nonatomic,strong) NSString *teacherName;
@property(nonatomic,strong) NSString *instruction;
@property(nonatomic,strong) NSMutableArray *comments;
@property(nonatomic,assign) BOOL isFree;
@property(nonatomic,assign) float score;
@property(nonatomic,assign) BOOL isLearned;
@property(nonatomic,assign) BOOL isFaviourate;
@property(nonatomic,strong) NSString *note;
@property(nonatomic,strong) NSString *videoURL;
@end
