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
    _numbers = [NSSet setWithArray:[NSArray arrayWithObjects:@"0", @"1", @"2", @"3", @"4", @"5", @"6", @"7", @"8", @"9", @".",nil]];
    _operators = [NSSet setWithArray:[NSArray arrayWithObjects:@"=", @"-", @"+", @"X", @"/", nil]];
    _others = [NSSet setWithArray:[NSArray arrayWithObjects:@"C", @"+/-", @"%", nil]];
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
    
    if ([_numbers containsObject:[_calculatorModel getLastButtonPress]]){
        // If last button press was a number
        if ([buttonPressed isEqual:@"."] && ([[[_calculatorModel inputArray] objectAtIndex:currIndex] rangeOfString:buttonPressed].location == NSNotFound)){
            // If decimal has not been pressed yet
            [_calculatorModel appendIntoArray:buttonPressed atIndex:currIndex];
        } else if (![buttonPressed isEqual:@"."]){
            [_calculatorModel appendIntoArray:buttonPressed atIndex:currIndex];
        }
    } else {
        // If last button press was not a number
        if ([[_calculatorModel getLastButtonPress] isEqualToString:@"="])
            [_calculatorModel reset];
        [_calculatorModel insertIntoArray:buttonPressed atIndex:([_calculatorModel getIndex] + 1)];
        [_calculatorModel setCurrIndex:([_calculatorModel getIndex] + 1)];
    }
    [_calculatorModel setLastButtonPress:buttonPressed];
    [self updateOutputDisplay];
}

- (IBAction)operationPressed:(id)sender
{
    //handle the case when /, X, -, +, = is pressed
    NSString *buttonPressed = [[sender titleLabel] text];   // Store current button press
    NSInteger currIndex = [_calculatorModel getIndex];      // Store current inputArray index
    NSString *lastButtonPress = [_calculatorModel getLastButtonPress];
    
    if (currIndex == 2)
        [_calculatorModel evaluate];
    if ([lastButtonPress isEqualToString:@"="]){
    } else if ([_operators containsObject:lastButtonPress]){
        // If last button pressed is an operator
        [_calculatorModel replaceIntoArray:buttonPressed atIndex:1];
        [_calculatorModel setCurrIndex: 1];
    } else if (![buttonPressed isEqualToString:@"="]){
        [_calculatorModel insertIntoArray:buttonPressed atIndex:1];
        [_calculatorModel setCurrIndex:1];
    }
    [_calculatorModel setLastButtonPress:buttonPressed];
    [self updateOutputDisplay];
    
}

- (IBAction)otherPressed:(id)sender
{
    //handle the case when C, +/-, % is pressed
    NSString *buttonPressed = [[sender titleLabel] text];   // Store current button press
    NSInteger currIndex = [_calculatorModel getIndex];      // Store current inputArray index
    
    if ([buttonPressed isEqualToString:@"C"])
        [_calculatorModel reset];
    else if ([buttonPressed isEqualToString:@"+/-"]){
        if (currIndex == 2)
            [_calculatorModel reverseSignAtIndex:currIndex];
        else
            [_calculatorModel reverseSignAtIndex:0];
    } else if ([buttonPressed isEqualToString:@"%"]){
        if (currIndex == 2)
            [_calculatorModel percentAtIndex:currIndex];
        else
            [_calculatorModel percentAtIndex:0];
    }
        
    else if ([buttonPressed isEqualToString:@"%"])
    [_calculatorModel setLastButtonPress:buttonPressed];
    [self updateOutputDisplay];
}

- (void)updateOutputDisplay
{
    NSString *displayString = [[[_calculatorModel inputArray] valueForKey:@"description"] componentsJoinedByString:@""];
    outputDisplay.text = displayString; 
}





@end
