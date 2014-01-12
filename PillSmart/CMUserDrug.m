//
//  CMUserDrug.m
//  PillSmart
//
//  Created by Hareesh Ganesan on 11/9/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import "CMUserDrug.h"

@implementation CMUserDrug

@synthesize drugName = _drugName;
@synthesize dosage = _dosage;
@synthesize notes = _notes;
@synthesize times = _times;


- (id)initWithCoder:(NSCoder *)coder {
    if(self = [super initWithCoder:coder]) {
        self.drugName = [coder decodeObjectForKey:@"drugName"];
        self.dosage = [coder decodeObjectForKey:@"dosage"];
        self.notes = [coder decodeObjectForKey:@"notes"];
        self.times = [coder decodeObjectForKey:@"times"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    [coder encodeObject:_drugName forKey:@"drugName"];
    [coder encodeObject:_dosage forKey:@"dosage"];
    [coder encodeObject:_notes forKey:@"notes"];
    [coder encodeObject:_times forKey:@"times"];
}

-(void) scheduleAlarm{
    
    for(NSDate *date in self.times)
        [self scheduleNotificationForDate:date];
}


/*
 Input: an array of arrays (UserDrugs)
            sub arrays are of NSDates
 Output: sorted list of UserDrugs by time
            order by time to the nearest dose after the current time
 Method: sort subarrays so the first element is the closest to the current time
         sort the UserDrugs by whichever is closest to the current time
         you have to use the compare by method to do it
 Stack:  sortedArrayByUsingComparator calls
            compareByTime with the first drug and the next
                pull the two arrays of date times
                sortedArrayByUsingComparator with Date function
                    compare dates difference to current time
                        let's say it's currently 14:00
                            i have one drug that needs to be taken at 1:00
                            one drug that needs to be taken at 16:00
                            one drug that needs to be taken at 5:00
                    return difference
                use comparator function to once again sort the first element from each
                return difference
 
 
 */
- (NSComparisonResult)compareByTime:(CMUserDrug *)otherObject {
    //take the difference between the current time and the time of the first object
    //find the closest current time
    //take the differene between the current time and the second object
    //compare them to each other
    
    self.times = [self.times sortedArrayUsingComparator:^NSComparisonResult(NSDate *obj1, NSDate *obj2){
        NSInteger diff1 = [self diffTime:[NSDate date] :obj1];
        NSInteger diff2 = [self diffTime:[NSDate date] :obj2];
        
        
        return diff2-diff1;
    }];
    
    otherObject.times = [otherObject.times sortedArrayUsingComparator:^NSComparisonResult(NSDate *obj1, NSDate *obj2){
        NSInteger diff1 = [self diffTime:[NSDate date] :obj1];
        NSInteger diff2 = [self diffTime:[NSDate date] :obj2];
        
        
        return diff1-diff2;
    }];
    
    return [self diffTime:self.times[0] :otherObject.times[0]];
}


- (NSInteger) diffTime:(NSDate *) aDate :(NSDate *) bDate{
    NSDateComponents *a = [self convertDatetoTime:aDate];
    NSDateComponents *b = [self convertDatetoTime:bDate];
    
    
    NSInteger aMinutes = [a hour]*60+[a minute];
    NSInteger bMinutes = [b hour]*60+[b minute];
    NSInteger diff = bMinutes-aMinutes;
    
    if(diff<0)
        return 3600+diff;
    else
        return diff;
}

- (NSDateComponents *) convertDatetoTime:(NSDate *)dateArg
{
    NSCalendar *gregorian = [[NSCalendar alloc]
                             initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *weekdayComponents =
    [gregorian components:(NSHourCalendarUnit |
                           NSMinuteCalendarUnit | NSSecondCalendarUnit) fromDate:dateArg];
    
    return weekdayComponents;
}


-(void) scheduleNotificationForDate: (NSDate*)date {
    
    /* Here we cancel all previously scheduled notifications */
    //[[UIApplication sharedApplication] cancelAllLocalNotifications];
    
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
    
    localNotification.fireDate = date;
    NSLog(@"Notification will be shown on: %@",localNotification.fireDate);
    
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    
    localNotification.alertBody = [@"Time to take " stringByAppendingFormat:@" %@ of %@", self.dosage, self.drugName];
    localNotification.alertAction = NSLocalizedString(@"View details", nil);
    localNotification.repeatInterval = NSDayCalendarUnit;

    NSDictionary *userInfo = [NSDictionary dictionaryWithObjectsAndKeys:self.drugName, @"DrugName", self.dosage, @"Dosage",self.notes, @"Notes", nil];
    
    localNotification.userInfo = userInfo;
    /* Here we set notification sound and badge on the app's icon "-1"
     means that number indicator on the badge will be decreased by one
     - so there will be no badge on the icon */
    
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.applicationIconBadgeNumber = -1;
    
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

@end
