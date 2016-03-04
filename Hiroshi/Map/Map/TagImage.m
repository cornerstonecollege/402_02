//
//  TagImage.m
//  Map
//
//  Created by Hiroshi on 3/3/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "TagImage.h"

@implementation TagImage

- (instancetype) initWithAnnotation:(MKPointAnnotation *)annotation andImage:(UIImage *)image
{
    self = [super init];
    if (self) {
        _annotation = annotation;
        _image = image;
    }
    return self;
}

@end
