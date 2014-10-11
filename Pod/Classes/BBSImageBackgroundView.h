//
//  BBSImageBackgroundView.h
//  BBSImageBackgroundView
//
//  Created by Gustavo Barbosa on 6/28/14.
//  Copyright (c) 2014 Gustavo Barbosa. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BBSBackgroundItem.h"

@class BBSImageBackgroundView;

@protocol BBSImageBackgroundViewDelegate <NSObject>

@optional
- (void)imageBackgroundView:(BBSImageBackgroundView *)imageBackgroundView
         willChangeFromItem:(BBSBackgroundItem *)fromItem
                     toItem:(BBSBackgroundItem *)toItem;
- (void)imageBackgroundView:(BBSImageBackgroundView *)imageBackgroundView
          didChangeFromItem:(BBSBackgroundItem *)fromItem
                     toItem:(BBSBackgroundItem *)toItem;
@end


@interface BBSImageBackgroundView : UIView

@property (nonatomic, copy) NSArray *items;
@property (nonatomic, assign) NSTimeInterval timeInterval;

@property (nonatomic, weak) id<BBSImageBackgroundViewDelegate> delegate;

- (instancetype)initWithItems:(NSArray *)items;

@end
