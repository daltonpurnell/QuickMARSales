//
//  MaterialsTableViewController.h
//  QuickMARSales
//
//  Created by Dalton on 11/3/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MessageUI;

@interface MaterialsTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) NSArray *optionsList;
@property (strong, nonatomic) NSMutableArray *selectedCellsFromPreviousViewController;

@end
