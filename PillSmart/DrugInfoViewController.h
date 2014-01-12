//
//  DrugInfoViewController.h
//  PillSmart
//
//  Created by Hareesh Ganesan on 11/28/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "CMUserDrug.h"
@interface DrugInfoViewController : UIViewController
{
    IBOutlet UITextField *drugnameField;
    IBOutlet UITextView *notesField;
    IBOutlet UITextField *dosageField;
}

@property (nonatomic, strong) CMUserDrug *drug;

@end
