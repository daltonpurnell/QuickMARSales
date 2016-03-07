//
//  HandyRefViewController.m
//  QuickMARSales
//
//  Created by Dalton on 10/12/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "HandyRefViewController.h"
#import "Appearance.h"

@interface HandyRefViewController ()
@property (nonatomic, strong) NSArray *optionsList;
@property (nonatomic, strong) DBRestClient *restClient;

@end

@implementation HandyRefViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    
    
    // dropbox
    if (![[DBSession sharedSession] isLinked]) {
        [[DBSession sharedSession] linkFromController:self];
    }
    
    
    
    self.restClient = [[DBRestClient alloc] initWithSession:[DBSession sharedSession]];
    self.restClient.delegate = self;
    
    
    //  appearance
    [Appearance initializeAppearanceDefaults];
    
    self.navigationController.navigationBar.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.navigationController.navigationBar.layer.shadowOffset = CGSizeMake(0, 4);
    self.navigationController.navigationBar.layer.shadowOpacity = 0.5;
    self.navigationController.navigationBar.layer.shadowRadius = 2.0;


    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = YES;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.optionsList= [[NSArray alloc] initWithObjects: @"   Request A Demo", @"   Request A Training", @"   Hardware Requirements", @"   Order Materials", @"   View Training Materials", @"   Sample Project Plan",  @"   QuickMAR University", @"   News", @"   Brochure", @"   Fact Sheet", @"   I bought QuickMAR. Now what?", nil];

    
    PFUser *currentUser = [PFUser currentUser];
    if (!currentUser) { // No user logged in
        
        // parse log in
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
//        [logInViewController.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QMAppIcon"]]];
        [logInViewController setDelegate:self];
        [logInViewController setFields:PFLogInFieldsUsernameAndPassword
         | PFLogInFieldsSignUpButton
         | PFLogInFieldsLogInButton
         | PFLogInFieldsUsernameAndPassword];
        
        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
//        [signUpViewController.signUpView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QMAppIcon"]]];
        [signUpViewController setDelegate:self];
        [signUpViewController setFields:PFSignUpFieldsUsernameAndPassword
         | PFSignUpFieldsSignUpButton
         | PFSignUpFieldsDismissButton];
        
        [logInViewController setSignUpController:signUpViewController];
        
        [self presentViewController:logInViewController animated:YES completion:^{
            
            // nothing
        }];  
    
    }

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
    cell.indexPath = indexPath;
    
    
    return cell;
}





