//
//  MyCharSprite.h
//  Simple2D
//
//  Created by admin user on 2/3/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MySprite.h"

@interface MyCharSprite : MySprite
-(instancetype)initCharSprite:(char)ch  : (int)chWidthAndHeight;
-(instancetype)initCharSpriteWithFile:(NSString*) fileName : (char) ch : (int)chWidthAndHeight;

@end
