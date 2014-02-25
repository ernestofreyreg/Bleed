//
//  MyDropsViewController.m
//  Bleed
//
//  Created by Ernesto Freyre on 23/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import "MyDropsViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface MyDropsViewController ()

@end

@implementation MyDropsViewController

- (id)init
{
    self = [super initWithTitle:@"My Drops"];
    if (self) {
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.view setMultipleTouchEnabled:YES];

}

-(NSString*)leftButton
{
    return @"Back";
}

-(NSString*)rightButton
{
    return @"Add";
}

-(void)leftButtonTouched:(UIButton *)sender
{
    [self dismissViewControllerAnimated:NO completion:nil];
}

-(void)rightButtonTouched:(UIButton *)sender
{
    
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {

    
    NSLog(@"Touch");
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
