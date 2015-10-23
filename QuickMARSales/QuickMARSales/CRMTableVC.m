//
//  CRMTableVC.m
//  QuickMARSales
//
//  Created by Dalton on 10/23/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "CRMTableVC.h"

@interface CRMTableVC ()

@property (strong, nonatomic) NSString *savedEmail;
@property (strong, nonatomic) NSString *savedPhoneNumber;
@property (strong, nonatomic) NSString *savedAddress;
@property (strong, nonatomic) NSString *savedFirstName;
@property (strong, nonatomic) NSString *savedLastName;

@end

@implementation CRMTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;

}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    cell.textLabel.text = @"text";
    
    return cell;
}


- (IBAction)addButtonTapped:(id)sender {
    
    // Show ABPeoplePickerNavigationController
    ABPeoplePickerNavigationController *picker = [ABPeoplePickerNavigationController new];
    picker.peoplePickerDelegate = self;
    picker.displayedProperties = @[@(kABPersonEmailProperty)];
    //    picker.predicateForEnablingPerson = [NSPredicate predicateWithFormat:@"emailAddresses.@count > 0"];
    //    picker.predicateForSelectionOfPerson = [NSPredicate predicateWithFormat:@"emailAddresses.@count = 1"];
    
    [self presentViewController:picker animated:YES completion:nil];
    
    NSLog(@"People picker launched");
    //    }

    
}

#pragma mark - ABPeoplePickerNavigationControllerDelegate methods

// A selected person is returned with this method.
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person
{
    [self didSelectPerson:person identifier:kABMultiValueInvalidIdentifier];
}


// A selected person and property is returned with this method.
- (void)peoplePickerNavigationController:(ABPeoplePickerNavigationController *)peoplePicker didSelectPerson:(ABRecordRef)person property:(ABPropertyID)property identifier:(ABMultiValueIdentifier)identifier
{
    [self didSelectPerson:person identifier:identifier];
}


- (void)peoplePickerNavigationControllerDidCancel:(ABPeoplePickerNavigationController *)peoplePicker
{
    
}



#pragma mark - ABPeoplePickerNavigationController helper methods

- (void)didSelectPerson:(ABRecordRef)person identifier:(ABMultiValueIdentifier)identifier
{
    
    // get email
    NSString *emailAddress = @"No Email Address";
    ABMultiValueRef emails = ABRecordCopyValue(person, kABPersonEmailProperty);
    if (emails)
    {
        if (ABMultiValueGetCount(emails) > 0)
        {
            CFIndex index = 0;
            if (identifier != kABMultiValueInvalidIdentifier)
            {
                index = ABMultiValueGetIndexForIdentifier(emails, identifier);
            }
            emailAddress = CFBridgingRelease(ABMultiValueCopyValueAtIndex(emails, index));
        }
        CFRelease(emails);
    }
    self.savedEmail = emailAddress;
    
    // get phone number
    NSString *phoneNumber = @"No Phone Number";
    ABMultiValueRef phoneNumbers = ABRecordCopyValue(person, kABPersonPhoneProperty);
    if (phoneNumbers) {
        if (ABMultiValueGetCount(phoneNumbers) > 0)
        {
            CFIndex index = 0;
            if (identifier != kABMultiValueInvalidIdentifier) {
                
                index = ABMultiValueGetIndexForIdentifier(phoneNumbers, identifier);
            }
            phoneNumber = CFBridgingRelease(ABMultiValueCopyValueAtIndex(phoneNumbers, index));
        }
        CFRelease(phoneNumbers);
    }
    
    self.savedPhoneNumber = phoneNumber;
    
    
    // get address
    NSString *address = @"No Address";
    ABMultiValueRef addresses = ABRecordCopyValue(person, kABPersonAddressProperty);
    if (addresses) {
        if (ABMultiValueGetCount(addresses) > 0)
        {
            CFIndex index = 0;
            if (identifier != kABMultiValueInvalidIdentifier) {
                
                index = ABMultiValueGetIndexForIdentifier(addresses, identifier);
            }
            address = CFBridgingRelease(ABMultiValueCopyValueAtIndex(addresses, index));
        }
        CFRelease(addresses);
    }
    self.savedAddress = address;
    
    // get firstname
    NSString *firstName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonFirstNameProperty);
    
    if (!firstName) {
        firstName = @"";
    } else {
        self.savedFirstName = firstName;
    }
    
    // get lastname
    NSString *lastName = (__bridge NSString *)ABRecordCopyValue(person, kABPersonLastNameProperty);
    if (!lastName) {
        lastName = @"";
    } else {
        self.savedLastName = lastName;
    }
    
    [self dismissViewControllerAnimated:YES
                             completion:^{
                                 UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Are you sure you would like to add this person to your CRM?" message:[NSString stringWithFormat:@"%@ %@ \n %@ \n %@ \n %@", firstName, lastName, phoneNumber, emailAddress, address] preferredStyle:UIAlertControllerStyleAlert];
                                 
                                 [alert addAction:[UIAlertAction actionWithTitle:@"Add Employee" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                                     
                                     // now load all these things into a person object and save it to parse
//                                     [[EmployeeController sharedInstance]createEmployeeWithFirstName:firstName LastName:lastName              PhoneNumber:phoneNumber EmailAddress:emailAddress Address:address Photo:self.savedPhoto];
//                                     
                                    
                                     [self.tableView reloadData];
                                 }]];
                                 
                                 [alert addAction:[UIAlertAction actionWithTitle:@"Nevermind" style:UIAlertActionStyleCancel handler:nil]];
                                 
                                 [self presentViewController:alert animated:YES completion:nil];
                                 
                             }];
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
