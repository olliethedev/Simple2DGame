//
//  MyVisualPhysicalObject.h
//  Simple2D
//
//  Created by oleksiy martynov on 1/13/14.
//  Copyright (c) 2014 oleksiy martynov. All rights reserved.
//

#import "MyPhysicalObject.h"
#import "MySprite.h"
#import "MyDrawPro.h"

@interface MyVisualPhysicalObject : MyPhysicalObject <MyDrawPro>
-(instancetype)initVisual:(GLKBaseEffect *)effect :(NSString*)fileName : (MyVector2*)position :(MyVector2*)velocity :(MyVector2*)box :(MyVector2*)rotation : (MyVector2*)rotationVelocity ;
-(instancetype)initVisualAnimation:(GLKBaseEffect *)effect :(NSString*)fileName : (MyVector2*)position :(MyVector2*)velocity :(MyVector2*)box :(MyVector2*)rotation : (MyVector2*)rotationVelocity : (int) spriteStep : (int) framesPerStep;
-(instancetype)initVisualChar : (MyVector2*)position : (MyVector2*)box : (char) ch ;
-(void)draw;
-(id)update:(float)deltaTime;
-(void)replaceSpriteWith:(MySprite*) newSprite;
@property (strong) MySprite* sprite;
@end
