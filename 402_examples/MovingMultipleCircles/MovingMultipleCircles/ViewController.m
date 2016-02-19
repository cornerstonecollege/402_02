//
//  ViewController.m
//  MovingMultipleCircles
//
//  Created by CICCC1 on 2016-02-19.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"
#import "CICCCCircle.h"

@interface ViewController () <CICCCCircleDelegate>

@property (nonatomic) NSMutableArray<CICCCCircle *> *circleArr;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.circleArr = [NSMutableArray array];
    
    CICCCCircle *circle = [[CICCCCircle alloc] initWithFrame:CGRectMake(self.view.center.x - 150, self.view.center.y - 150, 300, 300)];
    circle.delegate = self;
    
    CICCCCircle *circle2 = [[CICCCCircle alloc] initWithFrame:CGRectMake(self.view.center.x - 50, self.view.center.y - 50, 100, 100)];
    circle2.delegate = self;
    
    [self.view addSubview:circle];
    [self.view addSubview:circle2];
    
    __weak CICCCCircle *weakCircle = circle;
    [self.circleArr addObject:weakCircle];
    weakCircle = circle2;
    [self.circleArr addObject:weakCircle];
    
}

- (void)circleMoved:(id)sender andTouch:(UITouch *)touch
{
    CICCCCircle *circle = (CICCCCircle *)sender;
    circle.center = [touch locationInView:self.view];
    [circle setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGFloat red = arc4random_uniform(256) / 255.0;
    CGFloat green = arc4random_uniform(256) / 255.0;
    CGFloat blue = arc4random_uniform(256) / 255.0;
        
    for (CICCCCircle *circle in self.circleArr)
    {
        circle.color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        [circle setNeedsDisplay];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
