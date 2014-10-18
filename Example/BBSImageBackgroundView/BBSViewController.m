//
//  BBSViewController.m
//  BBSImageBackgroundView
//
//  Created by Gustavo Barbosa on 06/27/2014.
//  Copyright (c) 2014 Gustavo Barbosa. All rights reserved.
//

#import "BBSViewController.h"
#import "BBSImageBackgroundView.h"


@interface BBSViewController () <UIAlertViewDelegate, BBSImageBackgroundViewDelegate>

@property (nonatomic, weak) IBOutlet UIButton *gradientButton;

@end


@implementation BBSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = _gradientButton.bounds;
    gradient.colors = @[(id)[[UIColor clearColor] CGColor],
                        (id)[[UIColor blackColor] CGColor]];
    [_gradientButton.layer insertSublayer:gradient atIndex:0];
    
    NSArray *imageNames = @[@"green-bike.jpg", @"greece.jpg", @"dude-walkin.jpg"];
    BBSBackgroundItem *item1 = [BBSBackgroundItem itemWithImage:[UIImage imageNamed:imageNames[0]]];
    BBSBackgroundItem *item2 = [BBSBackgroundItem itemWithImage:[UIImage imageNamed:imageNames[1]]];
    BBSBackgroundItem *item3 = [BBSBackgroundItem itemWithImage:[UIImage imageNamed:imageNames[2]]];
    
    BBSImageBackgroundView *view = (BBSImageBackgroundView *)self.view;
    view.delegate = self;
    view.items = @[item1, item2, item3];
}

- (IBAction)openConfirmationAlert
{
    NSString *message = @"Do you want to open Safari and view more awesome photos?";
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hey!"
                                                    message:message
                                                   delegate:self
                                          cancelButtonTitle:@"No"
                                          otherButtonTitles:@"Yes", nil];
    [alert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if (buttonIndex != alertView.cancelButtonIndex) {
        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://unsplash.com"]];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma mark - BBSImageBackgroundViewDelegate

- (void)imageBackgroundView:(BBSImageBackgroundView *)imageBackgroundView
         willChangeFromItem:(BBSBackgroundItem *)fromItem
                     toItem:(BBSBackgroundItem *)toItem
{
    NSLog(@"Will change image");
}

- (void)imageBackgroundView:(BBSImageBackgroundView *)imageBackgroundView
          didChangeFromItem:(BBSBackgroundItem *)fromItem
                     toItem:(BBSBackgroundItem *)toItem
{
    NSLog(@"Did change image");
}

@end
