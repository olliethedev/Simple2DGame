//
//  MyGameScreen.h
//  Simple2D
//
//  Created by oleksiy martynov on 1/15/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyScreen.h"
#import <GLKit/GLKit.h>
@interface MyGameScreen : MyScreen
-(id)initGameScreen:(GLKBaseEffect*)effect;
-(id)update:(float) deltaTime;

@end
