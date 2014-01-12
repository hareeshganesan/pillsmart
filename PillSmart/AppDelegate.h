//
//  AppDelegate.h
//  PillSmart
//
//  Created by Hareesh Ganesan on 10/23/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIWindow *window;
    UIBackgroundTaskIdentifier bgTask;
}
@property (strong, nonatomic) UIWindow *window;

@end
