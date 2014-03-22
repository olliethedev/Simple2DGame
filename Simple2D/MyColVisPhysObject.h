//
//  MyColVisPhysObject.h
//  Simple2D
//
//  Created by oleksiy martynov on 1/14/14.
//  Copyright (c) 2014 oleksiy martynov. All rights reserved.
//

#import "MyVisualPhysicalObject.h"

@interface MyColVisPhysObject : MyVisualPhysicalObject
-(id) initCollidable:(GLKBaseEffect *)effect :(NSString*)fileName : (MyVector2*)position :(MyVector2*)velocity :(MyVector2*)box :(MyVector2*)rotation : (MyVector2*)rotationVelocity;
-(BOOL)collisionCheck: (MyColVisPhysObject *) otherObj;
-(BOOL)collisionConfirm: (MyColVisPhysObject *) otherObject;
-(id)update:(float)deltaTime;
@property (strong) MyVector2* lastFreePosition;

@end
