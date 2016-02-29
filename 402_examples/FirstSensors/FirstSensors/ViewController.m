//
//  ViewController.m
//  FirstSensors
//
//  Created by CICCC1 on 2016-02-29.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ()

@property (nonatomic) CMMotionManager *motionManager;

@property (weak, nonatomic) IBOutlet UILabel *lblAccelerometerX;
@property (weak, nonatomic) IBOutlet UILabel *lblAccelerometerY;
@property (weak, nonatomic) IBOutlet UILabel *lblAccelerometerZ;
@property (weak, nonatomic) IBOutlet UILabel *lblGyroX;
@property (weak, nonatomic) IBOutlet UILabel *lblGyroY;
@property (weak, nonatomic) IBOutlet UILabel *lblGyroZ;


@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initializeMotionManager];
}

- (void) initializeMotionManager
{
    self.motionManager = [[CMMotionManager alloc] init];
    self.motionManager.accelerometerUpdateInterval = 0.2;
    self.motionManager.gyroUpdateInterval = 0.2;
    
    __weak ViewController *weakSelf = self;
    
    [self.motionManager startAccelerometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMAccelerometerData * _Nullable accelerometerData, NSError * _Nullable error)
    {
        [weakSelf updateAccelerometerWithData:accelerometerData];
    }];
    
    [self.motionManager startGyroUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMGyroData * _Nullable gyroData, NSError * _Nullable error)
    {
        [weakSelf updateGyroWithData:gyroData];
    }];
}

- (void)updateAccelerometerWithData:(CMAccelerometerData *) data
{
    self.lblAccelerometerX.text = [NSString stringWithFormat:@"%f", data.acceleration.x];
    self.lblAccelerometerY.text = [NSString stringWithFormat:@"%f", data.acceleration.y];
    self.lblAccelerometerZ.text = [NSString stringWithFormat:@"%f", data.acceleration.z];
}

- (void) updateGyroWithData:(CMGyroData *)data
{
    self.lblGyroX.text = [NSString stringWithFormat:@"%f", data.rotationRate.x];
    self.lblGyroY.text = [NSString stringWithFormat:@"%f", data.rotationRate.y];
    self.lblGyroZ.text = [NSString stringWithFormat:@"%f", data.rotationRate.z];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
