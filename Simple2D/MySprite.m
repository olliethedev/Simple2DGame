//
//  MySprite.m
//  Simple2D
//
//  Created by oleksiy martynov on 1/11/14.
//  Copyright (c) 2014 oleksiy martynov. All rights reserved.
//

#import "MySprite.h"

@interface MySprite()



@end

@implementation MySprite
@synthesize effect = _effect;
@synthesize quad = _quad;
@synthesize textureInfo = _textureInfo;
@synthesize position = _position;
@synthesize contentSize = _contentSize;
@synthesize img=_img;

-(void)setImg:(UIImage*)img
{
    _img=img;
    NSDictionary * options = [NSDictionary dictionaryWithObjectsAndKeys:
                              [NSNumber numberWithBool:YES],
                              GLKTextureLoaderOriginBottomLeft,
                              nil];
    NSError * error;
    self.textureInfo=[GLKTextureLoader textureWithCGImage: self.img.CGImage options:options error:&error];
    if (self.textureInfo == nil)
    {
        NSLog(@"Error loading sprite: %@", [error localizedDescription]);
    }
    
    self.contentSize = CGSizeMake(self.textureInfo.width, self.textureInfo.height);
}
- (id)initWithFile:(NSString *)fileName :(GLKBaseEffect *)effect
{
    if ((self = [super init]))
    {
        self.effect = effect;
        

        self .img= [UIImage imageNamed:fileName];
        
        
        TexturedQuad newQuad;
        newQuad.bl.geometryVertex = CGPointMake(0, 0);
        newQuad.br.geometryVertex = CGPointMake(self.textureInfo.width, 0);
        newQuad.tl.geometryVertex = CGPointMake(0, self.textureInfo.height);
        newQuad.tr.geometryVertex = CGPointMake(self.textureInfo.width, self.textureInfo.height);
        
        newQuad.bl.textureVertex = CGPointMake(0, 0);
        newQuad.br.textureVertex = CGPointMake(1, 0);
        newQuad.tl.textureVertex = CGPointMake(0, 1);
        newQuad.tr.textureVertex = CGPointMake(1, 1);
        self.quad = newQuad;
        
    }
    return self;
}
-(void)loadNewSpriteFromFile:(NSString*) fileName
{
    self .img= [UIImage imageNamed:fileName];
}
- (GLKMatrix4) modelMatrix :(MyPhysicalObject*)obj
{
    
    GLKMatrix4 modelMatrix = GLKMatrix4Identity;
    modelMatrix = GLKMatrix4Translate(modelMatrix, obj.position.x, obj.position.y, 0);

    modelMatrix =GLKMatrix4Scale(modelMatrix, obj.box.x/self.textureInfo.width,obj.box.y/self.textureInfo.height ,1.0f);
    modelMatrix=GLKMatrix4RotateX(modelMatrix, obj.rotation.x);
    modelMatrix=GLKMatrix4RotateY(modelMatrix,obj.rotation.y);
    return modelMatrix;
    
}

- (void)draw:(MyPhysicalObject*) obj
{
 
    // 1
    self.effect.texture2d0.name = self.textureInfo.name;
    self.effect.texture2d0.enabled = YES;
    
    // 2
    self.effect.transform.modelviewMatrix = [self modelMatrix:obj];
    [self.effect prepareToDraw];
    
    // 3
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glEnableVertexAttribArray(GLKVertexAttribTexCoord0);
    
    // 4
    long offset = (long)&_quad;
    glVertexAttribPointer(GLKVertexAttribPosition, 2, GL_FLOAT, GL_FALSE, sizeof(TexturedVertex), (void *) (offset + offsetof(TexturedVertex, geometryVertex)));
    glVertexAttribPointer(GLKVertexAttribTexCoord0, 2, GL_FLOAT, GL_FALSE, sizeof(TexturedVertex), (void *) (offset + offsetof(TexturedVertex, textureVertex)));
    
    // 5
    glDrawArrays(GL_TRIANGLE_STRIP, 0, 4);
    
}
-(id)updateSprite:(float) deltaTime
{
    return self;
}
@end
