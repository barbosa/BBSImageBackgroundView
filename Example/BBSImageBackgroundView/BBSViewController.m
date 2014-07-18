//
//  BBSViewController.m
//  BBSImageBackgroundView
//
//  Created by Gustavo Barbosa on 06/27/2014.
//  Copyright (c) 2014 Gustavo Barbosa. All rights reserved.
//

#import "BBSViewController.h"

#import "BBSBackgroundItem.h"
#import "BBSImageBackgroundView.h"

@interface BBSViewController () <UIAlertViewDelegate>
{
    CAGradientLayer *gradient;
}
@property (nonatomic, weak) IBOutlet UIButton *gradientButton;
@end


@implementation BBSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    BBSBackgroundItem *item1 = [[BBSBackgroundItem alloc] initWithImage:[UIImage imageNamed:@"green-bike.jpg"]];
    BBSBackgroundItem *item2 = [[BBSBackgroundItem alloc] initWithImage:[UIImage imageNamed:@"greece.jpg"]];
    BBSBackgroundItem *item3 = [[BBSBackgroundItem alloc] initWithImage:[UIImage imageNamed:@"dude-walkin.jpg"]];
    
    [(BBSImageBackgroundView *)self.view setItems:@[item1, item2, item3]];
    
    [self addGradientLayer];
}

- (void)addGradientLayer
{
    gradient = [CAGradientLayer layer];
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor], (id)[[UIColor blackColor] CGColor], nil];
    [_gradientButton.layer insertSublayer:gradient atIndex:0];
}

- (IBAction)openConfirmationAlert
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Hey!"
                                                    message:@"Do you want to open Safari and view more awesome photos?"
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

- (BOOL)shouldAutorotate
{
    gradient.frame = _gradientButton.bounds;
    return YES;
}

@end
