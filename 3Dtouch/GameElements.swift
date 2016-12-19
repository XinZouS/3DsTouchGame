//
//  GameElements.swift
//  3Dtouch
//
//  Created by Xin Zou on 12/18/16.
//  Copyright © 2016 Xin Zou. All rights reserved.
//

import SpriteKit
import GameplayKit


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
        player1 = SKSpriteNode(color: .cyan, size: CGSize(width: 50, height: 50))
        player1.position = CGPoint(x: self.frame.size.width / 2, y: 300)
        player1.name = "PLAYER1"
        player1.physicsBody = SKPhysicsBody(rectangleOf: player1.size)
        player1.physicsBody?.isDynamic = false
        
        player1.physicsBody?.categoryBitMask = CollectionBitmask.Player
        player1.physicsBody?.collisionBitMask = 0
        player1.physicsBody?.contactTestBitMask = CollectionBitmask.Obstacle
        

        player2 = SKSpriteNode(color: .cyan, size: CGSize(width: 50, height: 50))
        player2.position = CGPoint(x: self.frame.size.width / 2, y: 300)
        player2.name = "PLAYER2"
        player2.physicsBody = SKPhysicsBody(rectangleOf: player2.size)
        player2.physicsBody?.isDynamic = false
        
        player2.physicsBody?.categoryBitMask = CollectionBitmask.Player
        player2.physicsBody?.collisionBitMask = 0
        player2.physicsBody?.contactTestBitMask = CollectionBitmask.Obstacle

        addChild(player1)
        addChild(player2)
        
        print(player1.position)
        print(player2.position)
        
        initialPlayerPosition = player1.position
    }
    
    
    func addObstacle(type:ObstacleType) -> SKSpriteNode {
        var obstacle = SKSpriteNode(color: .white, size: CGSize(width: 10, height: 30) )
        obstacle.name = "OBSTACLE"
        obstacle.physicsBody?.isDynamic = true
        
        switch type {
        case .Small:
            obstacle.size.width = self.size.width * 0.25
            break
        case .Medium:
            obstacle.size.width = self.size.width * 0.275
            break
        case .Large:
            obstacle.size.width = self.size.width * 0.6
            break
        }
        
        obstacle.position = CGPoint(x: 0, y: self.frame.height + obstacle.size.height)
        obstacle.physicsBody = SKPhysicsBody(rectangleOf: obstacle.size)
        obstacle.physicsBody?.categoryBitMask = CollectionBitmask.Obstacle
        obstacle.physicsBody?.collisionBitMask = 0
        
        return obstacle
    }
    
    func addMovement(obstacle : inout SKSpriteNode) {
        var actionArray = [SKAction]()
        actionArray.append(SKAction.move(to: CGPoint(x: obstacle.position.x, y: -obstacle.size.height), duration: 3))
        actionArray.append(SKAction.removeFromParent())
        
        obstacle.run(SKAction.sequence(actionArray))
    }
    
    
    
    func addRow(type:RowType) {
        switch type {
        case .oneS:
            var obst = addObstacle(type: .Small)
            obst.position = CGPoint(x: self.size.width / 2, y: obst.position.y)
            addMovement(obstacle: &obst)
            addChild(obst)
            break
        
        case .oneM:
            var obst = addObstacle(type: .Medium)
            obst.position = CGPoint(x: self.size.width / 2, y: obst.position.y)
            addMovement(obstacle: &obst)
            addChild(obst)
            break
        
        case .oneL:
            var obst = addObstacle(type: .Large)
            obst.position = CGPoint(x: self.size.width / 2, y: obst.position.y)
            addMovement(obstacle: &obst)
            addChild(obst)
            break
            
        case .twoS:
            var obs1 = addObstacle(type: .Small)
            var obs2 = addObstacle(type: .Small)
            let offset : CGFloat = 100
            
            obs1.position = CGPoint(x: obs1.size.width + offset, y: obs1.position.y)
            obs2.position = CGPoint(x: self.size.width - obs2.size.width - offset, y: obs2.position.y)
            addMovement(obstacle: &obs1)
            addMovement(obstacle: &obs2)
            addChild(obs1)
            addChild(obs2)
            break
        
        case .twoM:
            var obs1 = addObstacle(type: .Medium)
            var obs2 = addObstacle(type: .Medium)
            let offset : CGFloat = 50
            obs1.position = CGPoint(x: obs1.size.width + offset, y: obs1.position.y)
            obs2.position = CGPoint(x: self.size.width - obs2.size.width - offset, y: obs2.position.y)
            addMovement(obstacle: &obs1)
            addMovement(obstacle: &obs2)
            addChild(obs1)
            addChild(obs2)
            break
        
        case .threeS:
            var obs1 = addObstacle(type: .Small)
            var obs2 = addObstacle(type: .Small)
            var obs3 = addObstacle(type: .Small)
            
            obs1.position = CGPoint(x: obs1.size.width / 2, y: obs1.position.y)
            obs2.position = CGPoint(x: self.frame.midX, y: obs2.position.y)
            obs3.position = CGPoint(x: self.size.width - (obs3.size.width / 2), y: obs3.position.y)
            addMovement(obstacle: &obs1)
            addMovement(obstacle: &obs2)
            addMovement(obstacle: &obs3)
            addChild(obs1)
            addChild(obs2)
            addChild(obs3)
            break
        }
        
    }
    
}
