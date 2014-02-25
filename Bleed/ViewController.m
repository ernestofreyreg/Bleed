//
//  ViewController.m
//  Bleed
//
//  Created by Ernesto Freyre on 19/02/14.
//  Copyright (c) 2014 Ernesto Freyre G. All rights reserved.
//

#import "ViewController.h"
#import "ProfileViewController.h"
#import "DiaryViewController.h"
#import "MyDropsViewController.h"

@interface ViewController ()

@property UILabel *labelUsername;
@property UIImageView *userImage;

@end

@implementation ViewController


- (id)init
{
    self = [super initWithTitle:@"Bleed"];
    if (self) {
        CGRect screen = [[UIScreen mainScreen] bounds];

        // Load user profile
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        NSString *username = [prefs stringForKey:@"username"];
        NSString *gender = [prefs stringForKey:@"gender"];

        
        // User centered image
        _userImage =[[UIImageView alloc] init];
        if ([gender isEqualToString:@"male"]) {
            _userImage.image =[UIImage imageNamed:@"littleman.png"];
        } else {
            _userImage.image =[UIImage imageNamed:@"littlelady.png"];
        }
        _userImage.frame = CGRectMake((screen.size.width-77.5)/2, (screen.size.height-77.5)/2, 77.5, 77.5);
        [self.view addSubview:_userImage];
        
        // Username label
        int fontSize = screen.size.height/15;
        
        _labelUsername = [ [UILabel alloc ] initWithFrame:CGRectMake(0, _userImage.frame.origin.y + _userImage.frame.size.height, screen.size.width, fontSize/3)];
        _labelUsername.textColor = [UIColor colorWithWhite:1.0f alpha:0.9f];
        _labelUsername.font = [UIFont fontWithName:@"norwester" size:fontSize/3];
        _labelUsername.shadowColor = [UIColor colorWithWhite:0 alpha:0.3];
        _labelUsername.shadowOffset = CGSizeMake(1.0f, 1.0f);
        _labelUsername.text = username;
        _labelUsername.textAlignment = NSTextAlignmentCenter;
        [self.view addSubview:_labelUsername];
        
        // Tap on user Image
        UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapDetected)];
        singleTap.numberOfTapsRequired = 1;
        _userImage.userInteractionEnabled = YES;
        [_userImage addGestureRecognizer:singleTap];
        
    }
    
    return self;
}

-(NSString*)rightButton
{
    return @"Diary";
}
-(NSString*)leftButton
{
    return @"Drops";
}

-(void)rightButtonTouched:(UIButton *)sender
{
    DiaryViewController *diary = [[DiaryViewController alloc] init];
    diary.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:diary animated:YES completion:nil];
}

-(void)leftButtonTouched:(UIButton *)sender
{
    MyDropsViewController *drops = [[MyDropsViewController alloc] init];
    drops.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:drops animated:YES completion:nil];

}

-(void)tapDetected
{
//    UIAlertView * alert =[[UIAlertView alloc ] initWithTitle:@"Hola"
//                                                     message:@"Me llamo Huberty"
//                                                    delegate:self
//                                           cancelButtonTitle:@"Cancel"
//                                           otherButtonTitles: nil];
//    [alert addButtonWithTitle:@"Ok"];
//    [alert show];
    
    ProfileViewController *profileViewController = [[ProfileViewController alloc] init];
    profileViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:profileViewController animated:YES completion:nil];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
        
    // Load User profile and show it on center screen
    
    
    // Check if BLE service is working
    
    
    // Show statuses of BLE
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)viewDidAppear:(BOOL)animated
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    NSString *username = [prefs stringForKey:@"username"];
    NSString *gender = [prefs stringForKey:@"gender"];

    [_labelUsername setText:username];
    if ([gender isEqualToString:@"male"]) {
        _userImage.image =[UIImage imageNamed:@"littleman.png"];
    } else {
        _userImage.image =[UIImage imageNamed:@"littlelady.png"];
    }
}





@end
