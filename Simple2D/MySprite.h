//
//  MySprite.h
//  Simple2D
//
//  Created by oleksiy martynov on 1/11/14.
//  Copyright (c) 2014 oleksiy martynov. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GLKit/GLKit.h>
#import "MyPhysicalObject.h"
typedef struct {
    CGPoint geometryVertex;
    CGPoint textureVertex;
} TexturedVertex;

typedef struct {
    TexturedVertex bl;
    TexturedVertex br;
    TexturedVertex tl;
    TexturedVertex tr;
} TexturedQuad;
@interface MySprite : NSObject
- (id)initWithFile:(NSString *)fileName :(GLKBaseEffect *)effect;
- (void)draw:(MyPhysicalObject*) obj;
-(id)updateSprite:(float) deltaTime;
-(void)loadNewSpriteFromFile:(NSString*) fileName;
@property (strong,nonatomic ) MyVector2* position;
@property (assign) CGSize contentSize;
@property (strong,nonatomic ) GLKBaseEffect * effect;
@property (assign) TexturedQuad quad;
@property (strong,nonatomic ) GLKTextureInfo * textureInfo;
@property (strong,nonatomic ) UIImage* img;
@end
