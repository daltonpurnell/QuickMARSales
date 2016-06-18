//
//  DocView.m
//  QuickMARSales
//
//  Created by Dalton on 3/28/16.
//  Copyright © 2016 Dalton. All rights reserved.
//

#import "DocView.h"

@interface DocView ()
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation DocView


-(void)viewWillAppear:(BOOL)animated {
    self.title = self.vcTitle;
    self.imageView.image = self.image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.scrollView.minimumZoomScale=0.5;
    self.scrollView.maximumZoomScale=6.0;
    self.scrollView.contentSize=CGSizeMake(1280, 960);
    self.scrollView.delegate=self;
}

- (IBAction)doneTapped:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - scrollview delegate method
-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}


@end
