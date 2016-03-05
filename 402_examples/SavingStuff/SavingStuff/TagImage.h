//
//  TagImage.h
//  Camera
//
//  Created by CICCC1 on 2016-03-03.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <MapKit/MapKit.h>

@interface TagImage : NSObject <NSCoding>

@property (nonatomic, readonly) NSUUID *key;
@property (nonatomic, readonly) UIImage *image;
@property (nonatomic, readonly) MKPointAnnotation *annotation;

- (instancetype) initWithWithKey:(NSUUID *)key annotation:(MKPointAnnotation *)annotation andImage:(UIImage *)image;

@end
