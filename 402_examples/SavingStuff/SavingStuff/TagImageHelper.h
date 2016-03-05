//
//  TagImageHelper.h
//  SavingStuff
//
//  Created by CICCC1 on 2016-03-04.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <Foundation/Foundation.h>
@class TagImage;

@interface TagImageHelper : NSObject

+ (instancetype) sharedInstance;

- (NSArray *) getTagImages;
- (void) addTagImage:(TagImage *)tagImage;
- (void) saveChanges;

@end
