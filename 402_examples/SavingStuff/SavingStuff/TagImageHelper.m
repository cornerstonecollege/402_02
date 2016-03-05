//
//  TagImageHelper.m
//  SavingStuff
//
//  Created by CICCC1 on 2016-03-04.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "TagImageHelper.h"
#import "TagImage.h"

@interface TagImageHelper ()

@property (nonatomic) NSMutableArray<TagImage *> *arrTags;

@end

@implementation TagImageHelper

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Wrong Initializer" reason:@"Use sharedInstance" userInfo:NULL];
    
    return nil;
}

+ (instancetype)sharedInstance
{
    static TagImageHelper *helper;
    if (!helper)
    {
        helper = [[TagImageHelper alloc] initPrivate];
    }
    
    return helper;
}

- (instancetype)initPrivate
{
    self = [super init];
    
    if (self)
    {
        _arrTags = [NSKeyedUnarchiver unarchiveObjectWithFile:[self getFile]];
        
        if (!_arrTags)
        {
            _arrTags = [NSMutableArray array];
        }
    }
    
    return self;
}

- (NSString *) getFile
{
    NSArray *directories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *pathToFile = [directories firstObject];
    return  [pathToFile stringByAppendingPathComponent:@"tagimage.archive"];
}

- (void)saveChanges
{
    if ([NSKeyedArchiver archiveRootObject:self.arrTags toFile:[self getFile]])
    {
        NSLog(@"done");
    }
    else
    {
        NSLog(@"not done");
    }
}

- (void)addTagImage:(TagImage *)tagImage
{
    [self.arrTags addObject:tagImage];
}

- (NSArray *)getTagImages
{
    return [self.arrTags copy];
}

@end
