//
//  CustomHandyRefCell.h
//  QuickMARSales
//
//  Created by Dalton on 10/30/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomHandyRefCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (strong, nonatomic) NSIndexPath *indexPath;

@end

