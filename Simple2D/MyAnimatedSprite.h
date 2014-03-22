//
//  MyAnimatedSprite.h
//  Simple2D
//
//  Created by oleksiy martynov on 1/18/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MySprite.h"

@interface MyAnimatedSprite : MySprite
-(id)initAnimatedSprite:(NSString*)fileName : (GLKBaseEffect *)effect : (int)spriteStep :(int) framesPerStep;
-(id)updateSprite:(float) deltaTime;

@end
