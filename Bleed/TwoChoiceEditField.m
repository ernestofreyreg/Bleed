//
//  TwoChoiceEditField.m
//  Bleed
//
//  Created by Ernesto Freyre on 21/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import "TwoChoiceEditField.h"

@interface TwoChoiceEditField ()

@property UILabel *entry;
@property NSArray *choices;

@end

@implementation TwoChoiceEditField


-(id)initWithFrame:(CGRect)frame label:(NSString*)label value:(NSString*)value choices:(NSArray*)choices;
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        _choices = choices;
        
        // Label
        int labelFontSize = 11;
        UIFont *labelFont = [UIFont fontWithName:@"norwester" size:labelFontSize];
        UILabel *labelUsername = [ [UILabel alloc ] initWithFrame:CGRectMake(13, (frame.size.height-labelFontSize)/2, frame.size.width-13, labelFontSize)];
        labelUsername.textColor = [UIColor colorWithWhite:1.0f alpha:0.7f];
        labelUsername.font = labelFont;
        labelUsername.shadowColor = [UIColor colorWithWhite:0 alpha:0.3];
        labelUsername.shadowOffset = CGSizeMake(1.0f, 1.0f);
        labelUsername.text = label;
        [labelUsername sizeToFit];
        [self addSubview:labelUsername];
        
        // Text Entry
        int entryFontSize = 20;
        UIFont *entryFont = [UIFont fontWithName:@"norwester" size:entryFontSize];
        
        _entry = [[UILabel alloc] initWithFrame:CGRectMake(64.5,(frame.size.height-entryFontSize)/2,frame.size.width-13-64.5,entryFontSize)];
        _entry.text = value;
        _entry.textColor = [UIColor colorWithWhite:1.0f alpha:0.9f];
        _entry.font = entryFont;
        [self addSubview:_entry];
        
        
        // Tap on _entry to change its values
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
        singleTap.numberOfTapsRequired = 1;
        _entry.userInteractionEnabled = YES;
        [_entry addGestureRecognizer:singleTap];

        
    }
    return self;
}

-(void)tapDetected
{
    NSString *val = [_entry text];
    int i=0;
    for (;i<[_choices count]; i++) {
        NSString *tmp = [_choices objectAtIndex:i];
        if ([tmp isEqualToString:val]) {
            break;
        }
    }
    i = (i+1>=[_choices count])?0:i+1;
    _entry.text = [_choices objectAtIndex:i];
}


-(NSString*)getEntry
{
    return [_entry text];
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.28] setFill];
    UIRectFill(rect);
}


@end
