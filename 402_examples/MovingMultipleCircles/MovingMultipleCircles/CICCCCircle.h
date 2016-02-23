//
//  CICCCCircle.h
//  Circles
//
//  Created by CICCC1 on 2016-02-17.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CICCCCircleDelegate <NSObject>

@required
- (void) circleMoved:(id)sender andTouch:(UITouch *)touch;

@end

@interface CICCCCircle : UIView

@property (nonatomic, weak) id<CICCCCircleDelegate> delegate;
@property (nonatomic) UIColor *color;

@end