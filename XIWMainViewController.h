//
//  XIWMainViewController.m
//  CalculatorDemo
//
//  Created by Xinran Wang on 9/14/13.
//  Copyright (c) 2013 Xinran Wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import "XIWCalculatorModel.h"

@interface XIWMainViewController : UIViewController
{
    //our display
    IBOutlet UILabel *outputDisplay;
    
    //operations
    IBOutlet UIButton *equalsButton;
    IBOutlet UIButton *plusButton;
    IBOutlet UIButton *subtractButton;
    IBOutlet UIButton *multiplyButton;
    IBOutlet UIButton *divideButton;
    
    //top row
    IBOutlet UIButton *percentButton;
    IBOutlet UIButton *signButton;
    IBOutlet UIButton *clearButton;
    
    //misc
    IBOutlet UIButton *decimalButton;
    
    //numbers
    IBOutlet UIButton *nineButton;
    IBOutlet UIButton *eightButton;
    IBOutlet UIButton *sevenButton;
    IBOutlet UIButton *sixButton;
    IBOutlet UIButton *fiveButton;
    IBOutlet UIButton *fourButton;
    IBOutlet UIButton *threeButton;
    IBOutlet UIButton *twoButton;
    IBOutlet UIButton *oneButton;
    IBOutlet UIButton *zeroButton;
}

//button handlers
- (IBAction)numberPressed:(id)sender;
- (IBAction)operationPressed:(id)sender;
- (IBAction)otherPressed:(id)sender;

@end