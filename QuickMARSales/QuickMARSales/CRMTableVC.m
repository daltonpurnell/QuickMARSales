//
//  CRMTableVC.m
//  QuickMARSales
//
//  Created by Dalton on 10/23/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "CRMTableVC.h"
#import "CustomPersonCell.h"
#import "Appearance.h"
#import "BuddySDK/Buddy.h"


@interface CRMTableVC () <textButtonTappedDelegate, emailButtonTappedDelegate>

@property (strong, nonatomic) NSString *savedEmail;
@property (strong, nonatomic) NSString *savedPhoneNumber;
@property (strong, nonatomic) NSString *savedAddress;
@property (strong, nonatomic) NSString *savedFirstName;
@property (strong, nonatomic) NSString *savedLastName;

@property (strong, nonatomic) NSMutableArray *selectedMaterials;
@property (strong, nonatomic) NSMutableArray *linksArray;
@property (strong, nonatomic) NSArray *people;

@end

@implementation CRMTableVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [Appearance initializeAppearanceDefaults];
    
    [self loadPeopleFromBuddy];
    
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
    [self.navigationController.navigationBar setBackgroundImage:[[UIImage alloc]init] forBarMetrics:UIBarMetricsDefault];
    
    self.navigationController.navigationBar.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.navigationController.navigationBar.layer.shadowOffset = CGSizeMake(0, 4);
    self.navigationController.navigationBar.layer.shadowOpacity = 0.5;
    self.navigationController.navigationBar.layer.shadowRadius = 2.0;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    self.selectedMaterials = [[NSMutableArray alloc] init];
    self.linksArray = [[NSMutableArray alloc] init];

    
    // get permission to access contacts
    ABAddressBookRef addressBook =  ABAddressBookCreateWithOptions(NULL, NULL);
    ABAddressBookRequestAccessWithCompletion(addressBook, ^(bool granted, CFErrorRef error) {
        NSLog(@"Access to contacts %@ by user", granted ? @"granted" : @"denied");
    });
    
    [self registerForNotifications];
}


-(void)viewWillAppear:(BOOL)animated {
    
    [self loadPeopleFromBuddy];
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.people.count;
}




- (CustomPersonCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomPersonCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    // Configure the cell...
    
    BPPicture *picture = [self.people objectAtIndex:indexPath.row];
    [Buddy GET:[NSString stringWithFormat:@"pictures/%@/file", picture.id] parameters:nil class:[BPFile class] callback:^(id obj, NSError *error) {
        
        if(error==nil)
        {
            BPFile *file = (BPFile*)obj;
//
//            UIImage* image = [UIImage imageWithData:file.fileData];
//            [cell.imageView setImage:image];
            
            cell.nameLabel.text = picture.title;
            
            cell.phoneNumberLabel.text = picture.tag;
            
            cell.emailLabel.text = picture.caption;
            
        }
        
    }];

    
    cell.delegate = self;
    cell.emailDelegate = self;
    cell.indexPath = indexPath;

    return cell;
}



#pragma mark - table view delegate

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    return 195;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - events

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
                                 
                                 // convert uiimage to bpfile
                                 BPFile *file = [[BPFile alloc] init];
                                 file.contentType = @"image/png";
                                 file.fileData = UIImagePNGRepresentation([UIImage imageNamed:@"ContactGray"]);
                                 
                                 // post picture
                                 NSDictionary *params = @{
                                                          @"data": file,
                                                          @"tag": self.savedEmail,
                                                          @"caption":self.savedPhoneNumber,
                                                          @"readPermissions": @"User",
                                                          @"writePermissions": @"User",
                                                          @"title": [NSString stringWithFormat:@"%@ %@", self.savedFirstName, self.savedLastName]
                                                          };
                                 
                                 [Buddy POST:@"/pictures" parameters:params class:[BPPicture class] callback:^(id obj, NSError *error) {
                                     
                                     // Your callback code here
                                     if (!error) {
                                         NSLog(@"Success!");
                                         [self loadPeopleFromBuddy];
                                         [self.tableView reloadData];
                                         
                                     } else {
                                         
                                         NSLog(@"ERROR: %@", error);
                                     }
                                     
                                     
                                 }];

                             }];
    
}



#pragma mark - custom delegate methods

