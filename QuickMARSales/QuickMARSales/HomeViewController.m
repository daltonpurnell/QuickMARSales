//
//  HomeViewController.m
//  QuickMARSales
//
//  Created by Dalton on 10/12/15.
//  Copyright © 2015 Dalton. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

//@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;
@property (weak, nonatomic) IBOutlet YTPlayerView *playerView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // load youtube video into player view
    [self.playerView loadWithVideoId:@"4LhHBE2RyqY"];
    self.tabBarController.tabBar.barTintColor =  [UIColor colorWithRed:0.533 green:0.764 blue:0.216 alpha:1.000];
    self.tabBarController.tabBar.tintColor = [UIColor whiteColor];
    self.playerView.delegate = self;
}


- (IBAction)doneButtonTapped:(id)sender {
    
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

-(void)playerViewDidBecomeReady:(YTPlayerView *)playerView
{ [[NSNotificationCenter defaultCenter] postNotificationName:@"Playback started" object:self];
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
