//
//  CRMTableVC.h
//  QuickMARSales
//
//  Created by Dalton on 10/23/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import <UIKit/UIKit.h>
@import MessageUI;
@import AddressBook;
@import AddressBookUI;


@interface CRMTableVC : UITableViewController <UITableViewDataSource, UITableViewDelegate, ABPeoplePickerNavigationControllerDelegate>

@end
