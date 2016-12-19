//
//  GameElements.swift
//  3Dtouch
//
//  Created by Xin Zou on 12/18/16.
//  Copyright © 2016 Xin Zou. All rights reserved.
//

import SpriteKit


struct CollectionBitmask {
    static let Player : UInt32 = 0x00
    static let Obstacle:UInt32 = 0x01
}

enum ObstacleType: Int {
    case Small = 0
    case Medium = 1
    case Large = 2
}

enum RowType: Int {
    case oneS = 0
    case oneM = 1
    case oneL = 2
    case twoS = 3
    case twoM = 4
    case threeS = 5
}

extension GameScene { // aka edit more code for class GameScene;
    
    func addPlayer() {
        player1 = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        player1.position = CGPoint(x: self.size.width / 2, y: self.size.height / 4)
        player1.name = "PLAYER1"
        player1.physicsBody = SKPhysicsBody(rectangleOf: player1.size)
        player1.physicsBody?.isDynamic = false
        
        player1.physicsBody?.categoryBitMask = CollectionBitmask.Player
        player1.physicsBody?.collisionBitMask = 0
        player1.physicsBody?.contactTestBitMask = CollectionBitmask.Obstacle
        

        player2 = SKSpriteNode(color: .red, size: CGSize(width: 50, height: 50))
        player2.position = CGPoint(x: self.size.width / 2, y: self.size.height / 4)
        player2.name = "PLAYER1"
        player2.physicsBody = SKPhysicsBody(rectangleOf: player2.size)
        player2.physicsBody?.isDynamic = false
        
        player2.physicsBody?.categoryBitMask = CollectionBitmask.Player
        player2.physicsBody?.collisionBitMask = 0
        player2.physicsBody?.contactTestBitMask = CollectionBitmask.Obstacle

        addChild(player1)
        addChild(player2)
        
        initialPlayerPosition = player1.position
    }
    
    
    func addObstacle(type:ObstacleType) -> SKSpriteNode {
        let obstacle = SKSpriteNode(color: .white, size: CGSize(width: 0, height: 30) )
        obstacle.name = "OBSTACLE"
        obstacle.physicsBody?.isDynamic = true
        
        switch type {
        case .Small:
            obstacle.size.width = self.size.width * 0.2
            break
        case .Medium:
            obstacle.size.width = self.size.width * 0.5
            break
        case .Large:
            obstacle.size.width = self.size.width * 0.75
            break
        }
        
        obstacle.position = CGPoint(x: 0, y: self.size.height + obstacle.size.height)
        obstacle.physicsBody = SKPhysicsBody(rectangleOf: obstacle.size)
        obstacle.physicsBody?.categoryBitMask = CollectionBitmask.Obstacle
        obstacle.physicsBody?.collisionBitMask = 0
        
        return obstacle
    }
    
    func addMovement(obstacle:SKSpriteNode) {
        var actionArray = [SKAction]()
        actionArray.append(SKAction.move(to: CGPoint(x: obstacle.position.x, y: -obstacle.size.height), duration: 3))
        actionArray.append(SKAction.removeFromParent())
        
        obstacle.run(SKAction.sequence(actionArray))
    }
    
    func addRow(type:RowType) {
        switch type {
        case .oneS:
            let obst = addObstacle(type: .Small)
            obst.position = CGPoint(x: self.size.width / 2, y: obst.position.y)
            addMovement(obstacle: obst)
            addChild(obst)
            break
        case .oneM:
            break
        case .oneL:
            break
        case .twoS:
            break
        case .twoM:
            break
        case .threeS:
            break
        }
        
    }
    
}
