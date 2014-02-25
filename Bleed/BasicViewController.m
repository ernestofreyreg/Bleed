//
//  BasicViewController.m
//  Bleed
//
//  Created by Ernesto Freyre on 20/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import "BasicViewController.h"

@interface BasicViewController ()

@end

@implementation BasicViewController

- (id)initWithTitle:(NSString *)title
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        CGRect screen = [[UIScreen mainScreen] bounds];
        // Background
        UIImageView *background = [[UIImageView alloc] initWithFrame:screen];
        [background setImage:[UIImage imageNamed:@"background.png"]];
        background.contentMode = UIViewContentModeScaleAspectFill;
        [self.view addSubview:background];
        
        // Title
        int labelFontSize = 25;
        UIFont *labelFont = [UIFont fontWithName:@"norwester" size:labelFontSize];
        UILabel *labelTitle = [ [UILabel alloc ] initWithFrame:CGRectMake(0, 26, screen.size.width, labelFontSize)];
        labelTitle.textColor = [UIColor colorWithWhite:1.0f alpha:0.9f];
        labelTitle.font = labelFont;
        labelTitle.shadowColor = [UIColor colorWithWhite:0 alpha:0.3];
        labelTitle.shadowOffset = CGSizeMake(1.0f, 1.0f);
        labelTitle.textAlignment = NSTextAlignmentCenter;
        labelTitle.text = title;
        [self.view addSubview:labelTitle];
        
        
        int buttonFontSize = 15;
        UIFont *buttonFont = [UIFont fontWithName:@"norwester" size:buttonFontSize];
        
        // Left and Right Buttons
        if (self.leftButton!=nil) {
            NSString *leftButtonLabel = self.leftButton;
            
            UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            leftButton.frame = CGRectMake(0, 0, 100, 50);
            [leftButton setTitle:leftButtonLabel forState:UIControlStateNormal];
            [leftButton setTitleColor:[UIColor colorWithWhite:0.75f alpha:0.9f] forState:UIControlStateNormal];
            leftButton.titleLabel.font = buttonFont;
            [leftButton sizeToFit];
            leftButton.frame = CGRectMake(0, 0, leftButton.frame.size.width+20, leftButton.frame.size.height+16);
            
            leftButton.imageView.layer.cornerRadius = 7.0f;
            leftButton.layer.shadowRadius = 1.0f;
            leftButton.layer.shadowColor = [UIColor blackColor].CGColor;
            leftButton.layer.shadowOffset = CGSizeMake(0.1f, 1.0f);
            leftButton.layer.shadowOpacity = 0.3f;
            leftButton.layer.masksToBounds = NO;
            [leftButton addTarget:self action:@selector(leftButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
            leftButton.frame = CGRectMake(15.5, labelTitle.frame.origin.y+(labelTitle.frame.size.height/2)-(leftButton.frame.size.height/2), leftButton.frame.size.height, leftButton.frame.size.height);
            [self.view addSubview:leftButton];

        }
        if (self.rightButton!=nil) {
            NSString *rightButtonLabel = self.rightButton;
            
            UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            rightButton.frame = CGRectMake(0, 0, 100, 50);
            [rightButton setTitle:rightButtonLabel forState:UIControlStateNormal];
            [rightButton setTitleColor:[UIColor colorWithWhite:0.75f alpha:0.9f] forState:UIControlStateNormal];
            rightButton.titleLabel.font = buttonFont;
            [rightButton sizeToFit];
            rightButton.frame = CGRectMake(0, 0, rightButton.frame.size.width+20, rightButton.frame.size.height+16);
            
            rightButton.imageView.layer.cornerRadius = 7.0f;
            rightButton.layer.shadowRadius = 1.0f;
            rightButton.layer.shadowColor = [UIColor blackColor].CGColor;
            rightButton.layer.shadowOffset = CGSizeMake(0.1f, 1.0f);
            rightButton.layer.shadowOpacity = 0.3f;
            rightButton.layer.masksToBounds = NO;
            [rightButton addTarget:self action:@selector(rightButtonTouched:) forControlEvents:UIControlEventTouchUpInside];
            rightButton.frame = CGRectMake(screen.size.width-(rightButton.frame.size.width+15.5), labelTitle.frame.origin.y+(labelTitle.frame.size.height/2)-(rightButton.frame.size.height/2), rightButton.frame.size.height, rightButton.frame.size.height);
            [self.view addSubview:rightButton];
            
        }

        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSString*)leftButton {
    return nil;
}

- (NSString*)rightButton {
    return nil;
}

- (void)leftButtonTouched:(UIButton *)sender
{
    
}

- (void)rightButtonTouched:(UIButton *)sender
{
    
}

-(UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}



@end
