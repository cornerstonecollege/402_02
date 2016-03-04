//
//  TagImage.h
//  Map
//
//  Created by Hiroshi on 3/3/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface TagImage : NSObject

@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) MKPointAnnotation *annotation;

- (instancetype) initWithAnnotation:(MKPointAnnotation *)annotation andImage:(UIImage *)image;

@end
