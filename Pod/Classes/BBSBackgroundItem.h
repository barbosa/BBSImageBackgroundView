//
//  BBSBackgroundItem.h
//  Pods
//
//  Created by Gustavo Barbosa on 6/27/14.
//  Copyright (c) 2014 Gustavo Barbosa. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, BBSBackgroundItemAnimationStyle) {
    BBSBackgroundItemAnimationStyleNoAnimation = 0
};

@interface BBSBackgroundItem : NSObject

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, assign) BBSBackgroundItemAnimationStyle animationStyle;

- (instancetype)initWithImage:(UIImage *)image;

- (instancetype)initWithImage:(UIImage *)image
               animationStyle:(BBSBackgroundItemAnimationStyle)animationStyle;

@end
