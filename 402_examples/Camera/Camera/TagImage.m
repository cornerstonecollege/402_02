//
//  TagImage.m
//  Camera
//
//  Created by CICCC1 on 2016-03-03.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "TagImage.h"

@implementation TagImage

- (instancetype) initWithAnnotation:(MKPointAnnotation *)annotation andImage:(UIImage *)image
{
    self = [super init];
    if (self)
    {
        _annotation = annotation;
        _image = image;
    }
    
    return self;
}

@end
