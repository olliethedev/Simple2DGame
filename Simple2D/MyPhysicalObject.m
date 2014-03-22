//
//  MyPhysicalObject.m
//  Simple2D
//
//  Created by oleksiy martynov on 1/13/14.
//  Copyright (c) 2014 oleksiy martynov. All rights reserved.
//

#import "MyPhysicalObject.h"

@implementation MyPhysicalObject
@synthesize position=_position;
@synthesize velocity=_velocity;
@synthesize box=_box;
@synthesize rotation=_rotation;
@synthesize rotationVelocity=_rotationVelocity;
-(id)init
{
    self=[super init];
    if(self)
    {
        self.position=[[MyVector2 alloc]initWithData: 0:0];
        self.velocity=[[MyVector2 alloc]initWithData: 0:0];
        self.box=[[MyVector2 alloc]initWithData: 10:10];
        self.rotation=[[MyVector2 alloc]initWithData: 0:0];
    }
    return self;
}
-(id)initWithData : (MyVector2*) position : (MyVector2*) velocity :
(MyVector2*) box : (MyVector2*) rotation : (MyVector2*) rotationVelocity
{
    self=[super init];
    if(self)
    {
        self.position=position;
        self.velocity=velocity;
        self.box=box;
        self.rotation=rotation;
        self.rotationVelocity=rotationVelocity;
    }
    return self;
}
-(id)update:(float)deltaTime
{
    MyVector2* curMove = [MyVector2 multiplyScalar:self.velocity : deltaTime];
    MyVector2* curRot=[MyVector2 multiplyScalar:self.rotationVelocity: deltaTime];
    [MyVector2 assign:[MyVector2 add:curRot :self.rotation] to: self.rotation];
    [MyVector2 assign:[MyVector2 add:curMove :self.position] to: self.position];
    
    return self;
}

@end
