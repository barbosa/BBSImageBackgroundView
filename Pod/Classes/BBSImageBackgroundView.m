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
    BOOL _loaded;
    Direction _direction;
    __block NSUInteger _currentIndex;
}
@property (nonatomic, strong) UIImageView *imageView;

@end


#pragma mark - Class implementation

@implementation BBSImageBackgroundView

#pragma mark - Constructors

- (id)init
{
    return [self initWithItems:@[]];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.items = @[];
        _direction = LEFT;
    }
    return self;
}

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
    if (!_loaded) {
        [self insertSubview:self.imageView atIndex:0];
        _imageView.frame = self.bounds;
    
        if (_items.count) {
            _imageView.image = [[_items firstObject] image];
            [self changeCurrentImage];
        }
        
        _loaded = YES;
    }
}

#pragma mark - Animations

- (void)changeCurrentImage
{   
    CGAffineTransform transform = CGAffineTransformTranslate(_imageView.transform, _direction * 100, 0);
    [UIView animateWithDuration:self.timeInterval animations:^{
        _imageView.transform = transform;
    } completion:^(BOOL finished) {
        
        [self toggleDirection];
        
        _currentIndex++;
        if (_currentIndex == _items.count)
            _currentIndex = 0;
        
        UIImage *nextImage = [_items[_currentIndex] image];
        [UIView transitionWithView:_imageView
                          duration:1.0
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            _imageView.image = nextImage;
                        } completion:^(BOOL finished) {
                            [self changeCurrentImage];
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
