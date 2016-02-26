//
//  HIROStudent.m
//  ClassTable
//
//  Created by Hiroshi on 2/25/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "HIROStudent.h"

@implementation HIROStudent

+ (instancetype) studentRandom
{
    NSString *name = [NSString stringWithFormat:@"Student %i", arc4random_uniform(50)+1];
    NSInteger age = arc4random_uniform(21) + 19;
    char grade = arc4random_uniform(5) + 65;
    
    HIROStudent *randStudent = [[HIROStudent alloc] initWithName:name age:age andGrade:grade];
    return randStudent;
}

- (instancetype) initWithName:(NSString *)name age:(NSInteger)age andGrade:(char)grade
{
    self = [super init];
    if(self)
    {
        _name = name;
        _age = age;
        _grade = grade;
    }
    
    return self;
}

@end
