//
//  PersonController.h
//  QuickMARSales
//
//  Created by Dalton on 10/23/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface PersonController : NSObject
@property (strong, nonatomic, readonly) NSArray *people;


+ (PersonController *) sharedInstance;

-(Person *)createPersonWithFirstName:(NSString *) firstName

                                LastName:(NSString *)lastName

                             PhoneNumber:(NSString *) phoneNumber

                            EmailAddress:(NSString *) emailAddress

                             Address:(NSString *) address;


-(void)loadPeopleFromParse:(void (^)(NSError *error))completion;

-(void)updatePerson:(Person *)person;

-(void) removePerson:(Person *) person;

@end
