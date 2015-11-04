//
//  CustomHandyRefCell.m
//  QuickMARSales
//
//  Created by Dalton on 10/30/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "CustomHandyRefCell.h"
#import "HandyRefViewController.h"
#import "Appearance.h"

@implementation CustomHandyRefCell

BOOL checked;

- (void)awakeFromNib {
    // Initialization code
    
}




- (IBAction)checkBoxTapped:(id)sender {
    
    checked = !checked;
    [sender setImage:[UIImage imageNamed:((checked) ? @"Checked Checkbox-32" : @"Unchecked Checkbox-32")] forState:UIControlStateNormal];
}




-(void)layoutSubviews {
    
    checked = NO;    
    [self registerForNotifications];
    [Appearance initializeAppearanceDefaults];

}




#pragma mark - nsnotifications methods

-(void)registerForNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(respondToMailButtonTapped:) name:mailButtonTappedNotificationKey object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(respondToCancelButtonTapped:) name:cancelButtonTappedNotificationKey object:nil];
    
}

-(void)respondToMailButtonTapped:(NSNotification *)notification {
    
    self.checkBox.hidden = NO;
    checked = NO;
}



-(void)respondToCancelButtonTapped:(NSNotification *)notification {

    self.checkBox.hidden = YES;
    checked = NO;
}



-(void)unregisterForNotifications {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name: mailButtonTappedNotificationKey object:nil];
}

-(void)dealloc {
    
    [self unregisterForNotifications];
}



@end
