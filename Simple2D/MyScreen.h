//
//  MyScreen.h
//  Simple2D
//
//  Created by oleksiy martynov on 1/15/14.
//  Copyright (c) 2014 oleksiy martynov. All rights reserved.
//

#import <GLKit/GLKit.h>
#import "MyUpdatePro.h"
#import "MyDrawPro.h"
@interface MyScreen : NSObject <MyUpdatePro,MyDrawPro>
-(id)init;
-(id)update:(float) deltaTime;
-(void)draw;
-(void)setGameObjects:(NSMutableArray*) objList;
-(void)handleInput:(CGPoint) tapPoint;
@property (strong) NSMutableArray* objList;
@property (assign) CGPoint tapPoint;
@property (assign) BOOL tapPending;
@property(strong) GLKBaseEffect* effect;
@end
