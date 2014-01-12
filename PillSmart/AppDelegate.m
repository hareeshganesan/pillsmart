//
//  AppDelegate.m
//  PillSmart
//
//  Created by Hareesh Ganesan on 10/23/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import "AppDelegate.h"
#import <CloudMine/CloudMine.h>
#import <CloudMine/CMUser.h>
#import "CMUserDrug.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    CMAPICredentials *credentials = [CMAPICredentials sharedInstance];
    credentials.appIdentifier = @"a6ffd126fd9540f58e30e23da6402247";
    credentials.appSecret = @"1BBE6C8F135448FF8CB2B9E8C6743C06";
    
    [CMUser allUsersWithCallback:^(NSArray *users, NSDictionary *errors) {
        NSLog(@"Users: %@", users);
    }];
    
    return YES;
}


- (void)application:(UIApplication *)application didReceiveLocalNotification:(UILocalNotification *)notif {
    NSLog(@"application: didReceiveLocalNotification:");
    NSString *itemName = @"";
    NSString *messageTitle = notif.alertBody;

    [self _showAlert:itemName withTitle:messageTitle];
    NSLog(@"Receive Local Notification while the app is still running...");
    NSLog(@"current notification is %@",notif);
    application.applicationIconBadgeNumber = notif.applicationIconBadgeNumber-1;
    
}



- (void) _showAlert:(NSString*)pushmessage withTitle:(NSString*)title
{
    UIAlertView* alertView = [[UIAlertView alloc] initWithTitle:title message:pushmessage delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alertView show];
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}



@end
