//
//  BBSBackgroundItem.h
//  BBSImageBackgroundView
//
//  Created by Gustavo Barbosa on 6/27/14.
//  Copyright (c) 2014 Gustavo Barbosa. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBSBackgroundItem : NSObject

@property (nonatomic, strong) UIImage *image;

- (instancetype)initWithImage:(UIImage *)image;
+ (instancetype)itemWithImage:(UIImage *)image;

@end
