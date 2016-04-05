//
//  CommonHelper.m
//  Restaurants
//
//  Created by Hiroshi on 4/4/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "CommonHelper.h"

@interface CommonHelper();

@end

@implementation CommonHelper

+ (instancetype) sharedInstance
{
    static CommonHelper *instance;
    
    if (!instance)
    {
        instance = [[CommonHelper alloc] initPrivate];
    }
    
    return instance;
}

- (instancetype) init
{
    @throw [NSException exceptionWithName:@"Wrong Initializer" reason:@"Please use sharedInstance" userInfo:nil];
}

- (instancetype) initPrivate
{
    self = [super init];
    return self;
}

- (void) makeView
{

}

@end
