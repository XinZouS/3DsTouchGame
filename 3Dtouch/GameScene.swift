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
    

    func addRandomRows() {
        let randomNum = Int(arc4random_uniform(6))
        addRow(type: RowType(rawValue: randomNum)!) // select from enum {..}
    }
    
    override func didMove(to view: SKView) {
        
        self.physicsWorld.gravity = CGVector(dx: 0, dy: 0)
        self.physicsWorld.contactDelegate = self
                
        addPlayer()
        addRow(type: RowType.twoM)
    }

    // for updating Rows:
    var lastUpdataTimeInterval = TimeInterval()
    var lastYieldTimeInterval  = TimeInterval()
    
    func updateWithTimeSiceLastUpdate(_ timeSinceLastUpdate: CFTimeInterval) {
        lastYieldTimeInterval += timeSinceLastUpdate
        if lastYieldTimeInterval > 0.7 {
            lastYieldTimeInterval = 0
            addRandomRows()
        }
    }
    override func update(_ currentTime: TimeInterval) {
        var timeSinceLastUpdate = currentTime - lastUpdataTimeInterval
        lastUpdataTimeInterval = currentTime
        
        if timeSinceLastUpdate > 1 {
            timeSinceLastUpdate = 1/60
            lastUpdataTimeInterval = currentTime
        }
        
        updateWithTimeSiceLastUpdate(timeSinceLastUpdate)
    }
}



