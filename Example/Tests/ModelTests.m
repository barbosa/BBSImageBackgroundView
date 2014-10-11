//
//  ModelTests.m
//  BBSImageBackgroundView
//
//  Created by Gustavo Barbosa on 06/27/2014.
//  Copyright (c) 2014 Gustavo Barbosa. All rights reserved.
//

#import "BBSBackgroundItem.h"

SpecBegin(ModelSpecs)

describe(@"Background item", ^{
    
    __block BBSBackgroundItem *_item;
    
    beforeEach(^{
        _item = [BBSBackgroundItem new];
    });
    
    it(@"responds to an image property", ^{
        UIImage *fakeImage = [UIImage new];
        _item.image = fakeImage;
        expect(_item.image).equal(fakeImage);
    });

    it(@"can be instantianted directly with an image", ^{
        UIImage *fakeImage = [UIImage new];
        _item = [[BBSBackgroundItem alloc] initWithImage:fakeImage];
        
        expect(_item.image).equal(fakeImage);
    });
});

SpecEnd
