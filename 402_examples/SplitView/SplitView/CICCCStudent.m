//
//  CICCCStudent.m
//  SplitView
//
//  Created by CICCC1 on 2016-02-25.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "CICCCStudent.h"

@implementation CICCCStudent

+ (instancetype) studentRandom
{
    NSString *name = [NSString stringWithFormat:@"Student %i", arc4random_uniform(100) + 1];
    NSInteger age = arc4random_uniform(21) + 19;
    char grade = arc4random_uniform(5) + 65;
    
    CICCCStudent *randStudent = [[CICCCStudent alloc] initWithName:name age:age andGrade:grade];
    return randStudent;
}

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age andGrade:(char)grade
{
    self = [super init];
    if (self)
    {
        _name = name;
        _age = age;
        grade = grade;
    }
    
    return self;
}

@end
