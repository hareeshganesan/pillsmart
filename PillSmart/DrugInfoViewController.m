//
//  DrugInfoViewController.m
//  PillSmart
//
//  Created by Hareesh Ganesan on 11/28/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import "DrugInfoViewController.h"

@implementation DrugInfoViewController

@synthesize drug;


- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [drugnameField setText:drug.drugName];
    [dosageField setText:drug.dosage];
    [notesField setText:drug.notes];
    
}


@end
