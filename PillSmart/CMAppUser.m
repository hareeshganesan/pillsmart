//
//  CMAppUser.m
//  PillSmart
//
//  Created by Hareesh Ganesan on 11/1/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import "CMAppUser.h"

@implementation CMAppUser
@synthesize firstname;
@synthesize lastname;


-(id) initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        firstname = [aDecoder decodeObjectForKey:@"firstname"];
        lastname = [aDecoder decodeObjectForKey:@"lastname"];
        self.email = [aDecoder decodeObjectForKey:@"email"];
    }
    
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:firstname forKey:@"firstname"];
    [aCoder encodeObject:lastname forKey:@"lastname"];
    [aCoder encodeObject:self.email forKey:@"email"];
    
}

-(void) resetState{
    NSLog(@"reset");
}

@end
