//
//  HandyRefViewController.m
//  QuickMARSales
//
//  Created by Dalton on 10/12/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "HandyRefViewController.h"
#import "Appearance.h"
#import "DocView.h"

@interface HandyRefViewController ()
@property (nonatomic, strong) NSArray *optionsList;
@property (nonatomic, strong) NSString *vcTitle;
@property (nonatomic, strong) UIImage *image;

@end

@implementation HandyRefViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
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
    
    self.optionsList= [[NSArray alloc] initWithObjects: @"   Request A Demo", @"   Request A Training", @"   Hardware Requirements", @"   View Training Outlines", @"   Sample Project Plan",  @"   QuickMAR University", @"   Brochure", @"   Fact Sheet", @"   I bought QuickMAR. Now what?", nil];
    
    NSString *savedUsername = [[NSUserDefaults standardUserDefaults]
                               stringForKey:@"username"];
    
    if (savedUsername == nil) {
        [self performSegueWithIdentifier:@"showLogin" sender:self];
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
    DocView *vc = [DocView new];
    
    return cell;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.row == 0) {
        // demo request form
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.quickmar.com/demo"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    } else if (indexPath.row == 1) {
        // training request form
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.quickmar.com/training"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    } else if (indexPath.row == 2) {
        [self performSegueWithIdentifier:@"showDoc" sender:self];
    } else if (indexPath.row == 3) {
        [self performSegueWithIdentifier:@"showDoc2" sender:self];
    } else if (indexPath.row == 4) {
        [self performSegueWithIdentifier:@"showDoc3" sender:self];
    } else if (indexPath.row == 5) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.quickmar.com/university"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];
    } else if (indexPath.row == 6) {
        [self performSegueWithIdentifier:@"showDoc4" sender:self];
    } else if (indexPath.row == 7) {
        [self performSegueWithIdentifier:@"showDoc5" sender:self];
    } else if (indexPath.row == 8) {
        [self performSegueWithIdentifier:@"showDoc6" sender:self];
    }
}


#pragma mark - mfmailcompose delegate methods

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    UINavigationController *navController = [segue destinationViewController];
    DocView *vc = navController.viewControllers.firstObject;
    
    if ([segue.identifier isEqualToString:@"showDoc"]) {
        vc.vcTitle = [@"Hardware Requirements" uppercaseString];
        vc.image = [UIImage imageNamed:@"hardware_requirements.jpg"];
    } if ([segue.identifier isEqualToString:@"showDoc2"]) {
        vc.vcTitle = [@"View Training Outlines" uppercaseString];
        vc.image = [UIImage imageNamed:@"training_outlines"];
    } if ([segue.identifier isEqualToString:@"showDoc3"]) {
        vc.vcTitle = [@"Sample Project Plan" uppercaseString];
        vc.image = [UIImage imageNamed:@"sample_project_plan.jpg"];
    } if ([segue.identifier isEqualToString:@"showDoc4"]) {
        vc.vcTitle = [@"Brochure" uppercaseString];
        vc.image = [UIImage imageNamed:@"brochure.jpg"];
    } if ([segue.identifier isEqualToString:@"showDoc5"]) {
        vc.vcTitle = [@"Fact Sheet" uppercaseString];
        vc.image = [UIImage imageNamed:@"fact_sheet.jpg"];
    } if ([segue.identifier isEqualToString:@"showDoc6"]) {
        vc.vcTitle = [@"I Bought QuickMAR. NOW WHAT?" uppercaseString];
        //        self.image = [UIImage imageNamed:@"stuff"];
    }
}

@end
