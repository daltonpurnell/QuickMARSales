//
//  HandyRefViewController.h
//  QuickMARSales
//
//  Created by Dalton on 10/12/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CustomHandyRefCell.h"
@import MessageUI;
@import Parse;
@import ParseUI;

@interface HandyRefViewController : UITableViewController <MFMailComposeViewControllerDelegate, PFLogInViewControllerDelegate, PFSignUpViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIBarButtonItem *cancelButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *mailButton;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *sendButton;
@property (strong, nonatomic) NSMutableArray *selectedCells;

@end