-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        
        // demo request form
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.quickmar.com/demo"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        
    } else if (indexPath.row == 1) {
        
        // training request form

        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.quickmar.com/demo"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

    } else if (indexPath.row == 2) {
        
                UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:nil
                                              message:@"Your username for the QuickMAR Sales DropBox account is:\n \nquickmarsalesapp@gmail.com\n \nYour password is:\n \nquickmar123\n \n(You may need to sign out of your DropBox first)"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 // hardware requirements form
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.dropbox.com/home/QuickMAR%20Sales?preview=dummy.pdf"]];
                                 [tableView deselectRowAtIndexPath:indexPath animated:YES];
                             }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];

        


    } else if (indexPath.row == 3) {
        

        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:nil
                                      message:@"Your username for this site is:\n \n \n \nYour password is:\n \n"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 // materials order form
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.quickmar.com/demo"]];
                                 [tableView deselectRowAtIndexPath:indexPath animated:YES];
                             }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];

        


    } else if (indexPath.row == 4) {
        

        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:nil
                                      message:@"Your username for the QuickMAR Sales DropBox account is:\n \nquickmarsalesapp@gmail.com\n \nYour password is:\n \nquickmar123\n \n(You may need to sign out of your DropBox first)"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                // training materials link
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.dropbox.com/home/QuickMAR%20Sales?preview=dummy.pdf"]];
                                 [tableView deselectRowAtIndexPath:indexPath animated:YES];
                             }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];

    } else if (indexPath.row == 5) {
        

        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:nil
                                      message:@"Your username for the QuickMAR Sales DropBox account is:\n \nquickmarsalesapp@gmail.com\n \nYour password is:\n \nquickmar123\n \n(You may need to sign out of your DropBox first)"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                         // sample project plan
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.dropbox.com/home/QuickMAR%20Sales?preview=dummy.pdf"]];
                                 [tableView deselectRowAtIndexPath:indexPath animated:YES];
                             }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        

    } else if (indexPath.row == 6) {
        

        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:nil
                                      message:@"Your username for this site is:\n \n \n \nYour password is:\n \n"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                // quickmar university
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.quickmar.com/demo"]];
                                 [tableView deselectRowAtIndexPath:indexPath animated:YES];
                             }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
        

        


    } else if (indexPath.row == 7) {
        
        // news
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.quickmar.com/demo"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
        


    } else if (indexPath.row == 8) {
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:nil
                                      message:@"Your username for the QuickMAR Sales DropBox account is:\n \nquickmarsalesapp@gmail.com\n \nYour password is:\n \nquickmar123\n \n(You may need to sign out of your DropBox first)"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 // brochure
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.dropbox.com/home/QuickMAR%20Sales?preview=dummy.pdf"]];
                                 [tableView deselectRowAtIndexPath:indexPath animated:YES];
                             }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
        


    } else if (indexPath.row == 9) {
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:nil
                                      message:@"Your username for the QuickMAR Sales DropBox account is:\n \nquickmarsalesapp@gmail.com\n \nYour password is:\n \nquickmar123\n \n(You may need to sign out of your DropBox first)"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 // fact sheet
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.dropbox.com/home/QuickMAR%20Sales?preview=dummy.pdf"]];
                                 [tableView deselectRowAtIndexPath:indexPath animated:YES];
                             }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
        


    } else if (indexPath.row == 10) {
        
        UIAlertController * alert=   [UIAlertController
                                      alertControllerWithTitle:nil
                                      message:@"Your username for the QuickMAR Sales DropBox account is:\n \nquickmarsalesapp@gmail.com\n \nYour password is:\n \nquickmar123\n \n(You may need to sign out of your DropBox first)"
                                      preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* ok = [UIAlertAction
                             actionWithTitle:@"OK"
                             style:UIAlertActionStyleDefault
                             handler:^(UIAlertAction * action)
                             {
                                 // now what
                                 [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.dropbox.com/home/QuickMAR%20Sales?preview=dummy.pdf"]];
                                 [tableView deselectRowAtIndexPath:indexPath animated:YES];
                             }];
        
        [alert addAction:ok];
        
        [self presentViewController:alert animated:YES completion:nil];
        
        

    }
}






#pragma mark - events

- (IBAction)logOutTapped:(id)sender {
    
    
    [PFUser logOut];
    PFUser *currentUser = [PFUser currentUser];
    if (!currentUser) { // No user logged in
        
        // parse log in
        PFLogInViewController *logInViewController = [[PFLogInViewController alloc] init];
//        [logInViewController.logInView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QMAppIcon"]]];

        [logInViewController setDelegate:self];
        [logInViewController setFields:PFLogInFieldsUsernameAndPassword
         | PFLogInFieldsSignUpButton
         | PFLogInFieldsLogInButton
         | PFLogInFieldsUsernameAndPassword];
        
        PFSignUpViewController *signUpViewController = [[PFSignUpViewController alloc] init];
//        [signUpViewController.signUpView setLogo:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"QMAppIcon"]]];
        [signUpViewController setDelegate:self];
        [signUpViewController setFields:PFSignUpFieldsUsernameAndPassword
         | PFSignUpFieldsSignUpButton
         | PFSignUpFieldsDismissButton];
        
        [logInViewController setSignUpController:signUpViewController];
        
        [self presentViewController:logInViewController animated:YES completion:^{
            
            // nothing
        }];
        
    }

    
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




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//       }

@end
