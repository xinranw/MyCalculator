//
//  XIWMainViewController.m
//  CalculatorDemo
//
//  Created by Tanvir Ahmed on 9/4/13.
//  Copyright (c) 2013 Tanvir Ahmed. All rights reserved.
//

#import "XIWMainViewController.h"

@interface XIWMainViewController ()
- (void)setButtonBorders;
@end

@implementation XIWMainViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    //set up the button borders
    [self setButtonBorders];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) setButtonBorders
{
    //collection of all our buttons
    NSArray *buttons = [[NSArray alloc] initWithObjects:
                        zeroButton,
                        oneButton,
                        twoButton,
                        threeButton,
                        fourButton,
                        fiveButton,
                        sixButton,
                        sevenButton,
                        eightButton,
                        nineButton,
                        decimalButton,
                        clearButton,
                        signButton,
                        percentButton,
                        divideButton,
                        multiplyButton,
                        subtractButton,
                        plusButton,
                        equalsButton, nil];
    
    //set the button borders
    for (UIButton *button in buttons) {
        [[button layer] setBorderWidth:1.0f];
        [[button layer] setBorderColor:[UIColor blackColor].CGColor];
    }
}

- (IBAction)numberPressed:(id)sender
{
    //handle the case when a number or a decimal is pressed
    NSLog(@"%@ pressed.", [[sender titleLabel] text]);
}

- (IBAction)operationPressed:(id)sender
{
    //handle the case when /, X, -, +, = is pressed
    NSLog(@"%@ pressed.", [[sender titleLabel] text]);
}

- (IBAction)otherPressed:(id)sender
{
    //handle the case when C, +/-, % is pressed
    NSLog(@"%@ pressed.", [[sender titleLabel] text]);
}

@end
