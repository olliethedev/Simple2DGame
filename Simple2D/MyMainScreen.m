//
//  MyMainScreen.m
//  Simple2D
//
//  Created by oleksiy martynov on 1/15/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyMainScreen.h"
#import "MyColVisPhysObject.h"
#import "MyGameScreen.h"
#import "MyAction.h"
#import "MyButton.h"
#import "MyGraphics.h"
#import "MyTextPrinter.h"
#import "MyLevel.h"
@interface MyMainScreen()
@property(strong) MyVector2* testVec;
@property(strong) id nextScreen;
@end
@implementation MyMainScreen
//@synthesize effect=_effect;

-(id)initMainScreen
{
    self=[super init];
    //test
    NSLog(@"width %d and hight %d ",MyGraphics.width,MyGraphics.height);
    if (self)
    {
        self.effect=MyGraphics.effect;
        int width = MyGraphics.width;
        int height =MyGraphics.height;
        self.nextScreen=self;

        self.objList = [NSMutableArray array];
        MyColVisPhysObject * mainScreen = [[MyColVisPhysObject alloc]initVisual: self.effect : @"bgPlain.png" :[[MyVector2 alloc]initWithData: 0:0]:[[MyVector2 alloc]initWithData: 0:0] :[[MyVector2 alloc]initWithData: width:height]:
        [[MyVector2 alloc]initWithData: 3.14f:0] : [[MyVector2 alloc]initWithData: 0:0]];

        MyAction *screenRotation = [[MyAction alloc]initAction: mainScreen.rotation :60:  [[MyVector2 alloc]initWithData:0 :0]];
        
        MyButton * startBtn= [[MyButton alloc]initButton:self.effect :@"playBtn.png" :[[MyVector2 alloc]initWithData:width*2 :height/2] :[[MyVector2 alloc]initWithData:170 :65]];
        
        [startBtn addOntapEvent:@selector(onTap) :self];
        
        MyAction *startBtnTranslation = [[MyAction alloc]initAction: startBtn.position :85:  [[MyVector2 alloc]initWithData:width-170: height/2]];
        
        MyTextPrinter* textPrinter =[[MyTextPrinter alloc]initTextPrinter:[MyVector2 MyVector2WithData:10 :1] :20 :@"Top score: ???"];
       
        [self.objList addObject:mainScreen];
        [self.objList addObject:screenRotation];
        [self.objList addObject:startBtn];
        [self.objList addObject:startBtnTranslation];
         [self.objList addObject:textPrinter];
        NSLog(@"MainScreenConstructed");
        
    }
    return self;
}
-(void)onTap
{
    self.nextScreen=[[MyGameScreen alloc]initGameScreen: self.effect];
    //todo check for saved game
    self.nextScreen=[[MyLevel alloc]initLevel:1];
}
-(id)update:(float) deltaTime
{
    NSMutableArray*  deleteList = [NSMutableArray array];
    for(id obj in self.objList)
    {
        if([obj respondsToSelector:@selector(checkTap:)])
        {
            [obj checkTap:[[MyVector2 alloc]initWithData:self.tapPoint.x:self.tapPoint.y]];
        }
            if(![obj update: deltaTime])
        {
            [deleteList addObject:obj];
        }
    }

    [self.objList removeObjectsInArray:deleteList];

    return _nextScreen;
}


@end;
