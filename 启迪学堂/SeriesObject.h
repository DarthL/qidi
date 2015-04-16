//
//  SeriesObject.h
//  启迪学堂
//
//  Created by 梁伟 on 15/4/16.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SeriesObject : NSObject
@property(nonatomic,strong) NSString *topic;
@property(nonatomic,strong) NSString *teacherName;
@property(nonatomic,strong) NSString *goal;
@property(nonatomic,strong) NSString *suitablePeople;
@property(nonatomic,strong) NSMutableArray *microLessons;
@property(nonatomic,assign) int numOfStu;
@end
