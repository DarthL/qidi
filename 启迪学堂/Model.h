//
//  Model.h
//  启迪学堂
//
//  Created by 蒲石 on 15/4/9.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Model : NSObject

@end
@interface MeInfo : NSObject
@property(nonatomic,strong)NSString* nickName;
@property(nonatomic,strong)NSString* userId;
@property(nonatomic,strong)NSString*headImg;

@end