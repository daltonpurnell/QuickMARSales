//
//  CRMTableVC.h
//  QuickMARSales
//
//  Created by Dalton on 10/23/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JGActionSheet.h"
#import <DropboxSDK/DropboxSDK.h>

@import MessageUI;
@import AddressBook;
@import AddressBookUI;


static NSString *const NoPhoneNumberNotificationKey = @"No phone number";

@interface CRMTableVC : UITableViewController <UITableViewDataSource, UITableViewDelegate, ABPeoplePickerNavigationControllerDelegate, MFMessageComposeViewControllerDelegate, MFMailComposeViewControllerDelegate> {
    
}

@property (weak, nonatomic) IBOutlet UIBarButtonItem *addButton;

@end


