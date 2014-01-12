//
//  FirstViewController.m
//  PillSmart
//
//  Created by Hareesh Ganesan on 10/23/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import "ConnectionsViewController.h"
#import <CloudMine/CloudMine.h>
#import "CMAppUser.h"
@interface ConnectionsViewController ()
@end

@implementation ConnectionsViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)switchToMain:(id)sender
{
    [self performSegueWithIdentifier:@"signupToMain" sender:self];
}

-(IBAction)addConnection:(id)sender{
    //query cloudmine for a list of all user objects with a given e-mail
    //if null, create a guardian object for this new e-mail
    CMStore *store = [CMStore defaultStore];
    NSString *query =@"[email = \"";
    
    __block CMUser *existingUser = nil;
    
    
    query = [[query stringByAppendingString:email.text] stringByAppendingString:@"\"]"];
    [CMUser searchUsers:query
            callback:^(NSArray *users, NSDictionary *errors){
                NSLog(@"Users: %@", users);
                if([users count]>0)
                    existingUser = users[0]; //get the first user
                
                CMAppUser *currentUser = (CMAppUser *) store.user;
                if(existingUser==nil){
                    //create a user
                    status.text = @"Could not find user, please try again";
                }
                else{
                    [currentUser.userList addObject:existingUser];
                    NSLog(@"ConnectionsManager: User added");
                }
                
                return;
    }];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}


@end
