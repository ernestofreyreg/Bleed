//
//  TwoStateImageButton.m
//  Bleed
//
//  Created by Ernesto Freyre on 23/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import "TwoStateImageButton.h"

@interface TwoStateImageButton ()

@property CGFloat bgAlpha;

@end

@implementation TwoStateImageButton

-(id)initWithFrame:(CGRect)frame image:(UIImage*)image label:(NSString*)label
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        self.userInteractionEnabled = YES;
        _bgAlpha = 0.28;
        
        // Icon
        UIImageView *icon = [[UIImageView alloc] initWithFrame:CGRectMake(60, (frame.size.height-30)/2, 30, 30)];
        [icon setImage:image];
        [self addSubview:icon];
        
        // Text
        int labelFontSize = 10;
        UIFont *labelFont = [UIFont fontWithName:@"norwester" size:labelFontSize];
        UILabel *labelText = [ [UILabel alloc ] initWithFrame:CGRectMake(112, (frame.size.height-labelFontSize)/2, frame.size.width-112, labelFontSize)];
        labelText.textColor = [UIColor colorWithWhite:0.7f alpha:1.0f];
        labelText.numberOfLines = 0;
        labelText.font = labelFont;
        labelText.shadowColor = [UIColor colorWithWhite:0 alpha:0.3];
        labelText.shadowOffset = CGSizeMake(1.0f, 1.0f);
        labelText.text = label;
        [labelText sizeToFit];
        labelText.frame = CGRectMake(labelText.frame.origin.x, (frame.size.height-labelText.frame.size.height)/2, labelText.frame.size.width, labelText.frame.size.height);
        [self addSubview:labelText];
        
        
//        // Tap on _entry to change its values
//        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
//        singleTap.numberOfTapsRequired = 1;
//        _entry.userInteractionEnabled = YES;
//        [_entry addGestureRecognizer:singleTap];
//        
        
    }
    return self;

}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    _bgAlpha = 0.50;
    [self display];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    _bgAlpha = 0.28;
    [self display];
}


- (void)display
{
    CALayer *layer = self.layer;
    [layer setNeedsDisplay];
    [layer displayIfNeeded];
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:_bgAlpha] setFill];
    UIRectFill(rect);
}


@end
