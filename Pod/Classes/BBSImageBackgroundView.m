//
//  BBSImageBackgroundView.m
//  Pods
//
//  Created by Gustavo Barbosa on 6/28/14.
//
//

#import "BBSImageBackgroundView.h"

static NSTimeInterval const kDefaultTimeInterval = 5.0;


@implementation BBSImageBackgroundView

#pragma mark - Constructors

- (instancetype)initWithItems:(NSArray *)items
{
    self = [super init];
    if (self) {
        self.items = items;
    }
    return self;
}

#pragma mark - Acessors

- (NSTimeInterval)timeInterval
{
    return _timeInterval ?: kDefaultTimeInterval;
}

@end
