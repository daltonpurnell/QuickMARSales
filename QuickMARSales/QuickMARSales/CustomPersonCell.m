//
//  CustomPersonCell.m
//  QuickMARSales
//
//  Created by Dalton on 10/23/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "CustomPersonCell.h"

@implementation CustomPersonCell

- (void)awakeFromNib {
    // Initialization code
    
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", self.person.firstName, self.person.lastName];
    self.emailLabel.text = [NSString stringWithFormat:@"%@", self.person.emailAddress];
    self.addressLabel.text = [NSString stringWithFormat:@"%@", self.person.address];
    self.phoneNumberLabel.text = [NSString stringWithFormat:@"%@", self.person.phoneNumber];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
