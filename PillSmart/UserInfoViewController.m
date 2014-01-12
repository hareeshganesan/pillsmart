//
//  UserInfoViewController.m
//  PillSmart
//
//  Created by Hareesh Ganesan on 10/23/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.


#import "UserInfoViewController.h"
#import "CMAppUser.h"
#import "CMUserDrug.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

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


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}

-(IBAction)createUser:(id)sender{
    NSLog(@"begin user synthesis");
    
    NSString *username = emailField.text;
    NSString *password = passwordField.text;
    //Sanitize username and password
    //create user object
    CMAppUser *user = [[CMAppUser alloc] initWithUsername:username andPassword:password];
    
    user.firstname = firstnameField.text;
    user.lastname = lastnameField.text;
    user.email = emailField.text;
    
    [user createAccountWithCallback:^(CMUserAccountResult resultCode, NSArray *messages) {
        switch(resultCode) {
            case CMUserAccountCreateSucceeded:
                NSLog(@"signup: account creation succeeded");
                // did it!
                break;
            case CMUserAccountCreateFailedInvalidRequest:
                // forgot the email/username or password
                break;
            case CMUserAccountCreateFailedDuplicateAccount:
                // account with this email already exists
                NSLog(@"signup: account not created because username and password already exist");
                break;
        }
    }];
    
    CMStore *store = [CMStore defaultStore];
    store.user=user;
}


@end
