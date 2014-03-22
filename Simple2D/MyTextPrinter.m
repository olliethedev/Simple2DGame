//
//  MyTextPrinter.m
//  Simple2D
//
//  Created by oleksiy martynov on 2/3/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyTextPrinter.h"
#import "MyCharSprite.h"
#import "MyVisualPhysicalObject.h"
#import "MyGraphics.h"

@interface MyTextPrinter()
@property NSMutableArray* array;
@property BOOL done;
@end

@implementation MyTextPrinter
@synthesize array;
@synthesize text=_text;
@synthesize done;
-(void)setText:(NSString*)str
{
    self.array=[NSMutableArray array];
    for(int i =0; i<[str length]; i++)
    {
        [array addObject:[[MyVisualPhysicalObject alloc] initVisualChar:[MyVector2 MyVector2WithData:self.position.x+(self.diagSize*i) :self.position.y] :[MyVector2 MyVector2WithData:self.diagSize :self.diagSize]:[str characterAtIndex:i]]];
    }
    _text=str;
}
-(instancetype)initTextPrinter:(MyVector2*)position : (int)charSize : (NSString*)stringToPrint
{
    self=[super init];
    if(self)
    {
        self.done=false;
        self.position=position;
        self.diagSize=charSize;
        self.text=stringToPrint;
        
    }
    return self;
}
-(void)finish
{
    self.done=true;
}
-(void)draw
{
    for(MyVisualPhysicalObject* charObj in array)
    {
        [charObj draw];
    }
}
-(instancetype)update:(float)deltaTime
{
    for(MyVisualPhysicalObject* charObj in array)
    {
        [charObj update:deltaTime];
    }
    return done?nil:self;
}
@end
