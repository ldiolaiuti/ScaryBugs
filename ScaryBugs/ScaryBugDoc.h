//
//  ScaryBugDoc.h
//  ScaryBugs
//
//  Created by Luca Diolaiuti on 13/02/15.
//  Copyright (c) 2015 Luca Diolaiuti. All rights reserved.
//

#import <Foundation/Foundation.h>

@import UIKit;

@class ScaryBugData;

@interface ScaryBugDoc : NSObject

@property (strong) ScaryBugData *data;
@property (strong) UIImage *thumbImage;
@property (strong) UIImage *fullImage;

- (id) initWithTitle:(NSString*) title rating:(float)rating thumbImage:(UIImage*)thumbImage fullImage:(UIImage*)fullImage;

@end
