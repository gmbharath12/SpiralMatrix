//
//  main.m
//  SpiralMatrix
//
//  Created by Bharath G M on 12/30/15.
//  Copyright (c) 2015 Bharath G M. All rights reserved.
//


#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSArray* array = @[@[@"a", @"d", @"g", @"e", @"t", @"c"],
                           @[@"p", @"k",@"h", @"w", @"e", @"f"],
                           @[@"m", @"j",@"y",@"h",@"b",@"n"],
                           @[@"e", @"o",@"j",@"n",@"g",@"y"] ];
        
        
        NSArray* tempArray;
        NSMutableString* outputString = [[NSMutableString alloc] init]; //append the string and print it later.
        int endRowIndex = (int)[array count]-1;
        //assuming all the inner array are of same size.
        int endColumnIndex = (int)[[array lastObject] count]-1;
        int startColumnIndex = 0;
        int iterator = startColumnIndex;
        int startRowIndex = 0;
        while (startRowIndex < endRowIndex && startColumnIndex < endColumnIndex)
        {
            tempArray = [array objectAtIndex:startRowIndex];
            for (iterator = startColumnIndex ; iterator <= endColumnIndex; ++iterator)
            {
                [outputString appendString:(NSString*)[tempArray objectAtIndex:iterator]];
            }
            startRowIndex++;
            
            for (iterator = startRowIndex; iterator <= endRowIndex; ++iterator) {
                tempArray = [array objectAtIndex:iterator];
                [outputString appendString:(NSString*)[tempArray objectAtIndex:endColumnIndex]];
                
            }
            endColumnIndex--;
            
            if ( startRowIndex <= endColumnIndex)
            {
                tempArray = [array objectAtIndex:endRowIndex];
                for (iterator = endColumnIndex; iterator >= startColumnIndex; --iterator)
                {
                    [outputString appendString:(NSString*)[tempArray objectAtIndex:iterator]];
                }
                endRowIndex--;
            }
            
            if (startColumnIndex <= endColumnIndex)
            {
                
                for (iterator = endRowIndex; iterator >= startRowIndex; --iterator)
                {
                    tempArray = [array objectAtIndex:iterator];
                    [outputString appendString:(NSString*)[tempArray objectAtIndex:startColumnIndex]];
                    
                }
                startColumnIndex++;
            }
        }
        NSLog(@"%@", outputString);
        
        
    }
    return 0;
}

void printSpiralWithArray(NSArray* array)
{
    if (array == nil) {
        return;
    }
    NSArray* tempArray;
    int endRowIndex = [array count];//m
    //assuming all the inner array are of same size.
    int endColumnIndex = [[array lastObject] count]; //n
    int startColumnIndex = 0;//l
    int iterator = startColumnIndex;
    int startRowIndex = 0; //k
    while (startRowIndex < endRowIndex && startColumnIndex < endColumnIndex)
    {
        tempArray = [array objectAtIndex:startRowIndex];
        for (iterator = startColumnIndex ; iterator < endColumnIndex; ++iterator)
        {
            NSLog(@"%@", [tempArray objectAtIndex:iterator]);
        }
        startRowIndex++;
        
        for (iterator = startRowIndex; iterator < endRowIndex; ++iterator) {
            tempArray = [array objectAtIndex:iterator];
            NSLog(@"%@", [tempArray objectAtIndex:endColumnIndex]);
        }
        endColumnIndex--;
        
        if ( startRowIndex < endColumnIndex)
        {
            tempArray = [array objectAtIndex:endRowIndex];
            for (iterator = endColumnIndex-1; iterator >= startColumnIndex; --iterator)
            {
                NSLog(@"%@",[tempArray objectAtIndex:iterator]);
            }
            endRowIndex--;
        }

        if (startColumnIndex < endColumnIndex)
        {

            for (iterator = endRowIndex-1; iterator >= startRowIndex; --iterator)
            {
                tempArray = [array objectAtIndex:iterator];
                NSLog(@"%@", [tempArray objectAtIndex:startColumnIndex]);

            }
            startColumnIndex++;
        }

        
    }
    
}

