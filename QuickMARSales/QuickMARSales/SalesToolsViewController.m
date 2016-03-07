//
//  SalesToolsViewController.m
//  QuickMARSales
//
//  Created by Dalton on 10/12/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "SalesToolsViewController.h"
#import "Appearance.h"

@interface SalesToolsViewController ()


@end

@implementation SalesToolsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Appearance initializeAppearanceDefaults];
    
    self.navigationController.navigationBar.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.navigationController.navigationBar.layer.shadowOffset = CGSizeMake(0, 4);
    self.navigationController.navigationBar.layer.shadowOpacity = 0.5;
    self.navigationController.navigationBar.layer.shadowRadius = 2.0;
    
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];

    
}



@end
