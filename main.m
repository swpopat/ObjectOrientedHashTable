//
//  main.m
//  25-ObjectOrientedHashTable
//
//  Created by Shehzad Popat on 4/30/15.
//  Copyright (c) 2015 Shehzad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dictionary.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSURL *url = [NSURL fileURLWithPath:@"file path goes here"];
        NSString *fileContent = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:nil];
        NSArray *lineByLine = [fileContent componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\n"]];
        NSMutableArray *contactArray = [[NSMutableArray alloc]init];
        NSMutableArray *duplicateArray = [[NSMutableArray alloc]init];

        for (int i=0; i < lineByLine.count; i++) {
            NSArray *attributes = [lineByLine[i] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
            Names *info = [[Names alloc]init];
            info.name = attributes[0];
            info.address = attributes[1];
            [contactArray addObject:info];
            [duplicateArray addObject:info.name];
        }
        Dictionary * contactCount = [[Dictionary alloc]init];
        for(int i = 0; i < contactArray.count; i++) {
                if ((contactCount.keys.count > 0) && ![contactCount findValueForKey:[contactArray[i] name]]) {
                    NSString * count = [contactCount findValueForKey:[contactArray[i] name]];
                    int newCount = [count intValue] + 1;
                    NSString * newerCount = [NSString stringWithFormat:@"%i", newCount];
                    [contactCount setValue:newerCount forKey:[contactArray[i] name]];
                } else {
                    NSString * contact = [contactArray[i] name];
                    [contactCount setValue:@"1" forKey:contact];
                }
        }
        for (int i = 0; i < [contactCount.keys count]; i++) {
            NSLog(@"\nKey:%@\nCount:%@\n\n", contactCount.keys[i], contactCount.values[i]);
        }
    }
    return 0;
    
}

