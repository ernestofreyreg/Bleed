//
//  BasicViewController.h
//  Bleed
//
//  Created by Ernesto Freyre on 20/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BasicViewController : UIViewController

- (id)initWithTitle:(NSString *)title;
- (NSString*)leftButton;
- (NSString*)rightButton;
- (void)leftButtonTouched:(UIButton *)sender;
- (void)rightButtonTouched:(UIButton *)sender;

@end
