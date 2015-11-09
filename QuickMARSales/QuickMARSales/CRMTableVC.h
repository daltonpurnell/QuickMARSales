//
//  CRMTableVC.h
//  QuickMARSales
//
//  Created by Dalton on 10/23/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonController.h"
#import "MaterialsTableViewController.h"
@import MessageUI;
@import AddressBook;
@import AddressBookUI;


static NSString *const NoPhoneNumberNotificationKey = @"No phone number";
static NSString *const MaterialsSelectedNotificationKey = @"MaterialsSelected";

@interface CRMTableVC : UITableViewController <UITableViewDataSource, UITableViewDelegate, ABPeoplePickerNavigationControllerDelegate, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate>

@property (strong, nonatomic) Person *person;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@end


