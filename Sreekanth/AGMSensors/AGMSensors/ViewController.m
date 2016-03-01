//
//  ViewController.m
//  AGMSensors
//
//  Created by SREEKANTH JAGADEESAN VAZHAPPULLY on 2016-02-29.
//  Copyright © 2016 SREEKANTH JAGADEESAN VAZHAPPULLY. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) CMMotionManager *motionManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self initializeMotionManager];
    
    
}

-(void)initializeMotionManager
{
    self.motionManager = [[CMMotionManager alloc]init];
    self.motionManager.magnetometerUpdateInterval = 0.2;
    
    __weak ViewController *weakSelf = self;
    
    [self.motionManager startMagnetometerUpdatesToQueue:[NSOperationQueue currentQueue] withHandler:^(CMMagnetometerData * _Nullable magnetometerData, NSError * _Nullable error)
    {
        [weakSelf updateMagnetometerWithData:magnetometerData];
    }];
         
    
}

-(void)updateMagnetometerWithData:(CMMagnetometerData *)data
{
    self.lblMagX.text = [NSString stringWithFormat:@"%f", data.magneticField.x];
    self.lblMagY.text = [NSString stringWithFormat:@"%f", data.magneticField.y];
    self.lblMagZ.text = [NSString stringWithFormat:@"%f", data.magneticField.z];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