-(void)textButtonTapped:(NSIndexPath*)indexPath {
    BPPicture *person = [self.people objectAtIndex:indexPath.row];
    
    // if the phoneNumber string contains numbers and is more than 7 characters long
    if (person.caption.length >= 7 && [person.caption rangeOfCharacterFromSet:[NSCharacterSet decimalDigitCharacterSet]].location != NSNotFound)
    {
        
        
        NSString *strippedPhoneNumber = [[person.caption componentsSeparatedByCharactersInSet:[[NSCharacterSet decimalDigitCharacterSet] invertedSet]] componentsJoinedByString:@""];
        
        NSLog(@"%@", strippedPhoneNumber);
        
        // launch mfmessagecompose
        MFMessageComposeViewController *messageVC = [MFMessageComposeViewController new];
        messageVC.messageComposeDelegate = self;
        messageVC.recipients = [NSArray arrayWithObjects:[NSString stringWithFormat:@"%@", strippedPhoneNumber], nil];
        
        [self presentViewController:messageVC animated:YES completion:nil];
        
    } else {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops!" message:@"This person does not have a phone number on file" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil]];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}



-(void)emailButtonTapped:(NSIndexPath*)indexPath {
    
    BPPicture *person = [self.people objectAtIndex:indexPath.row];
    
    // if the email string contains @
    NSCharacterSet *cset = [NSCharacterSet characterSetWithCharactersInString:@"@"];
    if ([person.tag rangeOfCharacterFromSet:cset].location != NSNotFound)
    {
            // create view programmatically and present it
            JGActionSheetSection *section1 = [JGActionSheetSection sectionWithTitle:@"Materials" message:@"Choose the materials you would like to send" buttonTitles:@[@"Request A Demo", @"Request A Training", @"Hardware Requirements", @"Training Course Outlines", @"Sample Project Plan",  @"QuickMAR University", @"Brochure", @"Fact Sheet", @"I bought QuickMAR. Now what?", @"Ok", @"Cancel"] buttonStyle:JGActionSheetButtonStyleDefault];
        
        [section1 setButtonStyle:JGActionSheetButtonStyleBlue forButtonAtIndex:9];
        [section1 setButtonStyle:JGActionSheetButtonStyleRed forButtonAtIndex:10];

        
            NSArray *sections = @[section1];
            
            JGActionSheet *sheet = [JGActionSheet actionSheetWithSections:sections];
        
            
            [sheet setButtonPressedBlock:^(JGActionSheet *sheet, NSIndexPath *indexPath) {
                
                if (indexPath.row == 10) {
                    [sheet dismissAnimated:YES];
                    [self.selectedMaterials removeAllObjects];
                    [self.linksArray removeAllObjects];
                }
                
                if (indexPath.row == 9) {
                    
                    // add correct links to links array
                    if ([self.selectedMaterials containsObject:[NSNumber numberWithInteger:0]]) {
                        
                        // add link to links array
                        [self.linksArray addObject:@"http://www.quickmar.com/demo"];
                        NSLog(@"%@", self.linksArray);
                        
                    } if ([self.selectedMaterials containsObject:[NSNumber numberWithInteger:1]]) {
                        
                        // add link to links array
                        [self.linksArray addObject:@"http://www.quickmar.com/demo"];
                        NSLog(@"%@", self.linksArray);
                        
                    } if ([self.selectedMaterials containsObject:[NSNumber numberWithInteger:5]]) {
                        
                        // add link to links array
                        [self.linksArray addObject:@"http://www.quickmar.com/demo  \n Your username for this site is: \n Your password is:"];
                        NSLog(@"%@", self.linksArray);
                        
                    }
                    
                    [sheet dismissAnimated:YES];
                    
                    
                    
                // launch mfmailcompose
                MFMailComposeViewController *mailViewController = [MFMailComposeViewController new];
                mailViewController.mailComposeDelegate = self;
                    
                    
                    if ([self.selectedMaterials containsObject:[NSNumber numberWithInteger:2]]) {
                       
                        // attach file
                        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"hardware_requirements" ofType:@"jpg"];
                        NSData *pdfData = [NSData dataWithContentsOfFile:filePath];
                        [mailViewController addAttachmentData:pdfData mimeType:@"image/jpeg" fileName:@"hardware_requirements.jpg"];
                        
                    }if ([self.selectedMaterials containsObject:[NSNumber numberWithInteger:3]]) {
                        
                        // attach file
                        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"training_outlines" ofType:@"jpg"];
                        NSData *pdfData = [NSData dataWithContentsOfFile:filePath];
                        [mailViewController addAttachmentData:pdfData mimeType:@"image/jpeg" fileName:@"training_outlines.jpg"];
                        
                    }if ([self.selectedMaterials containsObject:[NSNumber numberWithInteger:4]]) {
                        
                        // attach file
                        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"sample_project_plan" ofType:@"jpg"];
                        NSData *pdfData = [NSData dataWithContentsOfFile:filePath];
                        [mailViewController addAttachmentData:pdfData mimeType:@"image/jpeg" fileName:@"sample_project_plan.jpg"];
                        
                    }if ([self.selectedMaterials containsObject:[NSNumber numberWithInteger:6]]) {
                        
                        // attach file
                        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"brochure" ofType:@"jpg"];
                        NSData *pdfData = [NSData dataWithContentsOfFile:filePath];
                        [mailViewController addAttachmentData:pdfData mimeType:@"image/jpeg" fileName:@"brochure.jpg"];
                        
                    }if ([self.selectedMaterials containsObject:[NSNumber numberWithInteger:7]]) {
                       
                        // attach file
                        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"fact_sheet" ofType:@"jpg"];
                        NSData *pdfData = [NSData dataWithContentsOfFile:filePath];
                        [mailViewController addAttachmentData:pdfData mimeType:@"image/jpeg" fileName:@"fact_sheet.jpg"];
                        
                    }if ([self.selectedMaterials containsObject:[NSNumber numberWithInteger:8]]) {
                       
                        // attach file
//                        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"now_what" ofType:@"jpg"];
//                        NSData *pdfData = [NSData dataWithContentsOfFile:filePath];
//                        [mailViewController addAttachmentData:pdfData mimeType:@"image/jpeg" fileName:@"now_what"];
                        
                    }
                    
                    
                    
                [mailViewController setToRecipients:[NSArray arrayWithObjects:[NSString stringWithFormat:@"%@", person.caption], nil]];

                [mailViewController setMessageBody:[NSString stringWithFormat:@"%@",[[self.linksArray valueForKey:@"description"] componentsJoinedByString:@"\n"]] isHTML:NO];
                    
                 [self presentViewController:mailViewController animated:YES completion:nil];
                } else {
                    
                    // add index path to array of selected buttons
                    [section1 setButtonStyle:JGActionSheetButtonStyleGreen forButtonAtIndex:indexPath.row];
                    [self.selectedMaterials addObject:[NSNumber numberWithInteger:indexPath.row]];
                    NSLog(@"%@", self.selectedMaterials);
                }
            }];
        
        UIView *newView = [[UIView alloc] initWithFrame:CGRectMake(0, -30, self.view.frame.size.width, self.view.frame.size.height - 64)];
        [self.view addSubview:newView];
            
            [sheet showInView:newView animated:YES];

    } else {
        
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops!" message:@"This person does not have an email address on file" preferredStyle:UIAlertControllerStyleAlert];
        
        [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil]];
        
        [self presentViewController:alert animated:YES completion:nil];
    }
}



