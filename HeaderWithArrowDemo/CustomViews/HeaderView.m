//
//  HeaderView.m
//  HeaderWithArrowDemo
//
//  Created by Derek Yang on 05/04/12.
//  Copyright (c) 2012 Derek Yang. All rights reserved.
//

#import "HeaderView.h"

#define ARROW_LEFT_X 26

@interface HeaderView ()

@property(nonatomic, retain) UIImage *avatarImage;
@property(nonatomic, retain) UIImage *arrowImage;

- (void)initializeState;
- (void)setUpArrow:(CGRect)frame;

- (void)drawAvatar:(CGContextRef)context;
- (void)drawBackgroundIn:(CGRect)rect context:(CGContextRef)context;

@end

@implementation HeaderView

@synthesize avatarImage = _avatarImage;
@synthesize arrowImage = _arrowImage;

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initializeState];
        [self setUpArrow:frame];
    }
    return self;
}

- (void)initializeState {
    self.alpha = 0.9;
    self.backgroundColor = [UIColor clearColor];
    self.avatarImage = [UIImage imageNamed:@"avatar.png"];
    self.arrowImage = [UIImage imageNamed:@"arrow.png"];
}

- (void)setUpArrow:(CGRect)frame {
    // Set up an imageView in order to display the arrow - The image view is placed right below the bottom so that
    // the arrow appears 'peeking out'
    UIImageView *arrowImageView = [[UIImageView alloc] initWithImage:self.arrowImage];
    arrowImageView.frame = CGRectMake(ARROW_LEFT_X, frame.size.height, self.arrowImage.size.width, self.arrowImage.size.height);
    arrowImageView.alpha = 0.9;
    [self addSubview:arrowImageView];
}

- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self drawBackgroundIn:rect context:context];
    [self drawAvatar:context];
}

- (void)drawBackgroundIn:(CGRect)rect context:(CGContextRef)context {
    // Draws the dark area which serves as the background of the entire header view. Other views (such as avatar and slider)
    // will be all drawn on top of this.
    CGContextSetFillColorWithColor(context,
            [UIColor colorWithRed:39.0 / 255.0 green:39.0 / 255.0 blue:40.0 / 255.0 alpha:1.0].CGColor);
    CGContextAddRect(context, rect);
    CGContextFillPath(context);
}

- (void)drawAvatar:(CGContextRef)context {
    CGRect avatarRect = CGRectMake(10, 10, 46, 46);
    UIBezierPath *avatarPath = [UIBezierPath bezierPathWithRoundedRect:avatarRect cornerRadius:4];
    CGContextAddPath(context, avatarPath.CGPath);
    CGContextClip(context);
    [self.avatarImage drawInRect:avatarRect];
}

@end
