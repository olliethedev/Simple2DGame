//
//  MyAppleObject.m
//  Simple2D
//
//  Created by admin user on 1/31/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import "MyAppleObject.h"
#import "MyGraphics.h"
#import <GLKit/GLKit.h>
#import "MyTextPrinter.h"
@interface MyAppleObject()
@property int alphaCount;
@property MyTextPrinter* textPrinter;
@end
@implementation MyAppleObject
-(instancetype)initApple:  (int)xPos :(int)yPos : (int )width : (int) height
{
    self=[super initCollidable: MyGraphics.effect :@"Apple.png" :[MyVector2 MyVector2WithData:xPos :yPos] :[MyVector2 zero] :[MyVector2 MyVector2WithData:width :height] :[MyVector2 zero] :[MyVector2 zero]   ];
    self.alphaCount=0;
    self.textPrinter =[[MyTextPrinter alloc]initTextPrinter:[MyVector2 MyVector2WithData:xPos:yPos] :20 :@"0%"];
    return  self;
}
-(BOOL)collisionCheck: (MyColVisPhysObject *) otherObj
{
    if(self!=otherObj)
    {
        CGRect thisRect = CGRectMake(self.position.x, self.position.y, self.box.x, self.box.y);
        CGRect otherRect=CGRectMake(otherObj.position.x, otherObj.position.y, otherObj.box.x, otherObj.box.y);
        CGRect interRect =CGRectIntersection(thisRect, otherRect);
        if(!CGRectIsNull(interRect))
        {
            self.sprite.img=[self changePixels:interRect :self.sprite.img.CGImage];
            return false;
        }
    }
    return false;
}
-(BOOL)collisionConfirm: (MyColVisPhysObject *) otherObject
{
    return false;
}
-(void)draw
{
    [self.textPrinter draw];
    [super draw];
}
-(instancetype)update:(float)deltaTime
{
    [self.textPrinter update:deltaTime];
    [super update:deltaTime];
    return self;
}
-(UIImage*)changePixels:(CGRect)rectangle : (CGImageRef)img
{
    
    CFDataRef dataRef = CGDataProviderCopyData(CGImageGetDataProvider(img));
    UInt8 * pixels = (UInt8 *) CFDataGetBytePtr(dataRef);
    int width =CGImageGetWidth(img);
    int height =CGImageGetHeight(img);
    int size = width*height;
    //todo: finish the logic here
    int offsetX=(rectangle.origin.x-self.position.x);
    int offsetY=(rectangle.origin.y-self.position.y);
        for(int x =0; x<rectangle.size.width; x++)
        {
            for(int y=0; y<rectangle.size.height; y++)
            {
                int pos =(((self.box.y-(y+offsetY))*width*4)+((x+offsetX)*4));
                if(pixels[pos+3]==0)
                {
                    self.alphaCount++;
                }
                pixels[pos+3]=0;
            }
        }
    
    
    CGContextRef ctx = CGBitmapContextCreate(pixels,
                                             width,
                                             height,
                                             CGImageGetBitsPerComponent(img),
                                             CGImageGetBytesPerRow(img),
                                             CGImageGetColorSpace(img),
                                             CGImageGetBitmapInfo(img)
                                             );
    
    CGImageRef imageRef = CGBitmapContextCreateImage(ctx);
    CGContextRelease(ctx);
    int health=((float)self.alphaCount/(float)(size*4))*100.0f;
    self.textPrinter.text=[NSString stringWithFormat:@"%d%%",health];
    NSLog(@"health:%d",health);
    return [UIImage imageWithData:UIImagePNGRepresentation([UIImage imageWithCGImage:imageRef])];
 
}
@end
