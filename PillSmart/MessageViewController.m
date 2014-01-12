//
//  MessageViewController.m
//  PillSmart
//
//  Created by Hareesh Ganesan on 1/11/14.
//  Copyright (c) 2014 Hareesh Ganesan. All rights reserved.
//

#import "MessageViewController.h"
#import "CMMessage.h"
#import <CloudMine/CloudMine.h>
#import "CMAppUser.h"

@interface MessageViewController ()

@end

@implementation MessageViewController


- (IBAction)sendMessage:(id)sender
{
    CMStore *store = [CMStore defaultStore];
    
    CMMessage *msg = [[CMMessage alloc] init];
    msg.sender = store.user.username;
    msg.receiver = username.text;
    msg.message = messageToSend.text;
    [store saveObject:msg additionalOptions:nil callback:^(CMObjectUploadResponse *response) {
        NSLog([NSString stringWithFormat:@"message store: %@",msg.message]);
    }];
}

-(IBAction)refreshMessages:(id)sender
{
    CMStore *store = [CMStore defaultStore];
    
    NSString *searchQuery = @"[sender=\"";
    __block NSString *messageLog = @"";
    searchQuery = [[searchQuery stringByAppendingString:store.user.username] stringByAppendingString:@"\"]"];
    //searchQuery = [searchQuery stringByAppendingString:username.text];
    [store searchObjects:searchQuery additionalOptions:nil callback:^(CMObjectFetchResponse *response) {
        //loop through messages and create query string
        NSArray *objects = response.objects;
        for(CMMessage *msg in objects)
        {
            messageLog = [messageLog stringByAppendingString:[NSString stringWithFormat:@"%@ %@ %@ %@",msg.sender, @" : ", msg.message, @"\n"]];
        }
        messageView.text = messageLog;
    }];
}

     



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
