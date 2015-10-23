//
//  Person.m
//  QuickMARSales
//
//  Created by Dalton on 10/23/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "Person.h"

static NSString * const PersonClassName = @"Person";

@implementation Person

@dynamic firstName;
@dynamic lastName;
@dynamic phoneNumber;
@dynamic emailAddress;
@dynamic address;
@dynamic user;

+ (NSString *)parseClassName {
    return PersonClassName;
}

@end
