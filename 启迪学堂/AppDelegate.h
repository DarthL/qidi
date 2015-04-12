//
//  AppDelegate.h
//  启迪学堂
//
//  Created by 蒲石 on 15/4/3.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "CourseViewController.h"
#import "MineViewController.h"
#import "DiscussionViewController.h"
#import "CommunicationViewController.h"
#import "WelcomeViewController.h"
#import "Model.h"
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;


@property(strong,nonatomic)UINavigationController*comnavigation;
@property(strong,nonatomic)UINavigationController*coursenavigation;
@property(strong,nonatomic)UINavigationController*discnavigation;
@property(strong,nonatomic)UINavigationController*minenavigation;
@property(strong,nonatomic)UINavigationController*welcomenavigation;

@property(strong,nonatomic)CourseViewController*courseview;
@property(strong,nonatomic)MineViewController*mineview;
@property(strong,nonatomic)DiscussionViewController*discview;
@property(strong,nonatomic)CommunicationViewController*comview;
@property(strong,nonatomic)WelcomeViewController*welcomeview;

@property(strong, nonatomic) UITabBarController *tabbar;

@property(strong,nonatomic)MeInfo*meInfo;
//@property(assign,nonatomic)BOOL loginflag;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;


@end

