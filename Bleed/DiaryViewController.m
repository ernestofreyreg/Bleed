//
//  DiaryViewController.m
//  Bleed
//
//  Created by Ernesto Freyre on 23/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import "DiaryViewController.h"

@interface DiaryViewController ()

@end

@implementation DiaryViewController

- (id)init
{
    self = [super initWithTitle:@"Diary"];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSString*)leftButton
{
    return @"Back";
}


-(void)leftButtonTouched:(UIButton *)sender
{
    [self dismissViewControllerAnimated:NO completion:nil];
}


@end
