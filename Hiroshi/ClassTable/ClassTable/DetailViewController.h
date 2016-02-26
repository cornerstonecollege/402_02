//
//  DetailViewController.h
//  ClassTable
//
//  Created by Hiroshi on 2/25/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import <UIKit/UIKit.h>
@class HIROStudent;

@interface DetailViewController : UIViewController

@property (nonatomic) HIROStudent *student;

- (void) updateScreen;

@end
