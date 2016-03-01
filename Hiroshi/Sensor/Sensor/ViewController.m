//
//  ViewController.m
//  Sensor
//
//  Created by Hiroshi on 2/29/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "ViewController.h"
#import <CoreMotion/CoreMotion.h>

@interface ViewController ();

@property (nonatomic) CMMotionManager *motionManager;

@property (weak, nonatomic) IBOutlet UILabel *accX;
@property (weak, nonatomic) IBOutlet UILabel *accY;
@property (weak, nonatomic) IBOutlet UILabel *accZ;

@property (weak, nonatomic) IBOutlet UILabel *gyrX;
@property (weak, nonatomic) IBOutlet UILabel *gyrY;
@property (weak, nonatomic) IBOutlet UILabel *gyrZ;

@property (weak, nonatomic) IBOutlet UILabel *magX;
@property (weak, nonatomic) IBOutlet UILabel *magY;
@property (weak, nonatomic) IBOutlet UILabel *magZ;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initializedMotionManager];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializedMotionManager {
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
    
    [self.motionManager startMagnetometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMMagnetometerData * _Nullable magnetometerData, NSError * _Nullable error)
    {
        [weakSelf updateMagnetWithData:magnetometerData];
    }];
}

- (void)updateAccelerometerWithData:(CMAccelerometerData *) data
{
    self.accX.text = [NSString stringWithFormat:@"%f", data.acceleration.x];
    self.accY.text = [NSString stringWithFormat:@"%f", data.acceleration.y];
    self.accZ.text = [NSString stringWithFormat:@"%f", data.acceleration.z];
}

- (void)updateGyroWithData:(CMGyroData *)data
{
    self.gyrX.text = [NSString stringWithFormat:@"%f", data.rotationRate.x];
    self.gyrY.text = [NSString stringWithFormat:@"%f", data.rotationRate.y];
    self.gyrZ.text = [NSString stringWithFormat:@"%f", data.rotationRate.z];
}

- (void)updateMagnetWithData:(CMMagnetometerData *)data
{
    self.magX.text = [NSString stringWithFormat:@"%f", data.magneticField.x];
    self.magY.text = [NSString stringWithFormat:@"%f", data.magneticField.y];
    self.magZ.text = [NSString stringWithFormat:@"%f", data.magneticField.z];
}


@end
