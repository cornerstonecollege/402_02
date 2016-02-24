//
//  ViewController.m
//  Circle
//
//  Created by Hiroshi on 2/19/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "ViewController.h"
#import "HIROCircle.h"

@interface ViewController () <HIROCircleDelegate>

@property (nonatomic) NSMutableArray<HIROCircle *> *circleArr;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createCircle:CGRectMake(self.view.center.x - 50, self.view.center.y - 50, 100, 100)];
    
    [self createButton];
}

// create circle
- (void)createCircle:(CGRect)position
{
    self.circleArr = [NSMutableArray array];
    
    HIROCircle *circle = [[HIROCircle alloc] initWithFrame:position];
    circle.delegate = self;
    
    [self.view addSubview:circle];
    
    __weak HIROCircle *weakCircle = circle;
    [self.circleArr addObject:weakCircle];
}

// create button
- (void)createButton
{
    CGRect bounds = self.view.bounds;
    
    // create button
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = CGRectMake(bounds.size.width * 0.05, bounds.size.height * 0.05, 100, 100);
    button.backgroundColor = [UIColor colorWithRed:226.0/255.0 green:238.0/255.0 blue:67.0/255.0 alpha:1.0];
    button.titleLabel.font = [UIFont systemFontOfSize:30.0];
    button.layer.cornerRadius = 50;
    [button setTitle:@"Add" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)circleMoved:(id)sender andTouch:(UITouch *)touch
{
    HIROCircle *circle = (HIROCircle *)sender;
    circle.center = [touch locationInView:self.view];
    [circle setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CGFloat red = arc4random_uniform(256) / 255.0;
    CGFloat green = arc4random_uniform(256) / 255.0;
    CGFloat blue = arc4random_uniform(256) / 255.0;
    
    for (HIROCircle *circle in self.circleArr)
    {
        circle.color = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
        [circle setNeedsDisplay];
    }
}

- (void)onClick:(UIButton *)sender
{
    CGFloat xRandom = arc4random_uniform(self.view.frame.size.width + 1);
    CGFloat yRandom = arc4random_uniform(self.view.frame.size.height + 1);
    [self createCircle:CGRectMake(xRandom -50, yRandom  - 50, 100, 100)];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
