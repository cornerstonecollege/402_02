//
//  ViewController.m
//  MusicGame
//
//  Created by Hiroshi on 2/24/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

UILabel *result;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self createScreen];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(update) userInfo:nil repeats:YES];
}

- (void)update
{
    NSLog(@".");
}

- (void)createScreen
{
    CGRect bounds = self.view.bounds;
    
    CGFloat sizeX = bounds.size.width * 0.2425;
    CGFloat sizeY = bounds.size.height * 0.2;
    
    CGFloat space = bounds.size.width * 0.01;
    
    NSDictionary *dicNumber =
    @{
      @0 : @[@"1", @"2", @"3", @"4"],
      @1 : @[@"5", @"6", @"7", @"8"],
      @2 : @[@"9", @"10", @"11", @"12"],
      @3 : @[@"13", @"14", @"15", @"16"],
      };
    
    result = [[UILabel alloc]init];
    result.frame = CGRectMake(0, 0, bounds.size.width, bounds.size.height*0.17);
    result.text = @"RESULT";
    result.font=[UIFont fontWithName:@"Helvetica" size:30 ];
    [self.view addSubview:result];
    
    // create buttons
    for (int row=0; row<dicNumber.count; row++)
    {
        // get the row position
        CGFloat yPos = (sizeY + space) * row + bounds.size.height*0.17;
        
        NSArray *arrNumber = [dicNumber objectForKey:[NSNumber numberWithInt:row]];
        for (int colum=0; colum<arrNumber.count; colum++)
        {
            UIColor *color = [UIColor colorWithRed:232.0/255.0 green:233.0/255.0 blue:219.0/255.0 alpha:1.0];
            
            [self createButtonWithTitle:arrNumber[colum] frame:CGRectMake(sizeX * colum + space * colum, yPos, sizeX, sizeY) andBackgroundColor:color];
        }
    }
}

- (void)createButtonWithTitle:(NSString *)title frame:(CGRect)frame andBackgroundColor:(UIColor *)color
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    button.backgroundColor = color;
    button.titleLabel.font = [UIFont systemFontOfSize:20.0];
    [button setTitle:title forState:UIControlStateNormal];
    
    UIImage *btnImage = [UIImage imageNamed:@"blueBalloon.png"];
    [button setImage:btnImage forState:UIControlStateNormal];
    button.showsTouchWhenHighlighted = YES;
    
    // UIControlEventTouchUpInside : if user press the button, the event will be implemented
    //[button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
