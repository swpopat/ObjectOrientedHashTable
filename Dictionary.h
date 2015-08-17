//
//  Dictionary.h
//  24-HashTable
//
//  Created by Shehzad Popat on 4/29/15.
//  Copyright (c) 2015 Shehzad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Names.h"

@interface Dictionary : NSObject

@property (nonatomic, strong) NSMutableArray *keys;
@property (nonatomic, strong) NSMutableArray *values;

-(void) setValue:(NSObject *)value forKey:(NSObject *)key;

-(void)removeValueForKey:(NSObject *)key;

-(id) findValueForKey:(NSObject *)key;


@end
