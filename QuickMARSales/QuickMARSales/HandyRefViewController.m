//
//  HandyRefViewController.m
//  QuickMARSales
//
//  Created by Dalton on 10/12/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "HandyRefViewController.h"
#import "Appearance.h"

@interface HandyRefViewController () <checkBoxTappedDelegate>
@property (nonatomic, strong) NSArray *optionsList;

@end

@implementation HandyRefViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Appearance initializeAppearanceDefaults];

    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = YES;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.optionsList= [[NSArray alloc] initWithObjects: @"Request A Demo", @"Request A Training", @"Hardware Requirements", @"Order Materials", @"View Training Materials", @"Sample Project Plan",  @"QuickMAR University", @"News", @"Brochure", @"Fact Sheet", @"I bought QuickMAR. Now what?", nil];

    
    PFUser *currentUser = [PFUser currentUser];
    if (!currentUser) { // No user logged in
        
        // parse log in
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
        [logInViewController setDelegate:self];
        [logInViewController setFields:PFLogInFieldsUsernameAndPassword
         | PFLogInFieldsSignUpButton
         | PFLogInFieldsLogInButton
         | PFLogInFieldsUsernameAndPassword];
        
        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
        [signUpViewController setDelegate:self];
        [signUpViewController setFields:PFSignUpFieldsUsernameAndPassword
         | PFSignUpFieldsSignUpButton];
        
        [logInViewController setSignUpController:signUpViewController];
        
        [self presentViewController:logInViewController animated:YES completion:^{
            
            // nothing
        }];
    
    }
    
    self.cancelButton.enabled = NO;
    self.sendButton.enabled = NO;
    
    self.tableView.allowsMultipleSelection = NO;

}


#pragma mark - Table view data source and delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.optionsList.count;
}


- (CustomHandyRefCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomHandyRefCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.label.text = [self.optionsList objectAtIndex:indexPath.row];
    cell.checkBox.hidden = YES;
    cell.checkBoxDelegate = self;
    cell.indexPath = indexPath;
    // unhide this when the mail button is tapped
    
    
    return cell;
}





-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        // demo request form
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    } else if (indexPath.row == 1) {
        
        // training request form
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

    } else if (indexPath.row == 2) {
        
        // hardware requirements form
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

    } else if (indexPath.row == 3) {
        
        // materials order form
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

    } else if (indexPath.row == 4) {
        
        // training materials link
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

    } else if (indexPath.row == 5) {
        
        // sample project plan
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

    } else if (indexPath.row == 6) {
        
        // quickmar university
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

    } else if (indexPath.row == 7) {
        
        // news
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

    } else if (indexPath.row == 8) {
        
        // brochure
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

    } else if (indexPath.row == 9) {
        
        // fact sheet
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

    } else if (indexPath.row == 10) {
        
        //now what?
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

    }
}



- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{

    return @"Tap the mail button to send materials to a friend";
}




#pragma mark - events

- (IBAction)mailButtonTapped:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:@"Check the materials you would like to send" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
    // send notification to cell to show the check box button
    [[NSNotificationCenter defaultCenter] postNotificationName:mailButtonTappedNotificationKey object:nil userInfo:nil];

    
    // show cancel button
    self.cancelButton.enabled = YES;
    
    // disable mail button
    self.mailButton.enabled = NO;
    
    // multiple selection
    self.tableView.allowsMultipleSelection = YES;
    
    self.sendButton.enabled = YES;
    
    self.tableView.allowsMultipleSelection = YES;

    
    
}

- (IBAction)cancelButtonTapped:(id)sender {
    
    
    // send notification to cell to hide check box button
    [[NSNotificationCenter defaultCenter] postNotificationName:cancelButtonTappedNotificationKey object:nil userInfo:nil];

    
    // disallow multiple selection
    self.tableView.allowsMultipleSelection = NO;
    
    // disable cancel button again
    self.cancelButton.enabled = NO;
    
    // enable mail button again
    self.mailButton.enabled = YES;
    
    // disable send button
    self.sendButton.enabled = NO;
    
    self.tableView.allowsMultipleSelection = NO;

}


#pragma mark - mfmailcompose delegate methods

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



#pragma mark - login delegate methods

// Sent to the delegate to determine whether the log in request should be submitted to the server.
- (BOOL)logInViewController:(PFLogInViewController *)logInController shouldBeginLogInWithUsername:(NSString *)username password:(NSString *)password {
    // Check if both fields are completed
    if (username && password && username.length != 0 && password.length != 0) {
        return YES; // Begin login process
    }
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Missing information" message:@"Make sure you fill out all of the information!" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
    return NO; // Interrupt login process
}



- (void)logInViewController:(PFLogInViewController *)logInController didLogInUser:(PFUser *)user {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


// for when the login attempt fails
- (void)logInViewController:(PFLogInViewController *)logInController didFailToLogInWithError:(NSError *)error {
    NSLog(@"Failed to log in...");
}

// For when the login view is dismissed
- (void)logInViewControllerDidCancelLogIn:(PFLogInViewController *)logInController {
    //[self.navigationController popViewControllerAnimated:YES];
}




#pragma mark - signup delegate methods

- (BOOL)signUpViewController:(PFSignUpViewController *)signUpController shouldBeginSignUp:(NSDictionary *)info {
    BOOL informationComplete = YES;
    
    // loop through all of the submitted data
    for (id key in info) {
        NSString *field = [info objectForKey:key];
        if (!field || field.length == 0) { // check completion
            informationComplete = NO;
            break;
        }
    }
    
    // Display an alert if a field wasn't completed
    if (!informationComplete) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Missing information" message:@"Make sure you fill out all of the information!" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil]];
        
        [self presentViewController:alert animated:YES completion:nil];

    }
    
    return informationComplete;
}


- (void)signUpViewController:(PFSignUpViewController *)signUpController didSignUpUser:(PFUser *)user {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


- (void)signUpViewController:(PFSignUpViewController *)signUpController didFailToSignUpWithError:(NSError *)error {
    NSLog(@"Failed to sign up...");
}



- (void)signUpViewControllerDidCancelSignUp:(PFSignUpViewController *)signUpController {
    NSLog(@"User dismissed the signUpViewController");
}



#pragma mark - custom delegate methods

-(void)checkBoxTapped:(NSIndexPath *)indexPath {
    

    // add this index path to the array (this doesn't seem to be working)
    [self.selectedCells addObject:[NSNumber numberWithInteger:indexPath.row]];

    NSLog(@"Adding %@", [NSNumber numberWithInteger:indexPath.row]);
    
    // the array is nil, even though we are getting the indexPath.rows in the above log
    NSLog(@"Selected Cells:\n%@", self.selectedCells);
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if ([segue.identifier isEqualToString:@"showSendTo"]) {
        UINavigationController *navController = [segue destinationViewController];
        ContactsTableViewController *SendToVC = navController.viewControllers.firstObject;
        
        self.selectedCells = SendToVC.selectedCellsFromPreviousVC;
    }
}

@end
