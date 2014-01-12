//
//  DrugTableViewController.h
//  PillSmart
//
//  Created by Hareesh Ganesan on 11/16/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CloudMine/CMUser.h>
#import "CMUserDrug.h"

@interface DrugTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>
{
    NSArray *tableData;
    NSArray *drugs;
}

- (void) sortDrugList:(NSArray *) drugList;

@end
