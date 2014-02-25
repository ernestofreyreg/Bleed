//
//  TextEditField.h
//  Bleed
//
//  Created by Ernesto Freyre on 20/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TextEditField : UIView

-(id)initWithFrame:(CGRect)frame label:(NSString*)label value:(NSString*)value placeholder:(NSString*)placeholder;
-(NSString*)getEntry;

@end
