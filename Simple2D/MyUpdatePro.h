//
//  MyUpdatePro.h
//  Simple2D
//
//  Created by oleksiy martynov on 1/24/14.
//  Copyright (c) 2014 bob smith. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MyUpdatePro <NSObject>
-(id)update:(float) deltaTime;
@end
