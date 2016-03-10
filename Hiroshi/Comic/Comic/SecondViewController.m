//
//  SecondViewController.m
//  Comic
//
//  Created by Hiroshi on 3/8/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "SecondViewController.h"
#import "ViewController.h"

@interface SecondViewController ()

@property (nonatomic, weak) UIView *commonView;

@end

@implementation SecondViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.commonView = ((ViewController *)self.tabBarController).commonView;
    [self.view addSubview:self.commonView];
    self.commonView.backgroundColor = [UIColor whiteColor];
}

- (void) tabBarClicked
{
    // claim the view to itself
    [self.view addSubview:self.commonView];
}

@end
