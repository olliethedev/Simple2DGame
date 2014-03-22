//
//  MyGraphics.h
//  Simple2D
//
//  Created by admin user on 2/3/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
@interface MyGraphics : NSObject
+(GLKBaseEffect*) effect;
+(void)setEffect:(GLKBaseEffect*)effect;
+(int)width;
+(void)setWidth:(int)w;
+(int)height;
+(void)setHeight:(int)h;
@end
