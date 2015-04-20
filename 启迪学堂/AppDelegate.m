//
//  AppDelegate.m
//  启迪学堂
//
//  Created by 蒲石 on 15/4/3.
//  Copyright (c) 2015年 蒲石. All rights reserved.
//

#import "AppDelegate.h"
#import "UMSocial.h"
#import "EMSDKFull.h"
@interface AppDelegate ()

@end

@implementation AppDelegate
@synthesize comnavigation;
@synthesize coursenavigation;
@synthesize discnavigation;
@synthesize minenavigation;
@synthesize welcomenavigation;

@synthesize discview;
@synthesize mineview;
@synthesize comview;
@synthesize courseview;
@synthesize welcomeview;
@synthesize tabbar;

@synthesize meInfo;
//@synthesize loginflag;
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    
    [SMS_SDK registerApp:@"6df5d2d231f3" withSecret:@"7e4a70cd586689776bc316e02703ba5f"];
    
    [UMSocialData setAppKey:@"5526254dfd98c5938300021f"];
    
    {
//    环信注册
    NSString *apnsCertName = nil;
#if DEBUG
    apnsCertName = @"chatdemoui_dev";
#else
    apnsCertName = @"chatdemoui";
#endif
    [[EaseMob sharedInstance] registerSDKWithAppKey:@"easemob-demo#chatdemoui" apnsCertName:apnsCertName];
    }

    meInfo=[[MeInfo alloc]init];
    // Override point for customization after application launch.
    discview=[[DiscussionViewController alloc]init];
    mineview=[[MineViewController alloc]init];
    comview=[[CommunicationViewController alloc]init];
    courseview=[[CourseViewController alloc]init];
    welcomeview=[[WelcomeViewController alloc]init];
    comnavigation=[[UINavigationController alloc]initWithRootViewController:comview];
    minenavigation=[[UINavigationController alloc]initWithRootViewController:mineview];
    discnavigation=[[UINavigationController alloc]initWithRootViewController:discview];
    coursenavigation=[[UINavigationController alloc]initWithRootViewController:courseview];
    welcomenavigation=[[UINavigationController alloc]initWithRootViewController:welcomeview];
//    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    comnavigation.navigationBar.translucent=NO;
    minenavigation.navigationBar.translucent=NO;
    discnavigation.navigationBar.translucent=NO;
    coursenavigation.navigationBar.translucent=NO;
    welcomenavigation.navigationBar.translucent=NO;


    tabbar= [[UITabBarController alloc] init];
    [tabbar setViewControllers:@[comnavigation,coursenavigation,discnavigation,minenavigation]];
    tabbar.tabBar.translucent=NO;
    
//    if(loginflag)
//    self.window.rootViewController=tabbar;
//    else
    
    
        self.window.rootViewController=welcomenavigation;
//        self.window.rootViewController=tabbar;


    return YES;
}
//禁止横屏
- (NSUInteger)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    return UIInterfaceOrientationMaskPortrait;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    [[EaseMob sharedInstance] applicationDidEnterBackground:application];

}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    [[EaseMob sharedInstance] applicationWillEnterForeground:application];

}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
    [[EaseMob sharedInstance] applicationWillTerminate:application];

}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "pushi.____" in the application's documents directory.
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"____" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and return a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"____.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] init];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}

@end
