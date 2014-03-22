//
//  MyVisualPhysicalObject.m
//  Simple2D
//
//  Created by oleksiy martynov on 1/13/14.
//  Copyright (c) 2014 oleksiy martynov. All rights reserved.
//

#import "MyVisualPhysicalObject.h"
#import "MyAnimatedSprite.h"
#import "MyCharSprite.h"
@implementation MyVisualPhysicalObject
@synthesize sprite=_sprite;
-(id)initVisual:(GLKBaseEffect *)effect :(NSString*)fileName : (MyVector2*)position :(MyVector2*)velocity :(MyVector2*)box :(MyVector2*)rotation : (MyVector2*)rotationVelocity
{
    self=[super initWithData:position :velocity :box :rotation : rotationVelocity];
    if(self)
    {
 
        self.sprite=[[MySprite alloc]initWithFile :fileName : effect ];

    }
    return self;
}
-(id)initVisualAnimation:(GLKBaseEffect *)effect :(NSString*)fileName : (MyVector2*)position :(MyVector2*)velocity :(MyVector2*)box :(MyVector2*)rotation : (MyVector2*)rotationVelocity : (int) spriteStep : (int) framesPerStep
{
    self=[super initWithData:position :velocity :box :rotation : rotationVelocity];
    if(self)
    {
        self.sprite =[[MyAnimatedSprite alloc]initAnimatedSprite:fileName :effect :spriteStep :framesPerStep];
    }
    return self;
}
-(instancetype)initVisualChar : (MyVector2*)position : (MyVector2*)box : (char) ch
{
    self=[super initWithData:position :[MyVector2 zero]  : box :[MyVector2 zero] :[MyVector2 zero]];
    if(self)
    {
        self.sprite=[[MyCharSprite alloc]initCharSprite:ch:32];
    }
    return self;
}
-(void)replaceSpriteWith:(MySprite*) newSprite
{
    self.sprite=newSprite;
}
-(void)draw
{
    [self.sprite draw:self];
}
-(id)update:(float)deltaTime
{
    
    [self.sprite updateSprite:deltaTime];
    [super update:deltaTime];
    return self;
}
@end
