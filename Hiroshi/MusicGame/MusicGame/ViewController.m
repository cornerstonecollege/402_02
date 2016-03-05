//
//  ViewController.m
//  MusicGame
//
//  Created by Hiroshi on 2/24/16.
//  Copyright © 2016 Hiroshi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) UIImageView *lifeImage1;
@property (nonatomic) UIImageView *lifeImage2;
@property (nonatomic) UIImageView *lifeImage3;
@property (nonatomic) UIImage *btnImage;
@property (nonatomic) UILabel *result;
@property (nonatomic) UIButton *retryButton;

@end

@implementation ViewController

NSMutableArray *arrButton;
CGFloat tm = 2.0;
NSTimer *timer;
int randNum, sumNum=0;
BOOL balloonFlg = false, gameFlg = true;


- (void)viewDidLoad {
    [super viewDidLoad];
    arrButton = [NSMutableArray array];
    
    [self createScreen];
    [self update];
}

- (void) stopTimer
{
    [timer invalidate];
    timer = nil;
}

- (void)update
{
    
    if(randNum >= 0)
    {
        [arrButton[randNum] setImage:nil forState:UIControlStateNormal];
    }
    
    randNum = arc4random_uniform(16);
    int randColor = arc4random_uniform(5);
    
    if (randColor != 0)
    {
        balloonFlg = false;
        _btnImage = [[UIImage imageNamed:@"yellowBalloon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        
    }else
    {
        balloonFlg = true;
        _btnImage = [[UIImage imageNamed:@"redBalloon.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    
    [arrButton[randNum] setImage:_btnImage forState:UIControlStateNormal];
    
    if (gameFlg)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:tm target:self selector:@selector(update) userInfo:nil repeats:NO];
    }
}

- (void)createScreen
{
    CGRect bounds = self.view.bounds;
    
    CGFloat sizeX = bounds.size.width * 0.2425;
    CGFloat sizeY = bounds.size.height * 0.2;
    
    CGFloat space = bounds.size.width * 0.01;
    
    NSDictionary *dicNumber =
    @{
      @0 : @[@"0", @"1", @"2", @"3"],
      @1 : @[@"4", @"5", @"6", @"7"],
      @2 : @[@"8", @"9", @"10", @"11"],
      @3 : @[@"12", @"13", @"14", @"15"],
    };
    
    _lifeImage1 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"life"]];
    _lifeImage1.frame = CGRectMake(bounds.size.width - bounds.size.height*0.05*3, 30, bounds.size.height*0.05, bounds.size.height*0.05);
    [self.view addSubview:_lifeImage1];
    
    _lifeImage2 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"life"]];
    _lifeImage2.frame = CGRectMake(bounds.size.width - bounds.size.height*0.05*2, 30, bounds.size.height*0.05, bounds.size.height*0.05);
    [self.view addSubview:_lifeImage2];
    
    _lifeImage3 = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"life"]];
    _lifeImage3.frame = CGRectMake(bounds.size.width - bounds.size.height*0.05*1, 30, bounds.size.height*0.05, bounds.size.height*0.05);
    [self.view addSubview:_lifeImage3];
    
    _result = [[UILabel alloc]init];
    _result.frame = CGRectMake(0, bounds.size.height*0.07, bounds.size.width, bounds.size.height*0.12);
    _result.text = [NSString stringWithFormat:@"%d", sumNum];
    _result.font=[UIFont fontWithName:@"Helvetica" size:50 ];
    _result.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_result];
    
    // create buttons
    for (int row=0; row<dicNumber.count; row++)
    {
        // get the row position
        CGFloat yPos = (sizeY + space) * row + bounds.size.height*0.17;
        
        NSArray *arrNumber = [dicNumber objectForKey:[NSNumber numberWithInt:row]];
        for (int colum=0; colum<arrNumber.count; colum++)
        {
            //UIColor *color = [UIColor colorWithRed:232.0/255.0 green:233.0/255.0 blue:219.0/255.0 alpha:1.0];
            
            [self createButtonWithTitle:arrNumber[colum] frame:CGRectMake(sizeX * colum + space * colum, yPos, sizeX, sizeY) andNum:row*4 + colum];
        }
    }
    
    UIImageView *bgImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sky"]];
    bgImageView.frame = bounds;
    [self.view addSubview:bgImageView];
    [self.view sendSubviewToBack:bgImageView];
}

