//
//  TwoChoiceEditField.h
//  Bleed
//
//  Created by Ernesto Freyre on 21/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TwoChoiceEditField : UIView

-(id)initWithFrame:(CGRect)frame label:(NSString*)label value:(NSString*)value choices:(NSArray*)choices;
-(NSString*)getEntry;
-(void)tapDetected;

@end
