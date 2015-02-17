//
//  ScaryBugData.m
//  ScaryBugs
//
//  Created by Luca Diolaiuti on 13/02/15.
//  Copyright (c) 2015 Luca Diolaiuti. All rights reserved.
//

#import "ScaryBugData.h"

@implementation ScaryBugData


//crea metodi di accesso alle properties
@synthesize title = _title;
@synthesize rating = _rating;

- (id)initWithTitle:(NSString *)title rating:(float)rating{
    if((self = [super init])){
        self.title = title;
        self.rating = rating;
    }
    
    return self;
}

@end
