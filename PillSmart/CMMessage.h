//
//  CMMessage.h
//  PillSmart
//
//  Created by Hareesh Ganesan on 1/11/14.
//  Copyright (c) 2014 Hareesh Ganesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CloudMine/CloudMine.h>

@interface CMMessage : CMObject


@property (strong) NSString *sender;
@property (strong) NSString *receiver;
@property (strong) NSString *message;
@property (strong) NSDate *timestamp;


@end
