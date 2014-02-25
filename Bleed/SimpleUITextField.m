//
//  SimpleUITextField.m
//  Bleed
//
//  Created by Ernesto Freyre on 20/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import "SimpleUITextField.h"

@implementation SimpleUITextField

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    
    self.autocorrectionType = UITextAutocorrectionTypeNo;
    self.autocapitalizationType = UITextAutocapitalizationTypeNone;
    CALayer *layer = self.layer;
    layer.backgroundColor = [[UIColor whiteColor] CGColor];
    layer.cornerRadius = 15.0;
    layer.masksToBounds = YES;
    layer.borderWidth = 1.0;
    layer.borderColor = [[UIColor colorWithRed:0 green:0 blue:0 alpha:1] CGColor];
    [layer setShadowColor: [[UIColor blackColor] CGColor]];
    [layer setShadowOpacity:1];
    [layer setShadowOffset: CGSizeMake(0, 2.0)];
    [layer setShadowRadius:5];
    [self setClipsToBounds:NO];
    [self setContentVerticalAlignment:UIControlContentVerticalAlignmentCenter];
    [self setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
}
- (CGRect)textRectForBounds:(CGRect)bounds {
    return CGRectMake(bounds.origin.x + 20, bounds.origin.y + 8,
                      bounds.size.width - 40, bounds.size.height - 16);
}
- (CGRect)editingRectForBounds:(CGRect)bounds {
    return [self textRectForBounds:bounds];
}

@end
