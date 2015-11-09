//
//  CustomPersonCell.h
//  QuickMARSales
//
//  Created by Dalton on 10/23/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonController.h"
#import "CRMTableVC.h"

@protocol textButtonTappedDelegate;
@protocol emailButtonTappedDelegate;


@interface CustomPersonCell : UITableViewCell
@property (nonatomic, strong) id <textButtonTappedDelegate>delegate;
@property (nonatomic, strong) id <emailButtonTappedDelegate>emailDelegate;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (strong, nonatomic) Person *person;
@property (strong, nonatomic) NSIndexPath *indexPath;
@property (weak, nonatomic) IBOutlet UIButton *callButton;
@property (weak, nonatomic) IBOutlet UIButton *textButton;
@property (weak, nonatomic) IBOutlet UIButton *emailButton;

@end

@protocol textButtonTappedDelegate <NSObject>

- (IBAction)textButtonTapped:(NSIndexPath *)indexPath;

@end



@protocol emailButtonTappedDelegate <NSObject>

- (IBAction)emailButtonTapped:(NSIndexPath *)indexPath;

@end