- (void)createButtonWithTitle:(NSString *)title frame:(CGRect)frame andNum:(int)num
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    button.frame = frame;
    button.tag = [title integerValue];
    
    [arrButton addObject:button];
    
    
    // UIControlEventTouchUpInside : if user press the button, the event will be implemented
    [button addTarget:self action:@selector(onClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)onClick:(UIButton *)sender
{
    UIImage *popImage = [[UIImage imageNamed:@"pop.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    if (sender.tag == randNum && gameFlg)
    {
        NSLog(@"click");
        sumNum += 1;
        _result.text = [NSString stringWithFormat:@"%d", sumNum];
        [arrButton[randNum] setImage:popImage forState:UIControlStateNormal];
        if(tm > 0.7)
        {
            tm -= 0.05;
        }
        NSLog(@"%f", tm);
        
        if(balloonFlg)
        {
            NSLog(@"PASS");
            
            if(CGSizeEqualToSize(_lifeImage1.image.size, CGSizeZero) &&
               CGSizeEqualToSize(_lifeImage2.image.size, CGSizeZero) &&
               CGSizeEqualToSize(_lifeImage3.image.size, CGSizeZero))
            {
                [_lifeImage1 setImage:[UIImage imageNamed:@"life"]];
            }else if(CGSizeEqualToSize(_lifeImage2.image.size, CGSizeZero) &&
                     CGSizeEqualToSize(_lifeImage3.image.size, CGSizeZero))
            {
                [_lifeImage2 setImage:[UIImage imageNamed:@"life"]];
            }else if(CGSizeEqualToSize(_lifeImage3.image.size, CGSizeZero))
            {
                [_lifeImage3 setImage:[UIImage imageNamed:@"life"]];
            }
        }
    }
    else
    {
        NSLog(@"%f", tm);
        if(CGSizeEqualToSize(_lifeImage1.image.size, CGSizeZero) &&
           CGSizeEqualToSize(_lifeImage2.image.size, CGSizeZero) &&
           CGSizeEqualToSize(_lifeImage3.image.size, CGSizeZero))
        {
            NSLog(@"GAME OVER");
            if(gameFlg)
            {
                [arrButton[randNum] setImage:nil forState:UIControlStateNormal];
                
                [self performSelectorOnMainThread:@selector(stopTimer) withObject:nil waitUntilDone:YES];
                _retryButton = [UIButton buttonWithType:UIButtonTypeSystem];
                _retryButton.frame = CGRectMake(self.view.bounds.size.width/2 - self.view.bounds.size.height*0.1,
                                                self.view.bounds.size.height/2 - self.view.bounds.size.height*0.1,
                                                self.view.bounds.size.height*0.2,
                                                self.view.bounds.size.height*0.2);
                
                UIImage *retryImage = [[UIImage imageNamed:@"retry.png"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
                [_retryButton setImage:retryImage forState:UIControlStateNormal];
                [_retryButton addTarget:self action:@selector(onClickRetry:) forControlEvents:UIControlEventTouchUpInside];
                [self.view addSubview:_retryButton];
            }
            gameFlg = false;

        }else if(CGSizeEqualToSize(_lifeImage3.image.size, CGSizeZero) &&
                 !CGSizeEqualToSize(_lifeImage2.image.size, CGSizeZero))
        {
            NSLog(@"1");
            [_lifeImage2 setImage:nil];
        }else if(CGSizeEqualToSize(_lifeImage2.image.size, CGSizeZero))
        {
            NSLog(@"2");
            [_lifeImage1 setImage:nil];
        }else
        {
            [_lifeImage3 setImage:nil];
        }
    }
}

- (void)onClickRetry:(UIButton *)sender
{
    tm = 2.0;
    sumNum = 0;
    gameFlg = true;
    _result.text = [NSString stringWithFormat:@"%d", sumNum];
    [_lifeImage1 setImage:[UIImage imageNamed:@"life"]];
    [_lifeImage2 setImage:[UIImage imageNamed:@"life"]];
    [_lifeImage3 setImage:[UIImage imageNamed:@"life"]];
    [_retryButton removeFromSuperview];
    [self update];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
