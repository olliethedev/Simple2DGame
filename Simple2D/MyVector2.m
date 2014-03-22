//
//  MyVector2.m
//  Simple2D
//
//  Created by oleksiy martynov on 1/24/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyVector2.h"

@implementation MyVector2
@synthesize x=_x;
@synthesize y=_y;
-(id)init
{
    self=[super init];
    if(self)
    {
        _x=0;
        _y=0;
    }
    return self;
}
-(id)initWithData:(float)x : (float) y
{
    self=[super init];
    if(self)
    {
        _x=x;
        _y=y;
    }
    return self;
}
+(MyVector2*)MyVector2WithData:(float)x : (float) y
{
    return [[MyVector2 alloc]initWithData: x:y];
}
+(void)assign:(MyVector2*)value to: (MyVector2*)mainVec
{
    mainVec.x=value.x;
    mainVec.y=value.y;
}
+(MyVector2*)multiplyScalar:(MyVector2*)vec : (float) value
{
    MyVector2* result = [[MyVector2 alloc]initWithData:vec.x :vec.y];
    result.x*=value;
    result.y*=value;
    return result;
}
+(MyVector2*)divideScalar:(MyVector2 *) vec : (float)value
{
    MyVector2* result = [[MyVector2 alloc]initWithData:vec.x :vec.y];
    result.x/=value;
    result.y/=value;
    return result;
}
+(MyVector2*)addScalar:(MyVector2 *)vec :(float)value
{
    MyVector2* result = [[MyVector2 alloc]initWithData:vec.x :vec.y];
    result.x+=value;
    result.y+=value;
    return result;
}
+(MyVector2*)subtractScalar:(MyVector2*)vec :(float)value
{
    MyVector2* result = [[MyVector2 alloc]initWithData:vec.x :vec.y];
    result.x-=value;
    result.y-=value;
    return result;
}
+(MyVector2*)multiply:(MyVector2*)vec : (MyVector2*)vec2
{
    MyVector2* result = [[MyVector2 alloc]init];
    result.x=vec.x*vec2.x;
    result.y=vec.y*vec2.y;
    return result;
}
+(MyVector2*)divide:(MyVector2 *) vec : (MyVector2*)vec2
{
    MyVector2* result = [[MyVector2 alloc]init];
    result.x=vec.x/vec2.x;
    result.y=vec.y/vec2.y;
    return result;
}
+(MyVector2*)add:(MyVector2 *)vec : (MyVector2*)vec2
{
    MyVector2* result = [[MyVector2 alloc]init];
    result.x=vec.x+vec2.x;
    result.y=vec.y+vec2.y;
    return result;
}
+(MyVector2*)subtract:(MyVector2*)vec : (MyVector2*)vec2
{
    MyVector2* result = [[MyVector2 alloc]init];
    result.x=vec.x-vec2.x;
    result.y=vec.y-vec2.y;
    return result;
}
+(MyVector2*)zero
{
    return [[MyVector2 alloc]initWithData:0 :0];
}
@end
