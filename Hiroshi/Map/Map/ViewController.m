//
//  ViewController.m
//  Map
//
//  Created by Hiroshi on 3/2/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "ViewController.h"
#import "TagImage.h"

@interface ViewController () <CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) NSMutableArray<TagImage *> *arrTagImg;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.arrTagImg = [NSMutableArray array];
    [self requestAuthorization];
}

- (void) requestAuthorization
{
    self.locationManager = [[CLLocationManager alloc] init];
    
    if(CLLocationManager.authorizationStatus != kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    if(CLLocationManager.authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        self.locationManager.distanceFilter = 10;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.delegate = self;
        [self.locationManager startUpdatingLocation];
    }
}

- (void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location = [locations lastObject];
    [self.map.userLocation setCoordinate:location.coordinate];
    [self setRegionInMap];
}

- (void) setRegionInMap
{
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(self.map.userLocation.coordinate, 1000.0, 2000.0);
    [self.map setRegion:region animated:YES];
}

- (IBAction)takePicture:(id)sender
{
    UIImagePickerController *pickerController = [[UIImagePickerController alloc] init];
    pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
    pickerController.delegate = self;
    
    [self presentViewController:pickerController animated:YES completion:NULL];
}

- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *img = info[UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:NULL];
    self.imgView.image = img;
    [self plotPonitsWithImage:img];
}

- (void) plotPonitsWithImage:(UIImage *)img
{
    CLLocationCoordinate2D coordinate = self.map.userLocation.coordinate;
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:self.map.userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error)
    {
        if([placemarks count] > 0)
        {
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            CLPlacemark *place = (CLPlacemark *) placemarks[0];
            NSArray *array = place.addressDictionary[@"FormatterredAddressLines"];
            annotation.title = [NSString stringWithFormat:@"%@ %@ %@", array[0], array[1], array[2]];
            annotation.coordinate = coordinate;
            
            TagImage *tagImage = [[TagImage alloc] initWithAnnotation:annotation andImage:img];
            [self.arrTagImg addObject:tagImage];
            
            [self.map addAnnotation:annotation];
        }
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
