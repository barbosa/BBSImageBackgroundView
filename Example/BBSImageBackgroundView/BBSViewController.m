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

@interface BBSViewController ()

@end


@implementation BBSViewController

- (void)loadView
{
    BBSBackgroundItem *item1 = [[BBSBackgroundItem alloc] initWithImage:[UIImage imageNamed:@"green-bike.jpg"]
                                                         animationStyle:BBSBackgroundItemAnimationStyleNoAnimation];
    BBSBackgroundItem *item2 = [[BBSBackgroundItem alloc] initWithImage:[UIImage imageNamed:@"greece.jpg"]
                                                         animationStyle:BBSBackgroundItemAnimationStyleNoAnimation];
    BBSBackgroundItem *item3 = [[BBSBackgroundItem alloc] initWithImage:[UIImage imageNamed:@"dude-walkin.jpg"]
                                                         animationStyle:BBSBackgroundItemAnimationStyleNoAnimation];
    
    BBSImageBackgroundView *view = [[BBSImageBackgroundView alloc] initWithItems:@[item1, item2, item3]];
    self.view = view;
}

@end
