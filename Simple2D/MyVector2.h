//
//  MyVector2.h
//  Simple2D
//
//  Created by oleksiy martynov on 1/24/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyVector2 : NSObject
@property float x;
@property float y;
-(id)init;
-(id)initWithData:(float)x : (float) y;
+(MyVector2*)MyVector2WithData:(float)x : (float) y;
+(MyVector2*)multiplyScalar:(MyVector2*)vec : (float) value;
+(MyVector2*)divideScalar:(MyVector2 *) vec : (float)value;
+(MyVector2*)addScalar:(MyVector2 *)vec :(float)value;
+(MyVector2*)subtractScalar:(MyVector2*)vec :(float)value;

+(MyVector2*)multiply:(MyVector2*)vec : (MyVector2*)vec2;
+(MyVector2*)divide:(MyVector2 *) vec : (MyVector2*)vec2;
+(MyVector2*)add:(MyVector2 *)vec : (MyVector2*)vec2;
+(MyVector2*)subtract:(MyVector2*)vec : (MyVector2*)vec2;

+(void)assign:(MyVector2*)value to: (MyVector2*)mainVec;
+(MyVector2*)zero;
@end
