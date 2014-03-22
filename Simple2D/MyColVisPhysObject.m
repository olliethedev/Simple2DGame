//
//  MyColVisPhysObject.m
//  Simple2D
//
//  Created by oleksiy martynov on 1/14/14.
//  Copyright (c) 2014 oleksiy martynov. All rights reserved.
//

#import "MyColVisPhysObject.h"
@interface MyColVisPhysObject()

@end
@implementation MyColVisPhysObject
@synthesize lastFreePosition=_lastFreePosition;
-(id) initCollidable:(GLKBaseEffect *)effect :(NSString*)fileName : (MyVector2*)position :(MyVector2*)velocity :(MyVector2*)box :(MyVector2*)rotation : (MyVector2*)rotationVelocity
{
    self=[super initVisual: effect :fileName :position :velocity :box :rotation :rotationVelocity];
    if(self)
    {
        self.lastFreePosition = position;
    }
    return self;
}
-(BOOL)collisionCheck: (MyColVisPhysObject *) otherObj
{
    if(self!=otherObj)
    {
        CGRect thisRect = CGRectMake(self.position.x, self.position.y, self.box.x, self.box.y);
        CGRect otherRect=CGRectMake(otherObj.position.x, otherObj.position.y, otherObj.box.x, otherObj.box.y);
        CGRect interRect =CGRectIntersection(thisRect, otherRect);
        if(!CGRectIsNull(interRect))
        {
            if([otherObj collisionConfirm:self])
            {
            self.position=self.lastFreePosition;
            MyVector2* tempVec = self.velocity;
            self.velocity=otherObj.velocity;
            otherObj.velocity=tempVec;
            //NSLog(@"bam");
            return true;
            }
            else
            {
                return false;
            }
        }
    }
    return false;
}
-(BOOL)collisionConfirm: (MyColVisPhysObject *) otherObject
{
    self.position=self.lastFreePosition;
    return true;
}

-(id)update:(float)deltaTime
{
    [self.sprite updateSprite:deltaTime];
    self.lastFreePosition=[[MyVector2 alloc]initWithData:self.position.x:self.position.y];
    [super update:deltaTime];
    return self;
}
@end
