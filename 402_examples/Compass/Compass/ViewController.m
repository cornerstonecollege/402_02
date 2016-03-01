//
//  ViewController.m
//  Compass
//
//  Created by CICCC1 on 2016-03-01.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "ViewController.h"

@interface ViewController () <CLLocationManagerDelegate>

@property (nonatomic) CLLocationManager *locationManager;

@property (weak, nonatomic) IBOutlet UIImageView *imgArrow;
@property (weak, nonatomic) IBOutlet UIImageView *imgCircle;

@end

@implementation ViewController

CGFloat lastAngleRadians;

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeLocationManager];
    [self initializeImage];
}

- (void) initializeImage
{
    self.imgArrow.transform = CGAffineTransformRotate(self.imgArrow.transform, M_PI);
    lastAngleRadians = 0.0;
}

- (void) initializeLocationManager
{
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    //self.locationManager.headingFilter = 5; // 5 degrees
    [self.locationManager startUpdatingHeading];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateHeading:(CLHeading *)newHeading
{
    // The value 0 means the device is pointed toward true north, 90 means it is pointed
    // due east, 180 means it is pointed due south, and so on.
    CGFloat radians = newHeading.trueHeading * 2.0 * M_PI / 360.0;
    CGFloat rotateAngle = radians > lastAngleRadians ? (radians - lastAngleRadians) * -1: lastAngleRadians - radians;
    lastAngleRadians = radians;
    
    self.imgCircle.transform = CGAffineTransformRotate(self.imgCircle.transform, rotateAngle);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
