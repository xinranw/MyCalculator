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
    _inputArray= [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < 3; i++)
    {
        [_inputArray addObject:@""];
    }
    
    _currIndex = [NSNumber numberWithInt:(-1)];
    
    return self;
}

- (void)insertIntoArray:(NSString *)input atIndex:(NSInteger)index
{
    [_inputArray replaceObjectAtIndex: index withObject: input];
    _currIndex = [NSNumber numberWithInt: index];
}

- (void)appendIntoArray:(NSString *)input atIndex:(NSInteger)index
{
    NSString *temp = [[_inputArray objectAtIndex:index] stringByAppendingString:input];
    [_inputArray replaceObjectAtIndex: index withObject: temp];
}

- (void)setLastButtonPress:(NSString *)button
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


//-(void)evaluate:(NSString *)calcOperator
//{
//    
//}




@end
