//
//  HIROCircle.h
//  Circle
//
//  Created by Hiroshi on 2/19/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol HIROCircleDelegate <NSObject>

@required   // (required) must need this function
-(void) circleMoved:(id)seder andTouch:(UITouch *)touch;

@end

@interface HIROCircle : UIView
@property (nonatomic, weak) id<HIROCircleDelegate> delegate;
@property (nonatomic) UIColor *color;
@end


