//
//  MyScreen.m
//  Simple2D
//
//  Created by oleksiy martynov on 1/15/14.
//  Copyright (c) 2014 oleksiy martynov. All rights reserved.
//

#import "MyScreen.h"
#import "MyColVisPhysObject.h"
@interface MyScreen()

@end
@implementation MyScreen
@synthesize objList=_objList;
@synthesize tapPending=_tapPending;
@synthesize tapPoint=_tapPoint;
@synthesize effect = _effect;
-(id)init
{
    self=[super init];
    if (self)
    {
        self.objList = [NSMutableArray array];
        NSLog(@"ParentScreenConstructed");
    }
    return self;
}
-(id)update:(float) deltaTime
{
    for(int i =0; i<[self.objList count]; i++)
    {
        [self.objList replaceObjectAtIndex:i withObject:[[self.objList objectAtIndex:i] update: deltaTime]];
    }
    return self;
}
-(void)draw
{
    for(int i =0; i<[self.objList count]; i++)
    {
        [[self.objList objectAtIndex:i] draw];
    }
}
-(void)setGameObjects:(NSMutableArray*) objList
{
    self.objList = objList;
}

-(void)handleInput:(CGPoint) tapPoint
{
    self.tapPoint = tapPoint;
    self.tapPending = true;
}
@end
