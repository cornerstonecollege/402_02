//
//  ViewController.m
//  MovingCircles
//
//  Created by CICCC1 on 2016-02-18.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"
#import "CICCCCircle.h"

@interface ViewController ()

@property (nonatomic) CICCCCircle *circle;
@property (nonatomic) BOOL isDragging;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.circle = [[CICCCCircle alloc] initWithFrame:CGRectMake(self.view.center.x - 150, self.view.center.y - 150, 300, 300)];
    
    [self.view addSubview:self.circle];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.isDragging = NO;
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    self.isDragging = YES;
    self.circle.center = [[touches anyObject] locationInView:self.view];
    [self.circle setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (!self.isDragging)
    {
        CGFloat red = arc4random_uniform(256) / 255.0;
        CGFloat green = arc4random_uniform(256) / 255.0;
        CGFloat blue = arc4random_uniform(256) / 255.0;
        
        self.circle.color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        [self.circle setNeedsDisplay];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
