//
//  HandyRefViewController.m
//  QuickMARSales
//
//  Created by Dalton on 10/12/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "HandyRefViewController.h"

@interface HandyRefViewController ()
@property (nonatomic, strong) NSArray *optionsList;

@end

@implementation HandyRefViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.optionsList= [[NSArray alloc] initWithObjects: @"Request A Demo", @"Request A Training", @"Request Hardware", @"Order Materials", @"View Training Materials", @"Sample Project Plan",  @"QuickMAR University", @"News", @"Brochure", @"Fact Sheet", nil];

    
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
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.optionsList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = [self.optionsList objectAtIndex:indexPath.row];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        // demo request form
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        
    } else if (indexPath.row == 1) {
        
        // training request form
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        
    } else if (indexPath.row == 2) {
        
        // hardware request form
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        
    } else if (indexPath.row == 3) {
        
        // materials order form
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        
    } else if (indexPath.row == 4) {
        
        // training materials link
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        
    } else if (indexPath.row == 5) {
        
        // sample project plan
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        
    } else if (indexPath.row == 6) {
        
        // quickmar university
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        
    } else if (indexPath.row == 7) {
        
        // news
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        
    } else if (indexPath.row == 8) {
        
        // brochure
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        
    } else if (indexPath.row == 9) {
        
        // fact sheet
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.quickmar.com/"]];
        
    }
}



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
    
    [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                message:@"Make sure you fill out all of the information!"
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
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
        [[[UIAlertView alloc] initWithTitle:@"Missing Information"
                                    message:@"Make sure you fill out all of the information!"
                                   delegate:nil
                          cancelButtonTitle:@"ok"
                          otherButtonTitles:nil] show];
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





/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
