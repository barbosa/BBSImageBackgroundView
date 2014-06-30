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
@property (nonatomic, weak) IBOutlet UIButton *gradientButton;
@end


@implementation BBSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.frame = _gradientButton.bounds;
    gradient.colors = [NSArray arrayWithObjects:(id)[[UIColor clearColor] CGColor], (id)[[UIColor blackColor] CGColor], nil];
    [_gradientButton.layer insertSublayer:gradient atIndex:0];
    
    BBSBackgroundItem *item1 = [[BBSBackgroundItem alloc] initWithImage:[UIImage imageNamed:@"green-bike.jpg"]
                                                         animationStyle:BBSBackgroundItemAnimationStyleNoAnimation];
    BBSBackgroundItem *item2 = [[BBSBackgroundItem alloc] initWithImage:[UIImage imageNamed:@"greece.jpg"]
                                                         animationStyle:BBSBackgroundItemAnimationStyleNoAnimation];
    BBSBackgroundItem *item3 = [[BBSBackgroundItem alloc] initWithImage:[UIImage imageNamed:@"dude-walkin.jpg"]
                                                         animationStyle:BBSBackgroundItemAnimationStyleNoAnimation];
    
    BBSImageBackgroundView *view = [[BBSImageBackgroundView alloc] initWithItems:@[item1, item2, item3]];
    view.frame = self.view.bounds;
    [self.view insertSubview:view atIndex:0];
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

@end
