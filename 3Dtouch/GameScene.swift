//
//  GameScene.swift
//  3Dtouch
//
//  Created by Xin Zou on 12/18/16.
//  Copyright © 2016 Xin Zou. All rights reserved.
//


import GameplayKit
import SpriteKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player1 = SKSpriteNode()
    var player2 = SKSpriteNode()
    
    var initialPlayerPosition : CGPoint!
    
    
    
    override func didMove(to view: SKView) {
        
        print("game should begin: didMove()")
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
                
        print("should adding players: ")
        addPlayer()
        addRow(type: RowType.oneS)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
}



