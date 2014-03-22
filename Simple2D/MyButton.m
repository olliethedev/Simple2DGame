//
//  MyButton.m
//  Simple2D
//
//  Created by oleksiy martynov on 1/26/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyButton.h"
#import "MyEventPair.h"


@interface MyButton()

@property (nonatomic, strong) NSMutableArray * workList;
@end
@implementation MyButton


-(instancetype)initButton:(GLKBaseEffect *)effect :(NSString*)fileName : (MyVector2*)position : (MyVector2*)box
{
    self=[super initVisual:effect :fileName :position :[MyVector2 zero] :box :[MyVector2 zero] :[MyVector2 zero]];
    if(self)
    {
        _workList = [NSMutableArray array];
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
