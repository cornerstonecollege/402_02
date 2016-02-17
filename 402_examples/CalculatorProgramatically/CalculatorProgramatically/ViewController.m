//
//  ViewController.m
//  CalculatorProgramatically
//
//  Created by CICCC1 on 2016-02-17.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self createScreen];
}

- (void) createButtonWithTitle:(NSString *)title frame:(CGRect)frame andBackgroundColor:(UIColor *)color
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    button.backgroundColor = color;
    [button setTitle:title forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void) createScreen
{
    CGRect bounds = self.view.bounds;
    CGFloat defaultX = bounds.size.width * 0.05;
    CGFloat defaultY = bounds.size.height * 0.05;
    CGFloat space = bounds.size.width * 0.03;
    CGFloat width = bounds.size.width * 0.2025;
    
    NSDictionary *dictionary =
    @{
        @0 : @[@"1", @"2", @"3", @"+"],
        @1 : @[@"4", @"5", @"6", @"-"],
        @2 : @[@"7", @"8", @"9", @"*"],
        @3 : @[@"C", @"0", @"=", @"/"],
    };
    
    for (int i = 0; i < dictionary.count; i++)
    {
        CGFloat yPos = defaultY + width * i + space * i;
        
        NSArray *numbersArr = [dictionary objectForKey:[NSNumber numberWithInt:i]];
        for (int j  = 0; j < numbersArr.count; j++)
        {
            UIColor *color = j == 3 ? [UIColor orangeColor] : [UIColor lightGrayColor];
            
            [self createButtonWithTitle:numbersArr[j]
                                  frame:CGRectMake(defaultX + width * j + space * j, yPos, width, width)
                     andBackgroundColor:color];
            
            
        }
    }
}

- (void) onClick:(UIButton *)sender
{
    NSLog(@"%@", sender.titleLabel.text);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
