//
//  MyCharSprite.m
//  Simple2D
//
//  Created by admin user on 2/3/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyCharSprite.h"
#import "MyGraphics.h"
#import "MyVector2.h"

@interface MyCharSprite()
@property int chPerRow;
@property int chWidthAndHeight;
@end
@implementation MyCharSprite
-(instancetype)initCharSprite : (char) ch : (int)chWidthAndHeight
{
    self=[super initWithFile:@"longSpriteFont.png" :MyGraphics.effect];
    if(self)
    {
        self.chPerRow=self.textureInfo.width/chWidthAndHeight;
        self.chWidthAndHeight=chWidthAndHeight;
        [self setCharSprite:ch];
    }
    return self;
}
-(void)setCharSprite : (char) ch
{
    int start=32;
    int rowCount=self.chPerRow;//16;
    int end =94;
    int chInt =(int)ch;
    int chSpriteWidth=self.chWidthAndHeight;
    int chSpriteHeight=self.chWidthAndHeight;
    MyVector2* offset=[MyVector2 zero];
    if(chInt>=97 && chInt<=122)
    {
        chInt-=32;
    }
    if(chInt>=start && chInt<=end)
    {
        int mod=(chInt-start)%rowCount;
        int y=(((chInt-start)/rowCount)*chSpriteHeight);
        int x=mod==0?0:mod*chSpriteWidth;
        offset =[[MyVector2 alloc]initWithData:x :y];
    }
    else
    {
        NSLog(@"Unsupported Character");
        offset =[[MyVector2 alloc]initWithData:0 :0];
    }
    TexturedQuad newQuad;
    newQuad.bl.geometryVertex = CGPointMake(0, 0);
    newQuad.br.geometryVertex = CGPointMake(self.textureInfo.width, 0);
    newQuad.tl.geometryVertex = CGPointMake(0, self.textureInfo.height);
    newQuad.tr.geometryVertex = CGPointMake(self.textureInfo.width, self.textureInfo.height);
   if(chInt%2)
   {
        newQuad.tl.textureVertex = CGPointMake(offset.x/(float)self.textureInfo.width,
                                               offset.y/(float)self.textureInfo.height);
        newQuad.tr.textureVertex = CGPointMake((offset.x+chSpriteWidth)/(float)self.textureInfo.width,
                                               offset.y/(float)self.textureInfo.height);
        newQuad.bl.textureVertex = CGPointMake(offset.x/(float)self.textureInfo.width,
                                               (offset.y+chSpriteHeight)/(float)self.textureInfo.height);
        newQuad.br.textureVertex = CGPointMake((offset.x+chSpriteWidth)/(float)self.textureInfo.width,
                                               (offset.y+chSpriteHeight)/(float)self.textureInfo.height);
   }
    else
    {
        offset.y=self.textureInfo.height-chSpriteHeight-offset.y;
        newQuad.bl.textureVertex = CGPointMake(offset.x/(float)self.textureInfo.width,
                                               offset.y/(float)self.textureInfo.height);
        newQuad.br.textureVertex = CGPointMake((offset.x+chSpriteWidth)/(float)self.textureInfo.width,
                                               offset.y/(float)self.textureInfo.height);
        newQuad.tl.textureVertex = CGPointMake(offset.x/(float)self.textureInfo.width,
                                               (offset.y+chSpriteHeight)/(float)self.textureInfo.height);
        newQuad.tr.textureVertex = CGPointMake((offset.x+chSpriteWidth)/(float)self.textureInfo.width,
                                               (offset.y+chSpriteHeight)/(float)self.textureInfo.height);
    }
    self.quad = newQuad;
}
-(instancetype)initCharSpriteWithFile:(NSString*) fileName :(char) ch : (int)chWidthAndHeight
{
    self=[super initWithFile:fileName :MyGraphics.effect];
    if(self)
    {
        self.chPerRow=self.textureInfo.width/chWidthAndHeight;
        self.chWidthAndHeight=chWidthAndHeight;
        [self setCharSprite:ch];
    }
    return self;
}
@end
