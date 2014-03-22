//
//  MyLevel.h
//  Simple2D
//
//  Created by ituser on 2/13/2014.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyGameScreen.h"

@interface MyLevel : MyGameScreen
-(instancetype)initLevel : (int) levelCount;
-(instancetype)update:(float)deltaTime;
-(void)draw;
@end
