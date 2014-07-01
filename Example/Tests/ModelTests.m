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
    
    it(@"responds to an animation style", ^{
        BBSBackgroundItemAnimationStyle animationStyle = BBSBackgroundItemAnimationStyleNoAnimation;
        _item.animationStyle = animationStyle;
        expect(@(_item.animationStyle)).equal(@(animationStyle));
    });
    
    it(@"can be instantianted directly with an image and an animation style", ^{
        UIImage *fakeImage = [UIImage new];
        BBSBackgroundItemAnimationStyle fakeAnimationStyle = BBSBackgroundItemAnimationStyleNoAnimation;
        
        _item = [[BBSBackgroundItem alloc] initWithImage:fakeImage
                                          animationStyle:fakeAnimationStyle];
        
        expect(_item.image).equal(fakeImage);
        expect(_item.animationStyle).equal(fakeAnimationStyle);
    });
});

SpecEnd
