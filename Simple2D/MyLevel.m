//
//  MyLevel.m
//  Simple2D
//
//  Created by ituser on 2/13/2014.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyLevel.h"
#import "MyGraphics.h"
#import "MyColVisPhysObject.h"
#import "MyAppleObject.h"
#import "MyTextPrinter.h"
#import "MyVector2.h"
#import "MyBugObject.h"
@interface MyLevel()
@property int level;
@property MyTextPrinter* textprinter;
@property int bugCount;
@property int bugCurrent;
@end
@implementation MyLevel
-(instancetype)initLevel : (int) levelCount
{
    self=[super initGameScreen:MyGraphics.effect];
    if(self)
    {
        self.level=levelCount;
        MyVisualPhysicalObject* bg = [[MyVisualPhysicalObject alloc]initVisual:MyGraphics.effect :@"grass.png" :[MyVector2 zero] : [MyVector2 zero] :[MyVector2 MyVector2WithData:MyGraphics.width :MyGraphics.height] :[MyVector2 zero] :[MyVector2 zero] ];
        [self.objList addObject:bg];
        MyAppleObject* appleObj = [[MyAppleObject alloc]initApple:MyGraphics.width/2-180/2 :MyGraphics.height/2-180/2 :180 :180];
        [self.objList addObject:appleObj];
        self.bugCount=0;
        [self genBugs:levelCount];
        NSString* levelStr = [NSString stringWithFormat:@"Level %d",levelCount];
        
        self.textprinter=[[MyTextPrinter alloc]initTextPrinter:[MyVector2 MyVector2WithData:0 :0] :20 :levelStr];
        
        //[self.objList addObject:self.textprinter];
        NSLog(@"Level %d Created",levelCount);
    }
    return self;
}
-(void) genBugs: (int) level
{
    for (int i =0; i<level; i++)
    {
        self.bugCount++;
        [NSTimer scheduledTimerWithTimeInterval:i target:self selector:@selector(putBug) userInfo:Nil repeats:NO];
        NSLog(@"bug placed");
    }
}
-(void)putBug
{
    int rX=arc4random_uniform(MyGraphics.width);
    int rY=arc4random_uniform(MyGraphics.height);
    MyVector2* pos = [MyVector2 MyVector2WithData:rX :rY];
    int rVx=arc4random_uniform(10)+50;
    int rVy=arc4random_uniform(10)+50;
    MyVector2* vel = [MyVector2 MyVector2WithData:rVx :rVy];
    
    MyBugObject* bug = [[MyBugObject alloc]initBug:pos :vel :[MyVector2 MyVector2WithData:50 :50]];
    [bug addOntapEvent:@selector(bugOnClick) :self];
    [self.objList addObject:bug];
}
-(void)bugOnClick
{
    self.bugCurrent++;
}
-(void)draw
{
    [super draw];
    [self.textprinter draw];
}
-(instancetype)update:(float)deltaTime
{
    [super update:deltaTime];
    [self.textprinter update:deltaTime];
    if(self.bugCount==self.bugCurrent)
    {
        return [[MyLevel alloc]initLevel:++self.level];
    }
    else
    {
        return self;
    }
}

@end
