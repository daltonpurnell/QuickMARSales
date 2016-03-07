//
//  Appearance.m
//  QuickMARSales
//
//  Created by Dalton on 11/4/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "Appearance.h"

@implementation Appearance

+ (void)initializeAppearanceDefaults {
    
    
        [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:147/255.0 green:204/255.0 blue:65/255.0 alpha:1]];
    

    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    [[UINavigationBar appearance] setTranslucent:NO];
    [[UITableView appearance] setBackgroundColor:[UIColor whiteColor]];
    
    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
                                                           [UIColor whiteColor],                                                           NSForegroundColorAttributeName,
                                                           [UIFont fontWithName:@"Roboto" size: 22.0],
                                                           NSFontAttributeName,
                                                           nil]];
    
    
    [[UILabel appearance] setTextColor:[UIColor colorWithRed:102/255 green:101/255 blue:101/255 alpha:1]];
    
    

//    [[UITabBar appearance] setBarTintColor: [UIColor colorWithRed:147/255.0 green:204/255.0 blue:65/255.0 alpha:1]];
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:74/255.0 green:75/255.0 blue:76/255.0 alpha:1]];
    [[UITabBar appearance] setTranslucent:NO];
    
    [[UILabel appearance] setTextColor:[UIColor colorWithRed:74/255.0 green:75/255.0 blue:76/255.0 alpha:1]];
    
    [[UITabBarItem appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName :[UIColor colorWithRed:147/255.0 green:204/255.0 blue:65/255.0 alpha:1]} forState:UIControlStateSelected];
//
//    [[UITabBarItem appearance] setTitleTextAttributes: @{NSForegroundColorAttributeName :[UIColor colorWithRed:255/255 green:255/255 blue:255/255 alpha:0.5]} forState:UIControlStateNormal];
    

    
}


@end
