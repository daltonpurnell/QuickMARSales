//
//  ContactsTableViewController.m
//  QuickMARSales
//
//  Created by Dalton on 11/2/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "ContactsTableViewController.h"

@interface ContactsTableViewController ()

@end

@implementation ContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [PersonController sharedInstance].people.count;

}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    Person *person = [PersonController sharedInstance].people[indexPath.row];
    self.person = person;
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@", person.firstName, person.lastName];
    
    
    return cell;
}


- (IBAction)refreshButtonTapped:(id)sender {
    
    [self.tableView reloadData];
    
}
- (IBAction)sendButtonTapped:(id)sender {
    
    
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
