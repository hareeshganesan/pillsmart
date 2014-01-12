//
//  UserInfoViewController.h
//  PillSmart
//
//  Created by Hareesh Ganesan on 10/23/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CMAppUser.h"

@interface UserInfoViewController : UIViewController
{
    IBOutlet UITextField *firstnameField;
    IBOutlet UITextField *lastnameField;
    IBOutlet UITextField *emailField;
    IBOutlet UITextField *passwordField;
    IBOutlet UIButton *submitButton;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
- (IBAction)createUser:(id)sender;

@end
