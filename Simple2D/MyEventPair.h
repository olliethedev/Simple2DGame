//
//  MyEventPair.h
//  Simple2D
//
//  Created by oleksiy martynov on 2/13/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyEventPair : NSObject
@property  SEL method;
@property (strong) id caller;
@end
