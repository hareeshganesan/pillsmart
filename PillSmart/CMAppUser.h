//
//  CMAppUser.h
//  PillSmart
//
//  Created by Hareesh Ganesan on 11/1/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import <CloudMine/CloudMine.h>



@interface CMAppUser : CMUser

@property (strong) NSString *firstname;
@property (strong) NSString *lastname;
@property (strong) NSMutableArray *userList;



- (void)resetState;

@end
