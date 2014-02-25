//
//  PaddingView.m
//  Bleed
//
//  Created by Ernesto Freyre on 24/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import "PaddingView.h"

@implementation PaddingView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.opaque = NO;
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
    [[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.28] setFill];
    UIRectFill(rect);
}


@end
