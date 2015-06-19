//
//  AppDelegate.m
//  WenWeiBoTest
//
//  Created by wgl7569 on 15-1-29.
//  Copyright (c) 2015年 wgl7569. All rights reserved.
//

#import "AppDelegate.h"
#import "WTabBarController.h"
#import "WAudioTool.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]init];
    self.window.frame = [UIScreen mainScreen].bounds;
    WTabBarController *wt = [[WTabBarController alloc]init];
    self.window.rootViewController =wt;
    [self.window makeKeyAndVisible];
    WAudioTool *wdt1 = [WAudioTool sharedWAudioTool];
    WAudioTool *wdt2 = [WAudioTool sharedWAudioTool];
    WAudioTool *wdt3 = [WAudioTool sharedWAudioTool];
    NSDictionary *dict = [[NSDictionary alloc]initWithObjectsAndKeys:@"1",@"2", nil];
    NSMutableDictionary *dict1 = [[NSMutableDictionary alloc]initWithDictionary:dict];
    NSLog(@"dict= %@",dict);
    NSLog(@"dict1= %@",dict1);
    [self testDict:dict];
    [self testMutableDict:dict1];
    NSLog(@"dict= %@",dict);
    NSLog(@"dict1= %@",dict1);
    NSLog(@"wdt1 = \n%@wdt2 = \n%@wdt3 = %@",wdt1,wdt2,wdt3);
    return YES;
}
-(void)testMutableDict:(NSMutableDictionary *)dict{
    [dict setObject:@"2" forKey:@"222222222"];;
}
-(void)testDict:(NSDictionary *)dict{
    dict = nil;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
