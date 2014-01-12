//
//  CMMessage.m
//  PillSmart
//
//  Created by Hareesh Ganesan on 1/11/14.
//  Copyright (c) 2014 Hareesh Ganesan. All rights reserved.
//

#import "CMMessage.h"

@interface CMMessage ()

@end

@implementation CMMessage


@synthesize sender = _sender;
@synthesize receiver = _receiver;
@synthesize timestamp = _timestamp;
@synthesize message = _message;


- (id)initWithCoder:(NSCoder *)coder {
    if(self = [super initWithCoder:coder]) {
        self.sender = [coder decodeObjectForKey:@"sender"];
        self.receiver = [coder decodeObjectForKey:@"receiver"];
        self.timestamp = [coder decodeObjectForKey:@"timestamp"];
        self.message = [coder decodeObjectForKey:@"message"];
    }
    
    return self;
}

- (void)encodeWithCoder:(NSCoder *)coder {
    [super encodeWithCoder:coder];
    [coder encodeObject:_sender forKey:@"sender"];
    [coder encodeObject:_receiver forKey:@"receiver"];
    [coder encodeObject:_timestamp forKey:@"timestamp"];
    [coder encodeObject:_message forKey:@"message"];
}


@end
