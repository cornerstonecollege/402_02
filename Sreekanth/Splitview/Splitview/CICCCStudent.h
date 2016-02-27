//
//  CICCCStudent.h
//  SplitView
//
//  Created by CICCC1 on 2016-02-25.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CICCCStudent : NSObject

@property (nonatomic, copy) NSString *name;
@property (nonatomic) NSInteger age;
@property (nonatomic) char grade;

+ (instancetype) studentRandom;

- (instancetype)initWithName:(NSString *)name age:(NSInteger)age andGrade:(char)grade;

@end
