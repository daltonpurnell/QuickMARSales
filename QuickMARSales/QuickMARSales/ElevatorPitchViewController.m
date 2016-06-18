//
//  ElevatorPitchViewController.m
//  QuickMARSales
//
//  Created by Dalton on 10/23/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "ElevatorPitchViewController.h"
#import "Appearance.h"

@interface ElevatorPitchViewController ()

@end

@implementation ElevatorPitchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [Appearance initializeAppearanceDefaults];
    
    self.navigationController.navigationBar.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.navigationController.navigationBar.layer.shadowOffset = CGSizeMake(0, 4);
    self.navigationController.navigationBar.layer.shadowOpacity = 0.5;
    self.navigationController.navigationBar.layer.shadowRadius = 2.0;
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    
    self.title = [@"Elevator Pitch" uppercaseString];

}

- (IBAction)doneButtonTapped:(id)sender {
    
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
