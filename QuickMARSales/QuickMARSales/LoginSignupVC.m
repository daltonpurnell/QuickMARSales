//
//  LoginSignupVC.m
//  QuickMARSales
//
//  Created by Dalton on 3/17/16.
//  Copyright © 2016 Dalton. All rights reserved.
//

#import "LoginSignupVC.h"
#import "BuddySDK/Buddy.h"
#import "Appearance.h"


@interface LoginSignupVC ()
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField2;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField2;
@property (weak, nonatomic) IBOutlet UIButton *signupButton;
@property (weak, nonatomic) IBOutlet UIButton *logInButton;

@end

@implementation LoginSignupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.emailTextField.delegate = self;
    self.passwordTextField.delegate = self;
    self.emailTextField2.delegate = self;
    self.passwordTextField2.delegate = self;
    
    self.logInButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"BLUE"]];
    self.logInButton.clipsToBounds = YES;
    self.logInButton.layer.cornerRadius = 10;
    self.logInButton.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.logInButton.layer.shadowOffset = CGSizeMake(1, 2);
    self.logInButton.layer.shadowOpacity = 0.5;
    self.logInButton.clipsToBounds = NO;
    self.logInButton.layer.shadowRadius = 2.0;
    
    self.passwordTextField.secureTextEntry = YES;
    self.passwordTextField2.secureTextEntry = YES;

}


-(void)viewWillAppear:(BOOL)animated {
    [Appearance initializeAppearanceDefaults];
}

- (IBAction)linkTapped:(id)sender {
    // send to web page
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.quickmar.com/salesapp"]];

}


- (IBAction)loginButtonTapped:(id)sender {
    
    // log in user
    [Buddy loginUser:self.emailTextField2.text password:self.passwordTextField2.text callback:^(id newBuddyObject, NSError *error)
     {
         if (!error)
         {
             
             // save username to nsuserdefaults
             NSString *username = self.emailTextField2.text;
             [[NSUserDefaults standardUserDefaults] setObject:username forKey:@"username"];
             [[NSUserDefaults standardUserDefaults] synchronize];
             
             
             // Greet the user
             NSLog(@"Success! user logged in");
             [self dismissViewControllerAnimated:YES completion:nil];
         }
     }];
    

}



-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self resignFirstResponder];
    return true;
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
