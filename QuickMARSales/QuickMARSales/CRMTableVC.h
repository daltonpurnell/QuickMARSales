//
//  CRMTableVC.h
//  QuickMARSales
//
//  Created by Dalton on 10/23/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonController.h"
@import MessageUI;
@import AddressBook;
@import AddressBookUI;

static NSString *const NoPhoneNumberNotificationKey = @"No phone number";

@interface CRMTableVC : UITableViewController <UITableViewDataSource, UITableViewDelegate, ABPeoplePickerNavigationControllerDelegate, MFMailComposeViewControllerDelegate, MFMessageComposeViewControllerDelegate>

@property (strong, nonatomic) Person *person;

@end
