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

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



#pragma mark - scrollview delegate method
-(UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.imageView;
}


@end
