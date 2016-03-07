//
//  HomeViewController.m
//  QuickMARSales
//
//  Created by Dalton on 10/12/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "HomeViewController.h"
#import "Appearance.h"

@interface HomeViewController ()

@property (weak, nonatomic) IBOutlet YTPlayerView *playerView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // load youtube video into player view
    [self.playerView loadWithVideoId:@"C9mUlUB43kk"];
    self.playerView.delegate = self;
    
    [Appearance initializeAppearanceDefaults];
    
    self.navigationController.navigationBar.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.navigationController.navigationBar.layer.shadowOffset = CGSizeMake(0, 4);
    self.navigationController.navigationBar.layer.shadowOpacity = 0.5;
    self.navigationController.navigationBar.layer.shadowRadius = 2.0;
    

}


- (IBAction)doneButtonTapped:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)playerViewDidBecomeReady:(YTPlayerView *)playerView {
    [self.playerView playVideo];
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
