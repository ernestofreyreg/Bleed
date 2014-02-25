//
//  TwoStateImageButton.h
//  Bleed
//
//  Created by Ernesto Freyre on 23/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoStateImageButton : UIView

-(id)initWithFrame:(CGRect)frame image:(UIImage*)image label:(NSString*)label;
//-(void)tapDetected;
- (void)display;

@end
