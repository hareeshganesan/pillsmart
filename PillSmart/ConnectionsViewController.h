//
//  FirstViewController.h
//  PillSmart
//
//  Created by Hareesh Ganesan on 10/23/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConnectionsViewController : UIViewController
{
    IBOutlet UIButton *finishButton;
    IBOutlet UIButton *addButton;
    IBOutlet UITextField *email;
    IBOutlet UILabel *status;
}


- (IBAction)addConnection:(id)sender;
- (IBAction)switchToMain:(id)sender;
- (BOOL)textFieldShouldReturn:(UITextField *)textField;


@end
