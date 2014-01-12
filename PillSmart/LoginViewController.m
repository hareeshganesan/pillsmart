//
//  LoginViewController.m
//  PillSmart
//
//  Created by Hareesh Ganesan on 10/23/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import "LoginViewController.h"
#import <CloudMine/CMUser.h>
#import <CloudMine/CMStore.h>
#import "CMUserDrug.h"
@interface LoginViewController ()

@end

@implementation LoginViewController

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

- (void)login:(id)sender{
    NSLog(@"Begin login method");
    //pull username and password
    CMStore *store = [CMStore defaultStore];

    CMUser *user = [[CMUser alloc] initWithUsername:usernameField.text andPassword:passwordField.text];
    
    [user loginWithCallback:^(CMUserAccountResult resultCode, NSArray *messages) {
        switch(resultCode) {
            case CMUserAccountLoginSucceeded:
                // success! the user now has a session token
                NSLog(@"login: user is successfully logged in");
                status.text = @"Success!";
                //programmatically trigger segue
                [self performSegueWithIdentifier:@"PostLoginSegue" sender:self];
                break;
            case CMUserAccountLoginFailedIncorrectCredentials:
                // the users credentials were invalid
                NSLog(@"login: invalid credentials");
                //change status field
                status.text = @"We couldn't recognize your username/password combination.";
                break;
            case CMUserAccountOperationFailedUnknownAccount:
                // this account doesn't exist
                NSLog(@"login: create new account");
                status.text = @"Looks like you don't have an account yet. Try hitting sign up!";
                break;
        }
    }];
    
    // Set the user property on CMStore. This user will be used for all user-level calls from this point on.
    store.user = user;
    
        

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}


@end
