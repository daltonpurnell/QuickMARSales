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
    
    
    //    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:32/255.0 green:95/255.0 blue:254/255.0 alpha:1]];
    
//    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:136/255.0 green:195/255.0 blue:55/255.0 alpha:1]];
//    [[UINavigationBar appearance] setTintColor:[UIColor whiteColor]];
    
//    [[UITabBar appearance] setBarTintColor: [UIColor colorWithRed:136/255.0 green:195/255.0 blue:55/255.0 alpha:1]];
    
    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:74/255.0 green:75/255.0 blue:76/255.0 alpha:1]];
    
//    [[UIBarButtonItem appearance] setTintColor:[UIColor whiteColor]];
    
    [[UISegmentedControl appearance] setTintColor:[UIColor colorWithRed:136/255.0 green:195/255.0 blue:55/255.0 alpha:1]];
    
    [[UILabel appearance] setTextColor:[UIColor colorWithRed:74/255.0 green:75/255.0 blue:76/255.0 alpha:1]];
    
//    [[UINavigationBar appearance] setTranslucent:NO];
    
    [[UITabBar appearance] setTranslucent:NO];
        
//    [[UINavigationBar appearance] setTitleTextAttributes: [NSDictionary dictionaryWithObjectsAndKeys:
//                                                           [UIColor whiteColor],                                                           NSForegroundColorAttributeName,
//                                                           [UIFont fontWithName:@"SystemFont" size: 22.0],
//                                                           NSFontAttributeName,
//                                                           nil]];
    
}


@end
