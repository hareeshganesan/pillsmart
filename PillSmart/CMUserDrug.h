//
//  CMUserDrug.h
//  PillSmart
//
//  Created by Hareesh Ganesan on 11/9/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import <CloudMine/CloudMine.h>

@interface CMUserDrug : CMObject

@property (strong) NSString *drugName;
@property (strong) NSString *dosage;
@property (strong) NSArray *times;
@property (strong) NSString *notes;


-(void) scheduleAlarm;
-(void) scheduleNotificationForDate: (NSDate*)date;
- (NSComparisonResult)compareByTime:(CMUserDrug *)otherObject;

@end
