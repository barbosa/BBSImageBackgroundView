//
//  BBSImageBackgroundView.m
//  Pods
//
//  Created by Gustavo Barbosa on 6/28/14.
//
//

#import "BBSImageBackgroundView.h"
#import "BBSBackgroundItem.h"


#pragma mark - Constants

static NSTimeInterval const kDefaultTimeInterval = 8.0;


#pragma mark - Definitions

typedef NS_ENUM(NSInteger, Direction) {
    LEFT = -1,
    RIGHT = 1
};


#pragma mark - Class Extension

@interface BBSImageBackgroundView ()
{
    Direction _direction;
    __block NSUInteger _currentIndex;
}
@property (nonatomic, strong) UIImageView *imageView;

@end


#pragma mark - Class implementation

@implementation BBSImageBackgroundView

#pragma mark - Constructors

- (instancetype)initWithItems:(NSArray *)items
{
    self = [super init];
    if (self) {
        self.items = items;
        _direction = LEFT;
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
    
    if (_items.count) {
        _imageView.image = [[_items firstObject] image];
        [self play];
    }
}

#pragma mark - Animations

- (void)play
{
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:self.timeInterval target:self selector:@selector(changeCurrentImage:) userInfo:nil repeats:YES];
    [timer fire];
}

- (void)changeCurrentImage:(NSTimer *)timer
{
    NSLog(@"%lu", (unsigned long)_currentIndex);
    
    CGAffineTransform transform = CGAffineTransformTranslate(_imageView.transform, _direction * 100, 0);
    [UIView animateWithDuration:self.timeInterval animations:^{
        _imageView.transform = transform;
    } completion:^(BOOL finished) {
        
        [self toggleDirection];
        
        [UIView transitionWithView:_imageView
                          duration:1.0
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            UIImage *nextImage = [_items[_currentIndex] image];
                            _imageView.image = nextImage;
                            
                        } completion:^(BOOL finished) {
                            _currentIndex++;
                            if (_currentIndex == _items.count)
                                _currentIndex = 0;
                        }];
    }];
}

- (void)toggleDirection
{
    if (_direction == LEFT)
        _direction = RIGHT;
    else
        _direction = LEFT;
}


@end
