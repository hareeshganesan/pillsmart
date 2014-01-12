//
//  DrugTableViewController.m
//  PillSmart
//
//  Created by Hareesh Ganesan on 11/16/13.
//  Copyright (c) 2013 Hareesh Ganesan. All rights reserved.
//

#import "DrugTableViewController.h"
#import <CloudMine/CloudMine.h>
#import "CMUserDrug.h"
#import "DrugInfoViewController.h"

@interface DrugTableViewController ()

@end

@implementation DrugTableViewController

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
    NSArray *subviews = [self.view subviews];
    
    UITableView *tableView = (UITableView *) subviews[0];
    
    CMStore *store = [CMStore defaultStore];
    
    [store allUserObjectsOfClass:[CMUserDrug class]
               additionalOptions:nil
                        callback:^(CMObjectFetchResponse *response) {
                            drugs = response.objects;
                            NSLog(@"Drugs: %@", response.objects);
                            [self sortDrugList:drugs];
                            [tableView reloadData];
                        }
     ];
}

- (void) sortDrugList:(NSArray *)drugList{
    drugs = [drugList sortedArrayUsingComparator:^NSComparisonResult(CMUserDrug *obj1, CMUserDrug *obj2) {
        return [obj1 compareByTime:obj2];
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [drugs count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *drugTableIdentifier = @"DrugTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:drugTableIdentifier];
    
    if (cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:drugTableIdentifier];
    }
    
    cell.textLabel.text = ((CMUserDrug *)[drugs objectAtIndex:indexPath.row]).drugName;
    
    return cell;
}


- (void) tableView: (UITableView *)aTableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    DrugInfoViewController *drugController = [self.storyboard instantiateViewControllerWithIdentifier:@"drugInfo"];
    CMUserDrug *drug = [drugs objectAtIndex:indexPath.row];
    
    [drugController setDrug:drug];
    
    [[self navigationController] pushViewController:drugController animated:YES];
    
    
}



@end
