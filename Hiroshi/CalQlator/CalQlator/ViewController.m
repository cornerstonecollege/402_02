//
//  ViewController.m
//  CalQlator
//
//  Created by Hiroshi on 2/17/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // call the function
    [self createScreen];
}

- (void)createScreen
{
    // get the size and position of window
    CGRect bounds = self.view.bounds;
    
    // get the size of button
    CGFloat size = bounds.size.width * 0.2025;
    
    CGFloat defaultX = bounds.size.width * 0.05;
    CGFloat space = bounds.size.width * 0.03;
    
    NSDictionary *dicNumber =
    @{
      @0 : @[@"1", @"2", @"3", @"+"],
      @1 : @[@"4", @"5", @"6", @"-"],
      @2 : @[@"7", @"8", @"9", @"*"],
      @3 : @[@"C", @"0", @"=", @"/"],
    };
    
    CGFloat defaultY = bounds.size.height - size * 4 - space * 4;
    
    // create result label
    UILabel *result = [[UILabel alloc]init];
    result.frame = CGRectMake(defaultX, defaultY - defaultY/2, bounds.size.width, 50);
    result.text=@"Contact";
    result.font=[UIFont fontWithName:@"Helvetica" size:30 ];
    [self.view addSubview:result];
    
    // create buttons
    for (int row=0; row<dicNumber.count; row++)
    {
        // get the row position
        CGFloat yPos = defaultY + size * row + space * row;
        
        NSArray *arrNumber = [dicNumber objectForKey:[NSNumber numberWithInt:row]];
        for (int colum=0; colum<arrNumber.count; colum++)
        {
            UIColor *color = colum == 3?
                [UIColor colorWithRed:226.0/255.0 green:238.0/255.0 blue:67.0/255.0 alpha:1.0] :
                [UIColor colorWithRed:232.0/255.0 green:233.0/255.0 blue:219.0/255.0 alpha:1.0];
            
            [self createButtonWithTitle:arrNumber[colum] frame:CGRectMake(defaultX + size * colum + space * colum, yPos, size, size) andBackgroundColor:color];
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
    
    // UIControlEventTouchUpInside : if user press the button, the event will be implemented
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)onClick:(UIButton *)sender
{
    NSLog(@"%@", sender.titleLabel.text);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
