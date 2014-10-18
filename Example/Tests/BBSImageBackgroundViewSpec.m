//
//  BBSImageBackgroundViewSpec.m
//  BBSImageBackgroundView
//
//  Created by Gustavo Barbosa on 10/12/14.
//  Copyright 2014 Gustavo Barbosa. All rights reserved.
//

#import <objc/runtime.h>

#import "Specta.h"
#import "BBSImageBackgroundView.h"


SpecBegin(BBSImageBackgroundView)

describe(@"BBSImageBackgroundView", ^{

    it(@"should have an array of items", ^{

        BBSBackgroundItem *item1 = [BBSBackgroundItem new];
        BBSBackgroundItem *item2 = [BBSBackgroundItem new];
        BBSImageBackgroundView *bbsView = [BBSImageBackgroundView new];
        bbsView.items = @[item1, item2];

        expect(bbsView.items[0]).to.equal(item1);
        expect(bbsView.items[1]).to.equal(item2);
    });

    it(@"can be instantiated passing an array of items", ^{

        BBSBackgroundItem *item1 = [BBSBackgroundItem new];
        BBSBackgroundItem *item2 = [BBSBackgroundItem new];
        BBSImageBackgroundView *bbsView = [[BBSImageBackgroundView alloc] initWithItems:@[item1, item2]];

        expect(bbsView.items[0]).to.equal(item1);
        expect(bbsView.items[1]).to.equal(item2);
    });

    it(@"should receive a time interval", ^{
        
        BBSImageBackgroundView *bbsView = [BBSImageBackgroundView new];
        bbsView.timeInterval = 1.0f;
        
        expect(bbsView.timeInterval).to.equal(1.0f);
    });

    describe(@"delegate", ^{

        it(@"should have a method to handle events before image transition", ^{

            struct objc_method_description hasMethod = protocol_getMethodDescription(@protocol(BBSImageBackgroundViewDelegate), @selector(imageBackgroundView:willChangeFromItem:toItem:), NO, YES);
            
            expect(hasMethod.name).toNot.beNil;
        });

        it(@"should have a method to handle events after image transition", ^{

            struct objc_method_description hasMethod = protocol_getMethodDescription(@protocol(BBSImageBackgroundViewDelegate), @selector(imageBackgroundView:didChangeFromItem:toItem:), NO, YES);
            
            expect(hasMethod.name).toNot.beNil();
        });
    });
});

SpecEnd
