//
//  BBSImageBackgroundView.m
//  Pods
//
//  Created by Gustavo Barbosa on 6/28/14.
//
//

#import "BBSImageBackgroundView.h"
#import "BBSBackgroundItem.h"

static NSTimeInterval const kDefaultTimeInterval = 8.0;

@interface BBSImageBackgroundView ()
{
    BOOL _isPlaying;
    __block NSUInteger currentIndex;
}
@property (nonatomic, strong) UIImageView *imageView;

@end


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

- (UIImageView *)imageView
{
    if (!_imageView) {
        self.imageView = [[UIImageView alloc] init];
        _imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _imageView;
}

#pragma mark - Drawing

- (void)drawRect:(CGRect)rect
{
    [self addSubview:self.imageView];
    _imageView.frame = self.bounds;
    
    if (!_isPlaying) {
        [self play];
    }
}

#pragma mark - Animations

- (void)play
{
    _isPlaying = YES;
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(changeCurrentImage:) userInfo:nil repeats:YES];
    [timer fire];
}

- (void)changeCurrentImage:(NSTimer *)timer
{
    NSLog(@"%lu", (unsigned long)currentIndex);
    
    [UIView transitionWithView:_imageView
                      duration:1.0
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:^{
                        UIImage *nextImage = [_items[currentIndex] image];
                        _imageView.image = nextImage;
                    } completion:^(BOOL finished) {
                        currentIndex++;
                        if (currentIndex == _items.count)
                            currentIndex = 0;
                    }];
}

- (void)stop
{
    _isPlaying = NO;
}

@end
