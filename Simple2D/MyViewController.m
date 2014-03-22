//
//  MyViewController.m
//  Simple2D
//
//  Created by oleksiy martynov on 1/11/14.
//  Copyright (c) 2014 oleksiy martynov. All rights reserved.
//

#import "MyViewController.h"
#import "MySprite.h"
#import "MyVisualPhysicalObject.h"
#import "MyColVisPhysObject.h"
#import "MyScreen.h"
#import "MyMainScreen.h"
#import "MyGameScreen.h"
#import "MyGraphics.h"

@interface MyViewController ()
@property (strong, nonatomic) EAGLContext *context;
@property (strong) GLKBaseEffect * effect;
@property (strong) NSMutableArray * gameObjects;
@property (assign) CGPoint touchLocation;
@property (assign) BOOL tapHandled;

@property (strong) MyScreen* currentScreen;

@end

@implementation MyViewController
@synthesize context = _context;
@synthesize gameObjects=_gameObjects;
@synthesize touchLocation=_touchLocation;
@synthesize tapHandled=_tapHandled;

@synthesize currentScreen = _currentScreen;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    
    if (!self.context) {
        NSLog(@"Failed to create ES context");
    }
    
    GLKView *view = (GLKView *)self.view;
    view.context = self.context;
    [EAGLContext setCurrentContext:self.context];
    self.effect = [[GLKBaseEffect alloc] init];
    MyGraphics.effect=self.effect;
    //because of landscape mode
    MyGraphics.width=self.view.bounds.size.height;
    MyGraphics.height=self.view.bounds.size.width;
    NSLog(@"MyGraphics size : %d %d",MyGraphics.width,MyGraphics.height);
    GLKMatrix4 projectionMatrix = GLKMatrix4MakeOrtho(0, MyGraphics.width, 0, MyGraphics.height, -1024, 1024);
    self.effect.transform.projectionMatrix = projectionMatrix;
    self.currentScreen = [[MyMainScreen alloc] initMainScreen];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch began");
    NSArray *touchesArray = [touches allObjects];

    for(UITouch* t in touchesArray)
    {
        CGPoint p = [t locationInView:nil];
        NSLog(@"touch %p x:%f y:%f",&p,MyGraphics.width-p.y, MyGraphics.height-p.x);//x and y are flipped because of landscape mode
        self.touchLocation = CGPointMake(MyGraphics.width-p.y, MyGraphics.height-p.x);
        [self.currentScreen handleInput:self.touchLocation];
    }
    
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch moved");
    NSArray *touchesArray = [touches allObjects];
    
    for(UITouch* t in touchesArray)
    {
        CGPoint p = [t locationInView:nil];
        NSLog(@"touch %p x:%f y:%f",&p,MyGraphics.width-p.y, MyGraphics.height-p.x);//x and y are flipped because of landscape mode
        self.touchLocation = CGPointMake(MyGraphics.width-p.y,MyGraphics.height-p.x);
        [self.currentScreen handleInput:self.touchLocation];
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touch ended");
    NSArray *touchesArray = [touches allObjects];
    
    for(UITouch* t in touchesArray)
    {
        CGPoint p = [t locationInView:nil];
        NSLog(@"touch %p x:%f y:%f",&p,MyGraphics.width-p.y, MyGraphics.height-p.x);//x and y are flipped because of landscape mode
        self.touchLocation = CGPointMake(-1,-1);//offscreen
        [self.currentScreen handleInput:self.touchLocation];
    }
}
#pragma mark - GLKViewDelegate

- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect {
    glClearColor(1, 1, 1, 1);
    glClear(GL_COLOR_BUFFER_BIT);
    glBlendFunc(GL_SRC_ALPHA, GL_ONE_MINUS_SRC_ALPHA);
    glEnable(GL_BLEND);
    
    [self.currentScreen draw];
}
- (void)handleTapFrom:(UITapGestureRecognizer *)recognizer
{
    self.touchLocation = [recognizer locationInView:recognizer.view];
    self.touchLocation = CGPointMake(self.touchLocation.x, 320 - self.touchLocation.y);
    self.tapHandled = false;
    [self.currentScreen handleInput:self.touchLocation];
    NSLog(@"taped");
}
- (void)update
{

    self.currentScreen = [self.currentScreen update:self.timeSinceLastUpdate];
    if(!self.currentScreen)
    {
        exit(0);
    }
    
}
@end
