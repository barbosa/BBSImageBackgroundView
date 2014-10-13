//
//  BBSBackgroundItemSpec.m
//  BBSImageBackgroundView
//
//  Created by Gustavo Barbosa on 10/12/14.
//  Copyright 2014 Gustavo Barbosa. All rights reserved.
//

#import "BBSBackgroundItem.h"

SpecBegin(BBSBackgroundItem)

describe(@"BBSBackgroundItem", ^{
    
    it(@"should have an image property", ^{
        UIImage *image = [UIImage new];
        BBSBackgroundItem *item = [BBSBackgroundItem new];
        item.image = image;
        assert(item.image == image);
    });  

    it(@"can be instantiated passing an image", ^{
        UIImage *image = [UIImage new];
        BBSBackgroundItem *item = [[BBSBackgroundItem alloc] initWithImage:image];
        assert(item.image == image);
    });
});

SpecEnd
