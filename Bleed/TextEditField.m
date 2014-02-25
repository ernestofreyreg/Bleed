//
//  TextEditField.m
//  Bleed
//
//  Created by Ernesto Freyre on 20/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import "TextEditField.h"

@interface TextEditField ()

@property UITextField *entry;

@end

@implementation TextEditField 



-(id)initWithFrame:(CGRect)frame label:(NSString*)label value:(NSString*)value placeholder:(NSString*)placeholder
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
        
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
        
        _entry = [[UITextField alloc] initWithFrame:CGRectMake(64.5,(frame.size.height-entryFontSize)/2,frame.size.width-13-64.5,entryFontSize)];
        _entry.placeholder=placeholder;
        _entry.text = value;
        _entry.textColor = [UIColor colorWithWhite:1.0f alpha:0.9f];
        
        _entry.font = entryFont;
        _entry.clearButtonMode=UITextFieldViewModeWhileEditing;
        [self addSubview:_entry];
    

        
        
    }
    return self;
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
