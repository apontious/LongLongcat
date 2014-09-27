//
//  GameScene.m
//  LongLongcat
//
//  Created by Andrew Pontious on 9/27/14.
//  Copyright (c) 2014 Andrew Pontious. All rights reserved.
//

#import "GameScene.h"

// Comment out one or the other of these to prevent crash. Leave both defined to cause crash.
#define CENTER_RECT_AND_SCALE
#define ALPHA

@implementation GameScene

-(void)didMoveToView:(SKView *)view {
    SKSpriteNode *longLongcatSprite = [[SKSpriteNode alloc] initWithImageNamed:@"LongLongcat"];
    
    longLongcatSprite.position = CGPointMake(self.size.width/2, self.size.height/2);
    
#ifdef CENTER_RECT_AND_SCALE
    // This code, combined with alpha call below, causes a crash on iOS 7 and iOS 8, Simulator and device. Comment it out, works fine everywhere.
    // *Without* the alpha call below, this works fine.

    const CGSize imageSize = {300, 300};
    // Taken from playing around in Asset Catalog slicing UI, though slicing must be off there now for this to work properly.
    const CGFloat leftBorder = 141;
    const CGFloat topBorder = 152;
    const CGFloat rightBorder = 132;
    const CGFloat bottomBorder = 144;
    
    longLongcatSprite.centerRect = CGRectMake(leftBorder / imageSize.width,
                                              topBorder / imageSize.height,
                                              (imageSize.width - leftBorder - rightBorder) / imageSize.width,
                                              (imageSize.height - topBorder - bottomBorder) / imageSize.height);
    
    longLongcatSprite.xScale = self.size.width / imageSize.width;
    longLongcatSprite.yScale = self.size.height / imageSize.height;
#endif
    
#ifdef ALPHA
    // This line, combined with centerRect and x/yScale calls above, causes a crash on iOS 7 and iOS 8, Simulator and device. Comment it out, works fine everywhere.
    // *Without* the calls above, this works fine.
    longLongcatSprite.alpha = 0.0;
#endif
    
    [self addChild:longLongcatSprite];
    
    [longLongcatSprite runAction:[SKAction fadeInWithDuration:10.0]];
}

@end
