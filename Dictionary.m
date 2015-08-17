//
//  Dictionary.m
//  24-HashTable
//
//  Created by Shehzad Popat on 4/29/15.
//  Copyright (c) 2015 Shehzad. All rights reserved.
//

#import "Dictionary.h"

@implementation Dictionary

- (id) init {
    
    self.keys = [[NSMutableArray alloc]init];
    self.values = [[NSMutableArray alloc]init];
    
    return self;
    
}

-(void) setValue:(NSObject *)value forKey:(NSObject *)key {
    
    long x = [self.keys indexOfObject:key];
    
    if (x !=  NSNotFound) {
        //get the index of the key
        NSUInteger i= [self.keys indexOfObject:key];
        //use the key's index to set the value in the correct place
        //self.values[i] =value;
        
        [self.values setObject:value atIndexedSubscript:i] ;
        
    } else {
        [self.keys addObject:key];
        [self.values addObject:value];
    }
    
}

-(void)removeValueForKey:(NSObject *)key {
    
    long x = [self.keys indexOfObject:key];
    
    if (x !=  NSNotFound) {
        //get the index of the key
        NSUInteger i= [self.keys indexOfObject:key];
        //use the key's index to remove the correct value
        [self.keys removeObject:key];
        [self.values removeObjectAtIndex:i];
    } else {
        NSLog(@"key not found");
    }
}

-(id) findValueForKey:(NSObject *)key {
    
    long x = [self.keys indexOfObject:key];
    
    if (x !=  NSNotFound) {
        NSUInteger i = [self.keys indexOfObject:key];
        return self.values[i];
    } else {
        return nil;
    }
   
}

@end
