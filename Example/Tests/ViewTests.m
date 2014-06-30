//
//  ViewTests.m
//  BBSImageBackgroundView
//
//  Created by Gustavo Barbosa on 6/28/14.
//  Copyright (c) 2014 Gustavo Barbosa. All rights reserved.
//

#import "BBSImageBackgroundView.h"
#import "BBSBackgroundItem.h"

SpecBegin(ViewSpecs)

describe(@"BBSImageBackgroundView", ^{
    
    __block BBSImageBackgroundView *_view;
    
    beforeEach(^{
        _view = [BBSImageBackgroundView new];
    });
    
    it(@"should receive a list of items", ^{
        BBSBackgroundItem *item1 = [BBSBackgroundItem new];
        BBSBackgroundItem *item2 = [BBSBackgroundItem new];
        
        _view.items = @[item1, item2];
        
        expect(_view.items[0]).equal(item1);
        expect(_view.items[1]).equal(item2);
    });
    
    it(@"should receive an interval between items", ^{
        _view.timeInterval = 3.0;
        expect(@(_view.timeInterval)).equal(@3.0);
    });
    
    it(@"should have a default interval time of 5", ^{
        expect(@(_view.timeInterval)).equal(@5.0);
    });
    
    it(@"can be instantiated with an array of items", ^{
        BBSBackgroundItem *item = [BBSBackgroundItem new];
        _view = [[BBSImageBackgroundView alloc] initWithItems:@[item]];
        expect(_view.items[0]).equal(item);
    });
    
});

SpecEnd