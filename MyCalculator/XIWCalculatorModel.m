//
//  XIWCalculatorModel.m
//  MyCalculator
//
//  Created by Xinran Wang on 9/14/13.
//  Copyright (c) 2013 Xinran Wang. All rights reserved.
//

#import "XIWCalculatorModel.h"

@interface XIWCalculatorModel()
//declare any private properties
@property (nonatomic, strong) NSString *lastButtonPress;
@property (nonatomic, assign) NSNumber *currIndex;

//declare any private methods

@end

@implementation XIWCalculatorModel
//implement any methods you declared
-(id)init
{
    _inputArray = [[NSMutableArray alloc] initWithObjects:@"0", @"", @"", nil];
    
    _currIndex = [NSNumber numberWithInt:(-1)];
    
    return self;
}

- (void)insertIntoArray:(NSString *)input atIndex:(NSInteger)index
{
    [_inputArray replaceObjectAtIndex: index withObject: input];
}

- (void)appendIntoArray:(NSString *)input atIndex:(NSInteger)index
{
    NSString *temp = [[_inputArray objectAtIndex:index] stringByAppendingString:input];
    [_inputArray replaceObjectAtIndex: index withObject: temp];
}

-(void)replaceIntoArray:(NSString *)input atIndex:(NSInteger)index
{
    [_inputArray replaceObjectAtIndex: index withObject: input];
}

-(void)setCurrIndex:(int)index
{
    _currIndex = [NSNumber numberWithInt: index];
}

-(void)setLastButtonPress:(NSString *)button
{
    _lastButtonPress = button;
}

- (NSString *)getLastButtonPress
{
    return _lastButtonPress;
}

- (int)getIndex
{
    return [_currIndex integerValue];
}


-(void)evaluate
{
    NSNumberFormatter *doubleFormatter = [[NSNumberFormatter alloc] init];
    [doubleFormatter setUsesSignificantDigits:TRUE];
    
    NSString *calcOperator = [_inputArray objectAtIndex:1];
    double result = 0.0;

    if ([calcOperator isEqualToString:@"+"])
        result = [[_inputArray objectAtIndex:0] doubleValue] + [[_inputArray objectAtIndex:2] doubleValue];
    else if ([calcOperator isEqualToString:@"-"])
        result = [[_inputArray objectAtIndex:0] doubleValue] - [[_inputArray objectAtIndex:2] doubleValue];
    else if ([calcOperator isEqualToString:@"X"])
        result = [[_inputArray objectAtIndex:0] doubleValue] * [[_inputArray objectAtIndex:2] doubleValue];
    else if ([calcOperator isEqualToString:@"/"])
        result = [[_inputArray objectAtIndex:0] doubleValue] / [[_inputArray objectAtIndex:2] doubleValue];
    else
        NSLog(@"unsupported operator");

    NSString *formatterResult = [doubleFormatter stringFromNumber:[NSNumber numberWithDouble:result]];
    [self reset];
    [_inputArray replaceObjectAtIndex:0 withObject:formatterResult];
    _currIndex = [NSNumber numberWithInt: 0];
}

-(void)reset
{
    [_inputArray replaceObjectAtIndex:0 withObject:@"0"];
    [_inputArray replaceObjectAtIndex:1 withObject:@""];
    [_inputArray replaceObjectAtIndex:2 withObject:@""];
    _currIndex = [NSNumber numberWithInt: -1];
}

-(void)reverseSignAtIndex:(NSInteger)index
{
    
}

@end
