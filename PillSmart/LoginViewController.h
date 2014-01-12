//
//  LoginViewController.h
//  PillSmart
//
//  Created by Hareesh Ganesan on 10/23/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoginViewController : UIViewController
{
    NSString *username;
    NSString *password;
    
    IBOutlet UITextField *usernameField;
    IBOutlet UITextField *passwordField;
    IBOutlet UILabel *status;
}

- (IBAction)login:(id)sender;
- (IBAction)signup:(id)sender;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;

@end
