//
//  CustomPersonCell.m
//  QuickMARSales
//
//  Created by Dalton on 10/23/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "CustomPersonCell.h"

@implementation CustomPersonCell

BOOL isChecked;

- (void)awakeFromNib {
    // Initialization code
    
    [self registerForNotification];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


-(void)layoutSubviews {
    
    self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", self.person.firstName, self.person.lastName];
    self.emailLabel.text = [NSString stringWithFormat:@"%@", self.person.emailAddress];
    self.addressLabel.text = [NSString stringWithFormat:@"%@", self.person.address];
    self.phoneNumberLabel.text = [NSString stringWithFormat:@"%@", self.person.phoneNumber];
    
    self.checkBox.hidden = YES;
    
}

- (IBAction)callButtonTapped:(id)sender {
    
    // if the phoneNumber string contains numbers and his more than 7 characters long
    if (self.person.phoneNumber.length >= 7 && [self.person.phoneNumber rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound)
    {
        
        NSString *strippedPhoneNumber = [[self.person.phoneNumber componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
        
        NSLog(@"%@", strippedPhoneNumber);
        
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:[NSString stringWithFormat:@"tel:%@", strippedPhoneNumber]]];
    } else {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:NoPhoneNumberNotificationKey object:nil userInfo:nil];
    }

}

- (IBAction)textButtonTapped:(id)sender {
    
    [self.delegate textButtonTapped:self.indexPath];
    
}

- (IBAction)emailButtonTapped:(id)sender {
    
    [self.emailDelegate emailButtonTapped:self.indexPath];

}

- (IBAction)checkBoxTapped:(id)sender {
    
    
    isChecked = !isChecked;
    [sender setImage:[UIImage imageNamed:((isChecked) ? @"Checked Checkbox-32" : @"Unchecked Checkbox-32")] forState: UIControlStateNormal];
    
}


#pragma mark - nsnotification methods

-(void)registerForNotification {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(respondToTopEmailButton:) name:topEmailButtonNotificationKey object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(respondToTopCancelButton:) name:topCancelButtonNotificationKey object:nil];
}

-(void)respondToTopEmailButton:(NSNotification *)notification {
    
    self.checkBox.hidden = NO;
}

-(void)respondToTopCancelButton:(NSNotification *)notification {
    
    self.checkBox.hidden = YES;
}

-(void)unregisterForNotification {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:topEmailButtonNotificationKey object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:topCancelButtonNotificationKey object:nil];
    
}

-(void)dealloc {
    
    [self unregisterForNotification];
}

@end
