//
//  MyBugObject.m
//  Simple2D
//
//  Created by oleksiy martynov on 2/13/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyBugObject.h"
#import "MyGraphics.h"
#import "MyEventPair.h"
@interface MyBugObject()
@property (strong,nonatomic) NSMutableArray* workList;
@property (strong, nonatomic) MyVisualPhysicalObject* splat;
@end
@implementation MyBugObject
-(instancetype)initBug:(MyVector2*) position : (MyVector2*)velocity : (MyVector2*)size;
{
    self=[super initVisualAnimation:MyGraphics.effect :@"Bug1.png" : position : velocity : size : [[MyVector2 alloc]initWithData: 0:0] : [[MyVector2 alloc]initWithData: 0:0] : 100 : 5 ];
    if(self)
    {
        self.workList = [NSMutableArray array];
        [self addOntapEvent:@selector(makeSplat) :self];
    }
    return self;
}
-(void)addOntapEvent:(SEL) method : (id) caller
{
    MyEventPair * work = [[MyEventPair alloc] init ];
    work.method=method;
    work.caller=caller;
    [_workList addObject:work];
}
-(void)deleteOnTapEvent:(SEL)method : (id)caller
{
    
    for(MyEventPair * work in _workList)
    {
        if(work.method==method && work.caller==caller)
        {
            [_workList removeObject:work];
        }
    }
}
-(id)update:(float)deltaTime
{
    [super update:deltaTime];
    if(!self.splat)
    {
        return self;
    }
    else
    {
        return self.splat;
    }
}
-(void)makeSplat
{
    NSLog(@"bug tapped!!!");
    self.splat =[[MyVisualPhysicalObject alloc]initVisual: MyGraphics.effect : @"splat.png" :self.position :[MyVector2 zero] :[MyVector2 MyVector2WithData:(float)self.box.x*1.5f :(float)self.box.y*1.5f]: self.rotation : [MyVector2 zero]];
}
-(void)checkTap:(MyVector2*) point
{
    if([_workList count]>0)
    {
        CGRect thisRect = CGRectMake(self.position.x, self.position.y, self.box.x, self.box.y);
        
        CGRect otherRect=CGRectMake(point.x, point.y, 2, 2);
        if(CGRectIntersectsRect(thisRect, otherRect))
        {
            NSLog(@"tapped");
            for(MyEventPair * work in _workList)
            {
                if([work.caller respondsToSelector: work.method])
                {
                    [work.caller performSelector: work.method];
                }
                else
                {
                    NSLog(@"Caller doesnt respond to selector");
                }
            }
        }
    }
}
@end
