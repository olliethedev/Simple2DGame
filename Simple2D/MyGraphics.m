//
//  MyGraphics.m
//  Simple2D
//
//  Created by admin user on 2/3/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyGraphics.h"

@implementation MyGraphics
static int width;
static int height;
static GLKBaseEffect* baseEffect;
+(GLKBaseEffect*) effect
{
    return baseEffect;
}
+(void)setEffect:(GLKBaseEffect*)effect
{
    baseEffect=effect;
}
+(int)width
{
    return width;
}
+(void)setWidth:(int)w
{
    width=w;
}
+(int)height
{
    return height;
}
+(void)setHeight:(int)h
{
    height=h;
}
@end