#pragma mark - message compose delegate method

-(void)messageComposeViewController:(MFMessageComposeViewController *)controller didFinishWithResult:(MessageComposeResult)result {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}



#pragma mark - nsnotifications methods

-(void)registerForNotifications {
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(respondToNoPhoneNumber:) name:NoPhoneNumberNotificationKey object:nil];
    
    }


-(void)respondToNoPhoneNumber:(NSNotification *)notification {
    
    // send notification to vc to present alert view "this person does not have a phone number on file"
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Oops!" message:@"This person does not have a phone number on file" preferredStyle:UIAlertControllerStyleAlert];
    
    [alert addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil]];
    
    [self presentViewController:alert animated:YES completion:nil];
}


-(void)unregisterForNotifications {
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name: NoPhoneNumberNotificationKey object:nil];
}


-(void)dealloc {
    
    [self unregisterForNotifications];
}



#pragma mark - mfmailcompose delegate methods
-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    [self.selectedMaterials removeAllObjects];
    [self.linksArray removeAllObjects];
    
}


#pragma mark - load tableview with data
-(void)loadPeopleFromBuddy {
// load pictures from Buddy
[Buddy GET:@"/pictures" parameters:nil class:[BPPageResults class] callback:^(id obj, NSError *error) {
    
    if (!error) {
        // Your callback code here
        BPPageResults *searchResults = (BPPageResults*)obj;
        self.people = [searchResults convertPageResultsToType:[BPPicture class]];
        [self.tableView reloadData];
        NSLog(@"PEOPLE: %@", self.people);
        
    } else {
        
        NSLog(@"ERROR: %@", error);
    }
}];
}



#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    // Get the new view controller using [segue destinationViewController].
//    if ([segue.identifier isEqualToString:@"showMaterials"]) {
//        UINavigationController *navController = [segue destinationViewController];
//        MaterialsTableViewController *MaterialsVC = navController.viewControllers.firstObject;
    
        // Pass the selected object to the new view controller (NOT WORKING) MaterialsVC.person is nil (maybe because i already assigned self.person to cell.person when i was configuring the cell)
//        MaterialsVC.person = self.person;
        
//    }
}

@end
