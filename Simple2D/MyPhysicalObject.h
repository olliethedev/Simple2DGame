//
//  MyPhysicalObject.h
//  Simple2D
//
//  Created by oleksiy martynov on 1/13/14.
//  Copyright (c) 2014 oleksiy martynov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "MyUpdatePro.h"
#import "MyVector2.h"

@interface MyPhysicalObject : NSObject <MyUpdatePro>
@property (strong) MyVector2* position;
@property (strong) MyVector2* velocity;
@property (strong) MyVector2* box;
@property (strong) MyVector2* rotation;
@property (strong) MyVector2* rotationVelocity;

-(id) init;
-(id)initWithData : (MyVector2*) position : (MyVector2*) velocity :
(MyVector2*) box : (MyVector2*) rotation : (MyVector2*)rotationVelocity;
-(id)update:(float)deltaTime;
@end
