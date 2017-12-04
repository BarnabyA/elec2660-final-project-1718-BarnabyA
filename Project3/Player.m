//
//  Player.m
//  Project3
//
//  Created by Barnaby Ayriss [el16ba] on 24/11/2017.
//  Copyright © 2017 University of Leeds. All rights reserved.
//

#import "Player.h"

@interface Player()

@property CGPoint jumpStartCoord;

@end

@implementation Player

static const uint32_t bitMaskCategoryPlayer = 0x1 << 0;
static const uint32_t bitMaskCategoryGameObject = 0x1 << 1;

+(id)player
{
    Player *player = [Player spriteNodeWithColor:[UIColor orangeColor] size:CGSizeMake(50, 50)];

    player.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:player.size];
    player.physicsBody.dynamic = true;
    player.physicsBody.allowsRotation = false;
    
    player.physicsBody.categoryBitMask = bitMaskCategoryPlayer;
    player.physicsBody.contactTestBitMask = bitMaskCategoryGameObject;
    
    NSLog(@"%i", player.physicsBody.contactTestBitMask);
    
    return player;
}

-(void)moveXPositiveForever:(float)speed
{
    SKAction *moveXPositiveForever = [SKAction repeatActionForever:[SKAction moveBy:CGVectorMake(speed, 0) duration:0.01]];
    [self runAction:moveXPositiveForever withKey:@"moveXPositiveForever"];
}

-(void)jump
{
    SKAction *jump = [SKAction applyImpulse:CGVectorMake(0,120) duration: 0.5];
    if (self.cannotJump == false) {
        [self runAction:jump];
        self.cannotJump = true;
        NSLog(@"Player/jump- jump impulse of 120 applied");
    }
    
}






@end
