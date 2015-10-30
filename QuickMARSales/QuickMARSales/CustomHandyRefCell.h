//
//  CustomHandyRefCell.h
//  QuickMARSales
//
//  Created by Dalton on 10/30/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import <UIKit/UIKit.h>

static NSString *const mailButtonTappedNotificationKey = @"Mail button tapped";
static NSString *const cancelButtonTappedNotificationKey = @"Cancel button tapped";

@interface CustomHandyRefCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UIButton *checkBox;

@end
