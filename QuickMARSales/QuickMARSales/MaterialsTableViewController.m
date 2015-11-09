//
//  MaterialsTableViewController.m
//  QuickMARSales
//
//  Created by Dalton on 11/3/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "MaterialsTableViewController.h"
#import "Appearance.h"

@interface MaterialsTableViewController ()

@end

@implementation MaterialsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Appearance initializeAppearanceDefaults];

    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.optionsList= [[NSArray alloc] initWithObjects: @"Request A Demo", @"Request A Training", @"Hardware Requirements", @"Order Materials", @"View Training Materials", @"Sample Project Plan",  @"QuickMAR University", @"News", @"Brochure", @"Fact Sheet", @"I bought QuickMAR. Now what?", nil];
    

    self.tableView.allowsMultipleSelection = YES;
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.optionsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"materialsCell" forIndexPath:indexPath];
    
        // Configure the cell...
        cell.textLabel.text = [self.optionsList objectAtIndex:indexPath.row];
    
    return cell;
}


#pragma mark - tableView delegate


-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    
    return @"Check the materials you would like to send";
    
}



#pragma mark - events

- (IBAction)cancelTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)sendTapped:(id)sender {
    
    // send notification to CRMTableVC to launch mailcompose vc

    
    [self dismissViewControllerAnimated:YES completion:^{
            [[NSNotificationCenter defaultCenter]postNotificationName:MaterialsSelectedNotificationKey object:nil];
    }];
    
}



#pragma mark - message compose delegate methods

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
