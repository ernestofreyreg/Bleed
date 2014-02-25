//
//  ProfileViewController.m
//  Bleed
//
//  Created by Ernesto Freyre on 20/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import "ProfileViewController.h"
#import "TextEditField.h"
#import "TwoChoiceEditField.h"
#import "DiaryViewController.h"
#import "TwoStateImageButton.h"
#import "PaddingView.h"

@interface ProfileViewController ()

@property TextEditField *userNameField;
@property TwoChoiceEditField *genderField;
@property TextEditField *ageField;
@property UIImageView *picture;
@property TwoStateImageButton *dropsBtn;
@property TwoStateImageButton *twitterBtn;
@property TwoStateImageButton *linkedinBtn;


@end

@implementation ProfileViewController


- (id)init
{
    self = [super initWithTitle:@"Profile"];
    if (self) {
        
        // Load user profile
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        NSString *username = [prefs stringForKey:@"username"];
        NSString *gender = [prefs stringForKey:@"gender"];
        NSInteger age = [prefs integerForKey:@"age"];
        NSString* ageStr = [@(age) description];
        
        CGRect screen = [[UIScreen mainScreen] bounds];
        
        
        // Picture
        _picture = [[UIImageView alloc] initWithFrame:CGRectMake((screen.size.width-77.5)/2, 59, 77.5, 77.5)];
        if ([gender isEqualToString:@"male"]) {
            _picture.image =[UIImage imageNamed:@"littleman.png"];
        } else {
            _picture.image =[UIImage imageNamed:@"littlelady.png"];
        }
        UIImageView *takePicture = [[UIImageView alloc] initWithFrame:CGRectMake(_picture.frame.origin.x + 77.5 + 6, _picture.frame.origin.y+26.5, 15.5, 13.5)];
        [takePicture setImage:[UIImage imageNamed:@"takepicture.png"]];
        [self.view addSubview:takePicture];
        

        [self.view addSubview:_picture];
        
        
        _userNameField = [[TextEditField alloc] initWithFrame:CGRectMake(0, 144, screen.size.width, 40)
                                                    label:@"User" value:username placeholder:@"Enter Name"];
        [self.view addSubview:_userNameField];
        
        _genderField = [[TwoChoiceEditField alloc] initWithFrame:CGRectMake(0, 184, screen.size.width, 40)
                                                           label:@"Gender" value:gender choices:[NSArray arrayWithObjects:@"male",@"female",nil]];
        [self.view addSubview:_genderField];
        
        _ageField = [[TextEditField alloc] initWithFrame:CGRectMake(0, 224, screen.size.width, 40)
                                               label:@"Age" value:ageStr placeholder:@"Enter Age"];
        [self.view addSubview:_ageField];
        
        // Drops
        _dropsBtn = [[TwoStateImageButton alloc] initWithFrame:CGRectMake(0, 264, screen.size.width, 60) image:[UIImage imageNamed:@"drop.png"] label:@"Bleed anything you want."];
        [self.view addSubview:_dropsBtn];
        
        // Twitter
        _twitterBtn = [[TwoStateImageButton alloc] initWithFrame:CGRectMake(0, 324, screen.size.width, 60) image:[UIImage imageNamed:@"twitter.png"] label:@"Connect to Twitter to Bleed your lastest tweet."];
        [self.view addSubview:_twitterBtn];
        
        // LinkedIn
        _linkedinBtn = [[TwoStateImageButton alloc] initWithFrame:CGRectMake(0, 384, screen.size.width, 60) image:[UIImage imageNamed:@"linkedin.png"] label:@"Bleed your LinkedIn profile."];
        [self.view addSubview:_linkedinBtn];
        
        // Padding
        PaddingView *padding = [[PaddingView alloc] initWithFrame:CGRectMake(0, 444, screen.size.width, screen.size.height-444)];
        [self.view addSubview:padding];
        
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	[self setNeedsStatusBarAppearanceUpdate];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
   
}

- (NSString*)leftButton
{
    return @"Back";
}

- (void)leftButtonTouched:(UIButton *)sender
{
    // Save prefs
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    [prefs setObject:[_userNameField getEntry] forKey:@"username"];
    [prefs setObject:[_genderField getEntry] forKey:@"gender"];
    [prefs setObject:[_ageField getEntry] forKey:@"age"];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSString*)rightButton
{
    return @"Diary";
}

- (void)rightButtonTouched:(UIButton *)sender
{
    DiaryViewController *diary = [[DiaryViewController alloc] init];
    [self presentViewController:diary animated:NO completion:nil];
}



-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}

@end
