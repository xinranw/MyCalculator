//
//  XIWMainViewController.m
//  CalculatorDemo
//
//  Created by Xinran Wang on 9/14/13.
//  Copyright (c) 2013 Xinran Wang. All rights reserved.
//

#import "XIWMainViewController.h"
#import "XIWCalculatorModel.h"

@interface XIWMainViewController ()
//private properties and methods
@property (nonatomic, strong) XIWCalculatorModel *calculatorModel;
@property (nonatomic, strong) NSSet *numbers;
@property (nonatomic, strong) NSSet *operators;
@property (nonatomic, strong) NSSet *others;

//- (void)updateOutputDisplay;
- (void)setButtonBorders;


@end

@implementation XIWMainViewController
// Initialization
//XIWCalculatorModel *calculatorModel;


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _calculatorModel = [[XIWCalculatorModel alloc] init];
    _numbers = [NSSet setWithArray:[NSArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @"."]];
    _operators = [NSSet setWithArray:[NSArray arrayWithObjects:@"=", @"-", @"+", @"X", @"/"]];
    _others = [NSSet setWithArray:[NSArray arrayWithObjects:@"C", @"+/-", @"%", @"3", @"4", @"5", @"6", @"7", @"8", @"9"]];
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


//    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
//    NSNumber *myNumber = [f numberFromString:[[sender titleLabel] text]];


//NSString *string = @"hello bla bla";
//if ([string rangeOfString:@"bla"].location == NSNotFound) {
//    NSLog(@"string does not contain bla");
//} else {
//    NSLog(@"string contains bla!");
//}

// Handle the case when a number or a decimal is pressed
- (IBAction)numberPressed:(id)sender
{
    NSString *buttonPressed = [[sender titleLabel] text];   // Store current button press
    NSInteger currIndex = [_calculatorModel getIndex];      // Store current inputArray index
    if ([buttonPressed isEqual:@"."]){
        NSLog(@"%d", [[[_calculatorModel inputArray] objectAtIndex:0] rangeOfString:buttonPressed].location == NSNotFound);
    }
    
    if ([_numbers containsObject:[_calculatorModel getLastButtonPress]] && ![buttonPressed isEqual:@"."]){
        // If last button press was a number and current button press isn't a decimal
        [_calculatorModel appendIntoArray:buttonPressed atIndex:currIndex];
    } else if ([buttonPressed isEqual:@"."] && ([[[_calculatorModel inputArray] objectAtIndex:currIndex] rangeOfString:buttonPressed].location == NSNotFound)) {
        // If decimal has not been pressed yet
        [_calculatorModel appendIntoArray:buttonPressed atIndex:currIndex];
    } else if ([buttonPressed isEqual:@"."]){
    } else {
        // If last button press was not a number
        [_calculatorModel insertIntoArray:buttonPressed atIndex:([_calculatorModel getIndex] + 1)];
    }
    [_calculatorModel setLastButtonPress:buttonPressed];
    [self updateOutputDisplay];
}

- (IBAction)operationPressed:(id)sender
{
    //handle the case when /, X, -, +, = is pressed
    NSLog(@"%@ pressed.", [[sender titleLabel] text]);
    
//    NSString *buttonPressed = [[sender titleLabel] text];   // Store current button press
//    NSInteger currIndex = [_calculatorModel getIndex];      // Store current inputArray index
    
    
    
    
    [self updateOutputDisplay];
}

- (IBAction)otherPressed:(id)sender
{
    //handle the case when C, +/-, % is pressed
    NSLog(@"%@ pressed.", [[sender titleLabel] text]);
    [self updateOutputDisplay];
}

- (void)updateOutputDisplay
{    
    NSString *displayString = [[[_calculatorModel inputArray] valueForKey:@"description"] componentsJoinedByString:@""];
//    [NSString stringWithFormat:@"%d", [_calculatorModel.something integerValue]];
    outputDisplay.text = displayString; 
}





@end
