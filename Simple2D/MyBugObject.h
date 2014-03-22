//
//  MyBugObject.h
//  Simple2D
//
//  Created by oleksiy martynov on 2/13/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyColVisPhysObject.h"
#import "MyTapablePro.h"
@interface MyBugObject : MyColVisPhysObject
-(instancetype)initBug: (MyVector2*) position : (MyVector2*)velocity : (MyVector2*)size;
-(void)addOntapEvent:(SEL) method : (id) caller;
-(void)deleteOnTapEvent:(SEL)method : (id)caller;
-(void)checkTap:(MyVector2*) point;
-(id)update:(float)deltaTime;
@end
