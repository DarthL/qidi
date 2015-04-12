//
//  CommentObject.m
//  启迪学堂
//
//  Created by DarthL on 15/4/11.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "CommentObject.h"

@implementation CommentObject
@synthesize nickName = _nickName;
@synthesize profileImage = _profileImage;
@synthesize commentBody = _commentBody;
@synthesize commentDate = _commentDate;

-(id)initWithDict:(NSDictionary *)dic{

    self = [super init];
    if (self) {
        _nickName = [dic objectForKey:@"NICKNAME"];
        _profileImage = [dic objectForKey:@"PROFILE"];
        _commentDate = [dic objectForKey:@"DATE"];
        _commentBody = [dic objectForKey:@"COMMENT"];
        
    }
    return self;
}

@end
