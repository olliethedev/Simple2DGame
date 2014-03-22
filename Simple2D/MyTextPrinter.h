//
//  MyTextPrinter.h
//  Simple2D
//
//  Created by oleksiy martynov on 2/3/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MyDrawPro.h"
#import "MyUpdatePro.h"
#import "MyVector2.h"
@interface MyTextPrinter : NSObject <MyDrawPro,MyUpdatePro>
-(instancetype)initTextPrinter:(MyVector2*)position : (int)charSize : (NSString*)stringToPrint;
-(void)draw;
-(void)finish;
-(instancetype)update:(float)deltaTime;
@property(strong,nonatomic) NSString* text;
@property MyVector2* position;
@property int diagSize;
@end
