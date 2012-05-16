//
//  ReviewCell.m
//  HeaderWithArrowDemo
//
//  Created by Derek Yang on 05/04/12.
//  Copyright (c) 2012 Derek Yang. All rights reserved.
//

#import "ReviewCell.h"

#define IMAGE_HEIGHT 320

@implementation ReviewCell

@synthesize image = _image;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    [self setNeedsDisplay];
}

- (void)drawRect:(CGRect)rect {
    [self.image drawInRect:rect];
}

+ (CGFloat)cellHeight {
    // This both encapsulates the height within the ReviewCell class, and provides
    // an approach for calling client (e.g. ReviewsViewController) to access the height
    // without duplicating that information all over the place.
    return IMAGE_HEIGHT;
}

@end
