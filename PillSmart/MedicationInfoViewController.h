//
//  MedicationInfoViewController.h
//  PillSmart
//
//  Created by Hareesh Ganesan on 11/15/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MedicationInfoViewController : UIViewController
{
    
    IBOutlet UITextField *drugnameField;
    IBOutlet UITextView *notesField;
    IBOutlet UITextField *dosageField;
    IBOutlet UIDatePicker *timeField;
    NSMutableArray *times;
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField;
- (IBAction)saveDrug:(id) sender;
- (IBAction)saveTime:(id) sender;

@end
