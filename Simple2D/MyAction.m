//
//  MyAction.m
//  Simple2D
//
//  Created by oleksiy martynov on 1/24/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyAction.h"

@interface MyAction()

@property int framesPerIncrement;
@property MyVector2* currentValue;
@property MyVector2* desiredValue;
@property MyVector2* increment;
@end
@implementation MyAction
-(instancetype)initAction:(MyVector2*)start : (int)framesPerIncrement : (MyVector2*)end
{
    self=[super init];
    if(self)
    {
        _currentValue=start;
        _framesPerIncrement=framesPerIncrement;
        _desiredValue=end;
        _increment = [MyVector2 zero];
        //todo investigate double rotation bug
        if(end.x<=start.x)
        {
        //_increment= [[MyVector2 alloc]initWithData: (end.x-start.x)/(float)framesPerIncrement : (end.y-start.y)/(float)framesPerIncrement];
            _increment.x=(end.x-start.x)/(float)framesPerIncrement;
            NSLog(@"one");
        
        }
        else
        {
            _increment.x=(end.x-start.x)/(float)framesPerIncrement*-1;
            _desiredValue.x*=-1;
            NSLog(@"two");
        }
        if(end.y<=start.y)
        {
            //_increment= [[MyVector2 alloc]initWithData: (end.x-start.x)/(float)framesPerIncrement : (end.y-start.y)/(float)framesPerIncrement];
            _increment.y=(end.y-start.y)/(float)framesPerIncrement;
            NSLog(@"three");
            
        }
        else
        {
            _increment.y=(end.y-start.y)/(float)framesPerIncrement*-1;
            _desiredValue.y*=-1;
            NSLog(@"four");
        }
        NSLog(@"increment %f, %f",_increment.x,_increment.y);
        
        //_increment.x*=end.x>start.x?1:-1;
        //_increment.y*=end.y>start.y?1:-1;
    }
    return self;
}

-(id)update:(float) deltaTime
{
    
    if(_currentValue.x>_desiredValue.x)
    {
        _currentValue.x+=_increment.x;
    }
    if(_currentValue.y>_desiredValue.y)
    {
        _currentValue.y+=_increment.y;
    }
    if (_currentValue.x<=_desiredValue.x&&_currentValue.y<=_desiredValue.y)
    {
        NSLog(@"done %f < %f and %f < %f",_currentValue.x,_desiredValue.x,_currentValue.y,_desiredValue.y);
        NSLog(@"done %d and %d",_currentValue.x<_desiredValue.x,_currentValue.y<_desiredValue.y);
        NSLog(@"action done");
        return nil;
    }
    
    return self;
}
-(void)draw
{
    //todo
}
@end
