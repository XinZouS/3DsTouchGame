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
    

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let maximumPossibleForce = touch.maximumPossibleForce / 4
            let force = touch.force * 1.5
            let normalizedForce = force / maximumPossibleForce
            
            let midd = self.size.width / 2
            player1.position.x = midd - normalizedForce * (midd - 25)
            player2.position.x = midd + normalizedForce * (midd - 25)
        }
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        resetPlayersPosition()
    }
    func resetPlayersPosition() {
        player1.position = initialPlayerPosition
        player2.position = initialPlayerPosition
    }
    
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
    
    func didBegin(_ contact: SKPhysicsContact) {
        if contact.bodyA.node?.name == "PLAYER" {
            showGameOver()
        }
    }
    func showGameOver() {
        let transition = SKTransition.crossFade(withDuration: 0.5)
        let gameOverScene = GameOverScene(size: self.size)
        
        self.view?.presentScene(gameOverScene, transition: transition)
    }
}



