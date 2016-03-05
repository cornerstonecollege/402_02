//
//  ViewController.m
//  Camera
//
//  Created by CICCC1 on 2016-03-03.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "ViewController.h"
#import "TagImage.h"
#import "TagImageHelper.h"

@interface ViewController () <CLLocationManagerDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet MKMapView *map;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic) CLLocationManager *locationManager;
@property (nonatomic) NSMutableArray<TagImage *> *arrTagImg;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.arrTagImg = [NSMutableArray array];
    [self requestAuthorization];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations
{
    CLLocation *location = [locations lastObject];
    [self.map.userLocation setCoordinate:location.coordinate];
    [self setRegionInMap];
}

- (void) requestAuthorization
{
    self.locationManager = [[CLLocationManager alloc] init];
    
    if (CLLocationManager.authorizationStatus != kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        [self.locationManager requestWhenInUseAuthorization];
    }
    
    // maybe the user did not allow us on the requestWhenInUseAuthorization, that is why we
    // check it again.
    if (CLLocationManager.authorizationStatus == kCLAuthorizationStatusAuthorizedWhenInUse)
    {
        //self.locationManager.distanceFilter = 1000;
        self.locationManager.distanceFilter = 10;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.delegate = self;
        [self.locationManager startUpdatingLocation];
        [self setProperties];
    }
}

- (void) setProperties
{
    NSArray<TagImage *> *arrTag = [[TagImageHelper sharedInstance] getTagImages];
    for (TagImage *tag in arrTag)
    {
        [self.map addAnnotation:tag.annotation];
    }
    
    if ([arrTag count] > 0)
    {
        self.imgView.image = ((TagImage *)[arrTag firstObject]).image;
    }
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

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    UIImage *img = info[UIImagePickerControllerOriginalImage];
    [self dismissViewControllerAnimated:YES completion:NULL];
    self.imgView.image = img;
    [self plotPointsWithImage:img];
}

- (void) plotPointsWithImage:(UIImage *)img
{
    CLLocationCoordinate2D coordinate = self.map.userLocation.coordinate;
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];
    [geocoder reverseGeocodeLocation:self.map.userLocation.location completionHandler:^(NSArray<CLPlacemark *> * _Nullable placemarks, NSError * _Nullable error)
    {
        if ([placemarks count] > 0)
        {
            MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
            CLPlacemark *place = (CLPlacemark*) placemarks[0];
            NSArray *array = place.addressDictionary[@"FormattedAddressLines"];
            annotation.title = [NSString stringWithFormat:@"%@ %@ %@", array[0], array[1], array[2]];
            
            annotation.coordinate = coordinate;
            
            TagImage *tagImage = [[TagImage alloc] initWithWithKey:[[NSUUID alloc] init] annotation:annotation andImage:img];
            __weak TagImage *weakTagImage = tagImage;
            [self.arrTagImg addObject:weakTagImage];
            [[TagImageHelper sharedInstance] addTagImage:tagImage];
            
            [self.map addAnnotation:annotation];
        }
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
