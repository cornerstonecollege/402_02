//
//  ViewController.m
//  Comic
//
//  Created by Hiroshi on 3/8/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"

@interface ViewController ()

@property (nonatomic) FirstViewController *firstVC;
@property (nonatomic) SecondViewController *secondVC;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self createTab];
}

- (void)createTab
{
    self.firstVC = [[FirstViewController alloc] init];
    self.firstVC.tabBarItem.image = [[UIImage imageNamed:@"window.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.firstVC.tabBarItem.title = @"devision";
    [self.firstVC.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor blackColor] }
                                             forState:UIControlStateNormal];
    
    self.secondVC = [[SecondViewController alloc] init];
    self.secondVC.tabBarItem.image = [[UIImage imageNamed:@"earth.png"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.secondVC.tabBarItem.title = @"Speech Bubble";
    [self.secondVC.tabBarItem setTitleTextAttributes:@{ NSForegroundColorAttributeName : [UIColor blackColor] }
                                      forState:UIControlStateNormal];
    
    self.viewControllers = @[self.firstVC, self.secondVC];
}

- (void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    if (item == self.firstVC.tabBarItem)
    {
        [self.firstVC tabBarClicked];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
