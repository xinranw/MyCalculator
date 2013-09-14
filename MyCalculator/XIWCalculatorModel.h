//
//  XIWCalculatorModel.h
//  MyCalculator
//
//  Created by Xinran Wang on 9/14/13.
//  Copyright (c) 2013 Xinran Wang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XIWCalculatorModel : NSObject
{
    //implement this
}

//add any properties you need
@property (nonatomic, strong) NSMutableArray *inputArray;

//add any methods you need
-(void)insertIntoArray:(NSString *)input atIndex:(NSInteger)index;
-(void)appendIntoArray:(NSString *)input atIndex:(NSInteger)index;
-(void)setLastButtonPress:(NSString *)button;
-(NSString *)getLastButtonPress;
-(int)getIndex;
@end
