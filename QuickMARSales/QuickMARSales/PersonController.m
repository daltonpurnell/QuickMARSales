//
//  PersonController.m
//  QuickMARSales
//
//  Created by Dalton on 10/23/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "PersonController.h"

@interface PersonController ()

@property (nonatomic, strong) NSArray *people;

@end

@implementation PersonController

+ (PersonController *) sharedInstance {
    static PersonController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [PersonController new];
        [sharedInstance loadPeopleFromParse:^(NSError *error) {
            // Nothing
            
            if (error) {
                NSLog(@"Error: %@", error);
            }
        }];
    });
    return sharedInstance;
}
#pragma mark - Create

-(Person *)createPersonWithFirstName:(NSString *) firstName

                                LastName:(NSString *)lastName

                             PhoneNumber:(NSString *) phoneNumber

                            EmailAddress:(NSString *) emailAddress

                                 Address:(NSString *) address

{
    
    Person *person = [Person object];
    
    person.firstName = firstName;
    person.lastName = lastName;
    person.phoneNumber = phoneNumber;
    person.emailAddress = emailAddress;
    person.address = address;
    
    PFUser *user = [PFUser currentUser];
    person.user = user;
    person.ACL = [PFACL ACLWithUser:user];
    [person.ACL setPublicReadAccess:NO];
    
    [person saveInBackground];
    
    NSMutableArray *mutablePeople = [NSMutableArray arrayWithArray:self.people];
    [mutablePeople insertObject:person atIndex:0];
    self.people = mutablePeople;
    
    return person;
    
}



#pragma mark - read

-(void)loadPeopleFromParse:(void (^)(NSError *error))completion {
    
    PFQuery *query = [Person query];
    PFUser *user = [PFUser currentUser];
    
    if (user) {
        
        [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
            
            if (!error) {
                
                self.people = objects;
                
                completion(nil);
                
            }else{
                
                completion (error);
                
            }
            
        }];
        
    }else {
        NSLog (@"No user logged in");
    }
    NSLog(@"Loading people from Parse");
}



#pragma mark - update

-(void)updatePerson:(Person *)person {
    
    [person saveInBackground];
    
}



#pragma mark - delete

-(void) removePerson:(Person *)person {
    
    NSMutableArray *mutablePeople = [NSMutableArray arrayWithArray:self.people];
    self.people = mutablePeople;
    [person deleteInBackground];
    
}



@end
