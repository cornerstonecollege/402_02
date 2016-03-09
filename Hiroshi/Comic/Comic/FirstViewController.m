//
//  FirstViewController.m
//  Comic
//
//  Created by Hiroshi on 3/8/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "FirstViewController.h"
#import "ViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void) tabBarClicked
{
    CGPoint point = CGPointMake(self.view.center.x, self.view.center.y);
    CGFloat tabBarTop = [[[self tabBarController] tabBar] frame].origin.y;
    
    if(self.parentViewController && [self.parentViewController isKindOfClass:[ViewController class]])
    {
        ViewController *obj = (ViewController *)self.parentViewController;
        point = CGPointMake(self.view.center.x, self.view.center.y - obj.tabBar.frame.size.height);
    }
    
    UIScrollView *devisionView = [[UIScrollView alloc] initWithFrame:CGRectMake(0,
                                                                                self.view.bounds.size.height*0.1 + self.view.bounds.size.height,
                                                                                self.view.bounds.size.width,
                                                                                self.view.bounds.size.height*0.1)];
    devisionView.backgroundColor = [UIColor colorWithRed:224.0f/255.0f green:245.0f/255.0f blue:249.0f/255.0f alpha:1.0];
    devisionView.pagingEnabled = YES;
    
    float moveX = devisionView.frame.size.width / 2;
    float moveY = tabBarTop - self.view.bounds.size.height * 0.1 + devisionView.frame.size.height / 2;
    
    [self.view addSubview:devisionView];
    
    [UIView animateWithDuration:0.5 animations:^{
        devisionView.center = CGPointMake(moveX, moveY);
    } completion:^(BOOL finished) {
        
        UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
        [imageView1 setImage:[UIImage imageNamed:@"w1.png"]];
        //[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"w1.png"]] ;
        //imageView1.layer.contentsRect = CGRectMake(0, 0, 50, 50);
        [devisionView addSubview:imageView1];
        
        UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(100, 0, 50, 50)];
        [imageView2 setImage:[UIImage imageNamed:@"w2.png"]];
        //[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"w2.png"]] ;
        //imageView2.layer.contentsRect = CGRectMake(100, 0, 50, 50);
        [devisionView addSubview:imageView2];
    }];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end

