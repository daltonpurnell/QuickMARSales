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





- (IBAction)emailButtonTapped:(id)sender {
// mf mail compose view controller
    MFMailComposeViewController *mailViewController = [MFMailComposeViewController new];
    mailViewController.mailComposeDelegate = self;
    [self presentViewController:mailViewController animated:YES completion:nil];
    
    // present choices of what to email
    
    
}





-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}






/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
