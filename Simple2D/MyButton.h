//
//  MyButton.h
//  Simple2D
//
//  Created by oleksiy martynov on 1/26/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyVisualPhysicalObject.h"
#import "MyTapablePro.h"
#import "MyOnTapPro.h"
@interface MyButton : MyVisualPhysicalObject <MyTapablePro>
-(instancetype)initButton:(GLKBaseEffect *)effect :(NSString*)fileName : (MyVector2*)position : (MyVector2*)box;

-(void)addOntapEvent:(SEL) method : (id) caller;
-(void)deleteOnTapEvent:(SEL)method : (id)caller;
-(void)checkTap:(MyVector2*) point;
@end
