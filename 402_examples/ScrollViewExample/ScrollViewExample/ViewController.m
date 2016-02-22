//
//  ViewController.m
//  ScrollViewExample
//
//  Created by CICCC1 on 2016-02-22.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createViews];
}

- (void) createViews
{
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    self.scrollView.contentSize = CGSizeMake(self.view.frame.size.width * 2, self.view.frame.size.height * 2);
    [self.view addSubview:self.scrollView];
    
    UIButton *btnRight = [UIButton buttonWithType:UIButtonTypeSystem];
    btnRight.frame = CGRectMake(self.view.center.x, self.view.center.y, 100, 100);
    [btnRight setTitle:@"Click" forState:UIControlStateNormal];
    btnRight.backgroundColor = [UIColor redColor];
    [btnRight addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.scrollView addSubview:btnRight];
}

- (void) onClick:(UIButton *)sender
{
    CGFloat labelSize = 50;
    CGFloat xRandom = arc4random_uniform(self.view.frame.size.width * 2 + 1 - labelSize);
    CGFloat yRandom = arc4random_uniform(self.view.frame.size.height * 2 + 1 - labelSize);
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(xRandom, yRandom, labelSize, labelSize)];
    label.text = @"Label";
    
    [self.scrollView addSubview:label];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
