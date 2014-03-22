//
//  MyAction.h
//  Simple2D
//
//  Created by oleksiy martynov on 1/24/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyUpdatePro.h"
#import "MyDrawPro.h"
#import "MyVector2.h"
#import <GLKit/GLKit.h>
@interface MyAction : NSObject <MyUpdatePro,MyDrawPro>

-(instancetype)initAction:(MyVector2*)start : (int)framesPerIncrement : (MyVector2*)end;
-(id)update:(float) deltaTime;
-(void)draw;

@end
