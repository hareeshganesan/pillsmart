//
//  MedicationInfoViewController.m
//  PillSmart
//
//  Created by Hareesh Ganesan on 11/15/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import "MedicationInfoViewController.h"
#import "CMUserDrug.h"
#import <CloudMine/CloudMine.h>

@interface MedicationInfoViewController ()

@end

@implementation MedicationInfoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    times = [[NSMutableArray alloc] init];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)saveDrug:(id)sender{
    //Begin saving drug
    NSLog(@"begin saving drug");
    
    CMStore *store = [CMStore defaultStore];
    
    CMUserDrug *drug = [[CMUserDrug alloc] init];
    drug.drugName = drugnameField.text;
    drug.dosage = dosageField.text;
    drug.times = times;
    drug.notes = notesField.text;
    
    
    [drug scheduleAlarm];
    

    [drug saveWithUser:store.user callback:^(CMObjectUploadResponse *response) {
        NSLog(@"Status: %@", [response.uploadStatuses objectForKey:drug.objectId]);
    }];
    
}

- (IBAction)saveTime:(id)sender{
    NSDateFormatter *outputFormatter = [[NSDateFormatter alloc] init];
    [outputFormatter setDateFormat:@"h:mm a"];
    
    NSDate *test = timeField.date;
    NSString *text = [outputFormatter stringFromDate:test];
    
    NSLog(@"Saving time: %@", text);
    [times addObject:timeField.date];
    
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return NO;
}


@end
