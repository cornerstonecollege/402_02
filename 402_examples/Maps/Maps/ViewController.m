//
//  ViewController.m
//  Maps
//
//  Created by CICCC1 on 2016-03-02.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "ViewController.h"

@interface ViewController () <MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (nonatomic) CLLocationManager *locationManager;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self getAuthorization];
    [self plotPointsInMap];
}

- (void) getAuthorization
{
    if ([CLLocationManager authorizationStatus] != kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        self.locationManager = [[CLLocationManager alloc] init];
        [self.locationManager requestWhenInUseAuthorization];
    }
}

- (void) plotPointsInMap
{
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = 49.246292;
    coordinate.longitude = -123.116226;
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coordinate, 1000.0, 2000.0);
    [self.map setRegion:region animated:YES];
    
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    annotation.title = @"Vancouver";
    annotation.subtitle = @"BC";
    annotation.coordinate = coordinate;
    
    [self.map addAnnotation:annotation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
