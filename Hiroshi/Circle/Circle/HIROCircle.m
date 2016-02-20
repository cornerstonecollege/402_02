//
//  HIROCircle.m
//  Circle
//
//  Created by Hiroshi on 2/19/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "HIROCircle.h"

@interface HIROCircle()
@end

@implementation HIROCircle

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.backgroundColor = [UIColor clearColor];
        _color = [UIColor colorWithRed:111.0/255.0 green:233.0/255.0 blue:219.0/255.0 alpha:1.0];
    }
    return self;
}

-(void)drawRect:(CGRect)rect
{
    CGRect bounds = self.bounds;
    CGPoint center = CGPointMake(bounds.size.width / 2, bounds.size.height / 2);
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    
    [path addArcWithCenter:center
                    radius:bounds.size.width /2 -10
                startAngle:0
                  endAngle:2 * M_PI
                 clockwise:YES];
    path.lineWidth = 10;
    [self.color setStroke];
    
    [path stroke];
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    if(self.delegate)
    {
        [self.delegate circleMoved:self andTouch:touch];
    }
}

@end
