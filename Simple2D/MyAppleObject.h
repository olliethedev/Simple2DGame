//
//  MyAppleObject.h
//  Simple2D
//
//  Created by admin user on 1/31/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyColVisPhysObject.h"

@interface MyAppleObject : MyColVisPhysObject
-(instancetype)initApple:  (int)xPos : (int)yPos : (int)width : (int)height;
-(BOOL)collisionCheck:(MyColVisPhysObject *)otherObj;
-(BOOL)collisionConfirm: (MyColVisPhysObject *) otherObject;
-(void)draw;
-(instancetype)update:(float)deltaTime;
@end
