//
//  CommentObject.h
//  启迪学堂
//
//  Created by DarthL on 15/4/11.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface CommentObject : NSObject
@property(nonatomic,strong) NSString *nickName;
@property(nonatomic,strong) NSString *commentBody;
@property(nonatomic,strong) NSString *commentDate;
@property(nonatomic,strong) UIImage *profileImage;

-(id)initWithDict:(NSDictionary *)dic;

@end
