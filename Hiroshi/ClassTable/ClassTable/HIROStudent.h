//
//  HIROStudent.h
//  ClassTable
//
//  Created by Hiroshi on 2/25/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HIROStudent : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic) char grade;

+ (instancetype) studentRandom;

- (instancetype) initWithName:(NSString *)name age:(NSInteger)age andGrade:(char)grade;

@end
