//
//  ViewController.m
//  Compass
//
//  Created by Hiroshi on 3/1/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import <COreLocation/CoreLocation.h>
#import "ViewController.h"

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *locationMager;

@property (weak, nonatomic) IBOutlet UIImageView *imgCompass;

@end

@implementation ViewController

CGFloat lastAngleRadians;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //[self initializeLocalManager];
    
}

- (void)initializeImage
{
    self.imgCompass.transform = CGAffineTransformRotate(self.imgCompass.transform, M_PI);
    lastAngleRadians = 0.0;
}

- (void)initializeLocationManager
{
    self.locationMager = [[CLLocationManager alloc] init];
    self.locationMager.delegate = self;
    self.locationMager.desiredAccuracy = kCLLocationAccuracyBest;
    [self.locationMager startUpdatingHeading];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading{
    
    // newHeading,trueHeading
    CGFloat radians = newHeading.trueHeading * 2.0 * M_PI / 360.0;
    CGFloat rotateAngle = radians > lastAngleRadians ?
                (radians - lastAngleRadians) * -1: lastAngleRadians - radians;
    lastAngleRadians = radians;
    
    self.imgCompass.transform = CGAffineTransformRotate(self.imgCompass.transform, rotateAngle);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
