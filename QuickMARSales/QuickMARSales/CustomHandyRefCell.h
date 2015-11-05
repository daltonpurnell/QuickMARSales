//
//  CustomHandyRefCell.h
//  QuickMARSales
//
//  Created by Dalton on 10/30/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol checkBoxTappedDelegate;

static NSString *const mailButtonTappedNotificationKey = @"Mail button tapped";
static NSString *const cancelButtonTappedNotificationKey = @"Cancel button tapped";

@interface CustomHandyRefCell : UITableViewCell
@property (nonatomic, strong) id <checkBoxTappedDelegate>checkBoxDelegate;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *checkBox;
@property (strong, nonatomic) NSIndexPath *indexPath;

@end

@protocol checkBoxTappedDelegate <NSObject>

-(IBAction)checkBoxTapped:(NSIndexPath *) indexPath;

@end