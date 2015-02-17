//
//  ScaryBugData.h
//  ScaryBugs
//
//  Created by Luca Diolaiuti on 13/02/15.
//  Copyright (c) 2015 Luca Diolaiuti. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaryBugData : NSObject

@property (strong) NSString *title;
@property (assign) float rating;

- (id)initWithTitle:(NSString*)title rating:(float)rating;

@end
