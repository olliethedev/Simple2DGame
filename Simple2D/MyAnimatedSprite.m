//
//  MyAnimatedSprite.m
//  Simple2D
//
//  Created by oleksiy martynov on 1/18/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyAnimatedSprite.h"
@interface MyAnimatedSprite()
@property int spriteStepWidth;
@property int framesPerStep;
@property int frameCounter;
@end
@implementation MyAnimatedSprite
-(id)initAnimatedSprite:(NSString*)fileName : (GLKBaseEffect *)effect : (int)spriteStep :(int) framesPerStep;
{
    self=[super initWithFile:fileName :effect];
    if(self)
    {
        self.spriteStepWidth = spriteStep;
        self.framesPerStep = framesPerStep;
        self.contentSize = CGSizeMake(spriteStep, self.textureInfo.height);
        //set the first frame for animation
        int pixelOffset = self.spriteStepWidth*self.frameCounter/self.framesPerStep;
        TexturedQuad newQuad;
        newQuad.bl.geometryVertex = CGPointMake(0, 0);
        newQuad.br.geometryVertex = CGPointMake(self.textureInfo.width, 0);
        newQuad.tl.geometryVertex = CGPointMake(0, self.textureInfo.height);
        newQuad.tr.geometryVertex = CGPointMake(self.textureInfo.width, self.textureInfo.height);
        float left= (float)pixelOffset/(float)self.textureInfo.width;
        float right =(float)(pixelOffset+self.spriteStepWidth)/(float)self.textureInfo.width;
        newQuad.bl.textureVertex = CGPointMake(left, 0);
        newQuad.br.textureVertex = CGPointMake(right, 0);
        newQuad.tl.textureVertex = CGPointMake(left, 1);
        newQuad.tr.textureVertex = CGPointMake(right, 1);
        self.quad = newQuad;
    }   
    return self;
}
-(id)updateSprite:(float) deltaTime
{
    self.frameCounter++;
    int maxSpriteSteps = self.textureInfo.width/self.spriteStepWidth;
    
    if(self.frameCounter%self.framesPerStep ==0)
    {
        if(self.frameCounter/self.framesPerStep >=maxSpriteSteps)
        {
            self.frameCounter=0;
        }
        int pixelOffset = self.spriteStepWidth*self.frameCounter/self.framesPerStep;
        TexturedQuad newQuad;
        newQuad.bl.geometryVertex = CGPointMake(0, 0);
        newQuad.br.geometryVertex = CGPointMake(self.textureInfo.width, 0);
        newQuad.tl.geometryVertex = CGPointMake(0, self.textureInfo.height);
        newQuad.tr.geometryVertex = CGPointMake(self.textureInfo.width, self.textureInfo.height);
    
        float left= (float)pixelOffset/(float)self.textureInfo.width;
        float right =(float)(pixelOffset+self.spriteStepWidth)/(float)self.textureInfo.width;
        //NSLog(@"%f and %f",left,right);
        newQuad.bl.textureVertex = CGPointMake(left, 0);
        newQuad.br.textureVertex = CGPointMake(right, 0);
        newQuad.tl.textureVertex = CGPointMake(left, 1);
        newQuad.tr.textureVertex = CGPointMake(right, 1);
        self.quad = newQuad;
        //NSLog(@"frame step");
    }
    return self;
}
@end
