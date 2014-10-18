//
//  BBSBackgroundItem.m
//  BBSImageBackgroundView
//
//  Created by Gustavo Barbosa on 6/27/14.
//  Copyright (c) 2014 Gustavo Barbosa. All rights reserved.
//

#import "BBSBackgroundItem.h"

@implementation BBSBackgroundItem

- (instancetype)initWithImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        self.image = image;
    }
    return self;
}

+ (instancetype)itemWithImage:(UIImage *)image
{
    return [[self alloc] initWithImage:image];
}

@end
