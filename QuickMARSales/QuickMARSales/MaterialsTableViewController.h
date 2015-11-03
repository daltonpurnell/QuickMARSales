//
//  MaterialsTableViewController.h
//  QuickMARSales
//
//  Created by Dalton on 11/3/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MaterialsTableViewController : UITableViewController <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSArray *optionsList;

@end
