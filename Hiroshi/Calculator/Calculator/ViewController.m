//
//  ViewController.m
//  Calculator
//
//  Created by Hiroshi on 2/16/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@end

@implementation ViewController

NSString *tmp;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btn1Click:(UIButton *)sender
{
    tmp = [NSString stringWithFormat:@"%@1", tmp];
}

- (IBAction)btn2Click:(UIButton *)sender
{
    tmp = [NSString stringWithFormat:@"%@2", tmp];
}

- (IBAction)btn3Click:(UIButton *)sender
{
    tmp = [NSString stringWithFormat:@"%@3", tmp];
}

- (IBAction)btn4Click:(UIButton *)sender
{
    tmp = [NSString stringWithFormat:@"%@4", tmp];
}

- (IBAction)btn5Click:(UIButton *)sender
{
    tmp = [NSString stringWithFormat:@"%@5", tmp];
}

- (IBAction)btn6Click:(UIButton *)sender
{
    tmp = [NSString stringWithFormat:@"%@6", tmp];
}

- (IBAction)btn7Click:(UIButton *)sender
{
    tmp = [NSString stringWithFormat:@"%@7", tmp];
}

- (IBAction)btn8Click:(UIButton *)sender
{
    tmp = [NSString stringWithFormat:@"%@8", tmp];
}

- (IBAction)btn9Click:(UIButton *)sender
{
    tmp = [NSString stringWithFormat:@"%@9", tmp];
}

- (IBAction)btn0Click:(UIButton *)sender
{
    if (!tmp) {
        tmp = [NSString stringWithFormat:@"%@0", tmp];
    }
}


@end
