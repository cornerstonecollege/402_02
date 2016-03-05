//
//  TagImage.m
//  Camera
//
//  Created by CICCC1 on 2016-03-03.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <MapKit/MapKit.h>
#import "TagImage.h"

@interface TagImage ()

@property (nonatomic) NSNumber *latitude;
@property (nonatomic) NSNumber *longitude;

@end

@implementation TagImage

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    NSUUID *key = [aDecoder decodeObjectForKey:@"key"];
    NSNumber *latitude = [aDecoder decodeObjectForKey:@"latitude"];
    NSNumber *longitude = [aDecoder decodeObjectForKey:@"longitude"];
    UIImage *img = [aDecoder decodeObjectForKey:@"image"];
    
    self = [self initWithKey:key latitude:latitude longitude:longitude andImage:img];
    
    return self;
}

-(void)encodeWithCoder:(NSCoder *)aCoder
{
    [aCoder encodeObject:self.key forKey:@"key"];
    [aCoder encodeObject:self.latitude forKey:@"latitude"];
    [aCoder encodeObject:self.longitude forKey:@"longitude"];
    [aCoder encodeObject:self.image forKey:@"image"];
}

- (instancetype) initWithKey:(NSUUID *)key latitude:(NSNumber *)lat longitude:(NSNumber *)lon andImage:(UIImage *)img
{
    MKPointAnnotation *annotation = [[MKPointAnnotation alloc] init];
    CLLocationCoordinate2D coordinate;
    coordinate.latitude = [lat doubleValue];
    coordinate.longitude = [lon doubleValue];
    annotation.coordinate = coordinate;
    self = [[TagImage alloc] initWithWithKey:key annotation:annotation andImage:img];
    
    return self;
}

- (instancetype) initWithWithKey:(NSUUID *)key annotation:(MKPointAnnotation *)annotation andImage:(UIImage *)image
{
    self = [super init];
    if (self)
    {
        _key = key;
        _annotation = annotation;
        _image = image;
        _latitude = [NSNumber numberWithDouble:annotation.coordinate.latitude];
        _longitude = [NSNumber numberWithDouble:annotation.coordinate.longitude];
    }
    
    return self;
}

@end
