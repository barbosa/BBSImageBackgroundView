//
//  BBSImageBackgroundView.h
//  BBSImageBackgroundView
//
//  Created by Gustavo Barbosa on 6/28/14.
//  Copyright (c) 2014 Gustavo Barbosa. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BBSImageBackgroundView : UIView

@property (nonatomic, copy) NSArray *items;
@property (nonatomic, assign) NSTimeInterval timeInterval;

- (instancetype)initWithItems:(NSArray *)items;

@end
