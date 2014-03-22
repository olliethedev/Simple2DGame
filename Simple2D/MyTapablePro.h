//
//  MyTapablePro.h
//  Simple2D
//
//  Created by oleksiy martynov on 1/26/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyTapablePro <NSObject>

-(void)addOntapEvent:(SEL) method : (id) caller;
-(void)deleteOnTapEvent:(SEL)method : (id)caller;
-(void)checkTap:(MyVector2*) point;
@end
