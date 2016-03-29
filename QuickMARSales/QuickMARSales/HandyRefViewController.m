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
    
    
    // dropbox
    if (![[DBSession sharedSession] isLinked]) {
        [[DBSession sharedSession] linkFromController:self];
    }
    
    
    
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
    
    
    
    [self performSegueWithIdentifier:@"showLogin" sender:self];


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
        
        self.vcTitle = @"Hardware Requirements";
        self.image = [UIImage imageNamed:@"hardware_requirements.jpg"];
        
        [self performSegueWithIdentifier:@"showDoc" sender:self];

    } else if (indexPath.row == 3) {
        
        self.vcTitle = @"View Training Outlines";
        
        [self performSegueWithIdentifier:@"showDoc" sender:self];
        
    } else if (indexPath.row == 4) {
        
        self.vcTitle = @"Sample Project Plan";
        self.image = [UIImage imageNamed:@"sample_project_plan.jpg"];
        
        [self performSegueWithIdentifier:@"showDoc" sender:self];

    } else if (indexPath.row == 5) {
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://www.quickmar.com/demo"]];
        [tableView deselectRowAtIndexPath:indexPath animated:YES];

    } else if (indexPath.row == 6) {
        
        self.vcTitle = @"Brochure";
        self.image = [UIImage imageNamed:@"brochure.jpg"];
        
        [self performSegueWithIdentifier:@"showDoc" sender:self];


    } else if (indexPath.row == 7) {
        
        self.vcTitle = @"Fact Sheet";
        self.image = [UIImage imageNamed:@"fact_sheet.jpg"];

        [self performSegueWithIdentifier:@"showDoc" sender:self];

    } else if (indexPath.row == 8) {
        
        self.vcTitle = @"I Bought QuickMAR. NOW WHAT?";
//        self.image = [UIImage imageNamed:@"stuff"];
        
        [self performSegueWithIdentifier:@"showDoc" sender:self];

    }
}






#pragma mark - events

- (IBAction)logOutTapped:(id)sender {
    
    
    
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
    if ([segue.identifier isEqualToString:@"showDoc"]) {
        
        UINavigationController *navController = [segue destinationViewController];
        DocView *docView = navController.viewControllers.firstObject;

    self.image = docView.image;
    self.vcTitle = docView.vcTitle;
        
    }
    
}

@end
