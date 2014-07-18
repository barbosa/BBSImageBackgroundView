//
//  BBSBackgroundItem.m
//  Pods
//
//  Created by Gustavo Barbosa on 6/27/14.
//  Copyright (c) 2014 Gustavo Barbosa. All rights reserved.
//

#import "BBSBackgroundItem.h"

@implementation BBSBackgroundItem

- (instancetype)initWithImage:(UIImage *)image
{
    return [self initWithImage:image animationStyle:BBSBackgroundItemAnimationStyleNoAnimation];
}

- (instancetype)initWithImage:(UIImage *)image
               animationStyle:(BBSBackgroundItemAnimationStyle)animationStyle
{
    self = [super init];
    if (self) {
        self.image = image;
        self.animationStyle = animationStyle;
    }
    return self;
}

@end
