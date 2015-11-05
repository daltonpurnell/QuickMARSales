//
//  ContactsTableViewController.m
//  QuickMARSales
//
//  Created by Dalton on 11/2/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "ContactsTableViewController.h"
#import "Appearance.h"

@interface ContactsTableViewController ()

@end

@implementation ContactsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Appearance initializeAppearanceDefaults];

    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.tableView.allowsMultipleSelection = YES;
    
    
    // this is just for testing
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:[NSString stringWithFormat:@"%@", self.selectedCellsFromPreviousVC] preferredStyle:UIAlertControllerStyleAlert];
//    
//    [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil]];
//    
//    [self presentViewController:alert animated:YES completion:nil];

    
    
}

-(void)viewWillAppear:(BOOL)animated {
    
    [[PersonController sharedInstance]loadPeopleFromParse:^(NSError *error) {
        [self.tableView reloadData];
    }];
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
    cell.detailTextLabel.text = person.emailAddress;
    cell.imageView.image = [UIImage imageNamed:@"Unchecked Checkbox-32"];
    
    
    return cell;
}



-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    
    
    return @"Check the contacts you would like to send these materials to";
    
}




#pragma mark - events

- (IBAction)cancelButtonTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (IBAction)sendButtonTapped:(id)sender {

    
    // launch mfmailcompose
    MFMailComposeViewController *mailViewController = [MFMailComposeViewController new];
    mailViewController.mailComposeDelegate = self;
//    [mailViewController setToRecipients:[NSArray arrayWithObjects:[NSString stringWithFormat:@"%@", self.person.emailAddress], nil]];
  
//    [mailViewController setMessageBody:@"links" isHTML:NO];
    [self presentViewController:mailViewController animated:YES completion:nil];

}




#pragma mark - mail compose delegate method

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
