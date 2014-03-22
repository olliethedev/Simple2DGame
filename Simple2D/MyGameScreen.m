//
//  MyGameScreen.m
//  Simple2D
//
//  Created by oleksiy martynov on 1/15/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyGameScreen.h"
#import "MyColVisPhysObject.h"
#import "MyCharSprite.h"
#import "MyTextPrinter.h"
#import "MyAppleObject.h"
#import "MyTapablePro.h"
#import "MyGraphics.h"
@implementation MyGameScreen
//@synthesize effect=_effect;
-(id)initGameScreen:(GLKBaseEffect *)effect
{
    self=[super init];
    if (self)
    {
        if(!effect)
        {
            NSLog(@"nil effect in game-screen object");
        }
        self.effect = effect;
        self.objList = [NSMutableArray array];
        NSLog(@"GameScreenConstructed");
    }
    return self;
}
-(void) testLevel
{
    MyColVisPhysObject* obj = [[MyColVisPhysObject alloc]initVisual:self.effect : @"ship.png" :[[MyVector2 alloc]initWithData: 30:0] :[[MyVector2 alloc]initWithData: 70:70] :[[MyVector2 alloc]initWithData: 50:50]:
                               [[MyVector2 alloc]initWithData: 0:0]: [[MyVector2 alloc]initWithData: 0:0]];
    MyCharSprite* testSprite =[[MyCharSprite alloc]initCharSprite:'A':32];
    [obj replaceSpriteWith:testSprite];
    
    id objTwo = [[MyColVisPhysObject alloc]initVisualAnimation:self.effect : @"Bug1.png" :[[MyVector2 alloc]initWithData: 250:0] :[[MyVector2 alloc]initWithData: 0:35] :[[MyVector2 alloc]initWithData: 50:50]:  [[MyVector2 alloc]initWithData: 0:0] : [[MyVector2 alloc]initWithData: 0:0] : 100 : 5 ];
    
    id objThree = [[MyColVisPhysObject alloc]initVisualAnimation:self.effect : @"explosion.png" :[[MyVector2 alloc]initWithData: 430:0] :[[MyVector2 alloc]initWithData: -35:35] :[[MyVector2 alloc]initWithData: 50:50]:  [[MyVector2 alloc]initWithData: 0:0] : [[MyVector2 alloc]initWithData: 0:0] : 100 : 5 ];
    
    
    MyAppleObject* appleObj = [[MyAppleObject alloc]initApple:100 :100 :180 :180];
    [self.objList addObject:appleObj];
    [self.objList addObject:obj];
    [self.objList addObject:objTwo];
    [self.objList addObject:objThree];
}
-(id)update:(float) deltaTime
{
    for (int i =0; i<[self.objList count]; i++)
    {
        NSMutableArray*  deleteList = [NSMutableArray array];
        if([[self.objList objectAtIndex:i]respondsToSelector:@selector(checkTap:)])
        {
            [[self.objList objectAtIndex:i] checkTap:[[MyVector2 alloc]initWithData:self.tapPoint.x:self.tapPoint.y]];
        }
        id obj=[[self.objList objectAtIndex:i] update: deltaTime];
        if(!obj)
        {
            [deleteList addObject:obj];
        }
        else
        {
           [self.objList replaceObjectAtIndex:i withObject:obj];
        }
        [self.objList removeObjectsInArray:deleteList];
    }
    
    for (MyColVisPhysObject* obj in self.objList)
    {
        if(obj.position.x<0)
        {
            obj.position = [[MyVector2 alloc]initWithData: 0: obj.position.y];
            obj.velocity=[[MyVector2 alloc]initWithData: obj.velocity.x*-1: obj.velocity.y];
        }
        if(obj.position.y<0)
        {
            obj.position = [[MyVector2 alloc]initWithData: obj.position.x: 0];
                            obj.velocity=[[MyVector2 alloc]initWithData: obj.velocity.x: obj.velocity.y*-1];
        }
        if(obj.position.x+obj.box.x>MyGraphics.width)
        {
            obj.position = [[MyVector2 alloc]initWithData: MyGraphics.width-obj.box.x: obj.position.y];
            obj.velocity=[[MyVector2 alloc]initWithData: obj.velocity.x*-1: obj.velocity.y];
        }
        if(obj.position.y+obj.box.y>MyGraphics.height)
        {
            obj.position = [[MyVector2 alloc]initWithData: obj.position.x: MyGraphics.height-obj.box.y];
            obj.velocity=[[MyVector2 alloc]initWithData: obj.velocity.x: obj.velocity.y*-1];
        }
    }
    for (MyColVisPhysObject* obj in self.objList)
    {
        for (MyColVisPhysObject* objOther in self.objList)
        {
            if([obj respondsToSelector:@selector(collisionCheck:)]&&[objOther respondsToSelector:@selector(collisionCheck:)])
            {
                [obj collisionCheck:objOther];
            }
        }
    }
    //todo if button clicked return to homescreen
    return self;
}




@end
