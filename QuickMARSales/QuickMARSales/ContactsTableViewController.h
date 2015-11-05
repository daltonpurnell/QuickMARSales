//
//  ContactsTableViewController.h
//  QuickMARSales
//
//  Created by Dalton on 11/2/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonController.h"

@import MessageUI;

@interface ContactsTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate, MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) Person *person;
@property (strong, nonatomic) NSMutableArray *selectedCellsFromPreviousVC;

@end
