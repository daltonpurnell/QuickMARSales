//
//  CustomPersonCell.m
//  QuickMARSales
//
//  Created by Dalton on 10/23/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "CustomPersonCell.h"
#import "Appearance.h"

@implementation CustomPersonCell {

}

BOOL isChecked;

- (void)awakeFromNib {
    // Initialization code
    
}


-(void)layoutSubviews {
        
    [Appearance initializeAppearanceDefaults];
    
    self.textButton.hidden = YES;
    self.callButton.hidden = YES;
    
    self.emailButton.backgroundColor = [UIColor colorWithRed:102/255 green:101/255 blue:101/255 alpha:1];
    self.emailButton.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"gray"]];
    self.emailButton.clipsToBounds = YES;
    self.emailButton.layer.cornerRadius = 3;
    self.emailButton.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.emailButton.layer.shadowOffset = CGSizeMake(1, 2);
    self.emailButton.layer.shadowOpacity = 0.5;
    self.emailButton.layer.shadowRadius = 2.0;
    self.emailButton.clipsToBounds = NO;

    
}

- (IBAction)callButtonTapped:(id)sender {

        [[NSNotificationCenter defaultCenter] postNotificationName:NoPhoneNumberNotificationKey object:nil userInfo:nil];

}

- (IBAction)textButtonTapped:(id)sender {
    
    [self.delegate textButtonTapped:self.indexPath];
    
}

- (IBAction)emailButtonTapped:(id)sender {
    
    [self.emailDelegate emailButtonTapped:self.indexPath];

}

@end
