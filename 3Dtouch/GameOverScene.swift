//
//  GameOverScene.swift
//  3Dtouch
//
//  Created by Xin Zou on 12/19/16.
//  Copyright © 2016 Xin Zou. All rights reserved.
//

import SpriteKit

class GameOverScene: SKScene {

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(size: CGSize) {
        super.init(size: size)
        
        self.backgroundColor = .black
        let msg = "Game Over"
        
        let lab = SKLabelNode(text: msg)
        lab.fontName = "Optima-ExtraBlack"
        lab.fontColor = UIColor.yellow
        lab.fontSize = 90
        lab.position = CGPoint(x: self.frame.midX, y: self.frame.midY)
        self.addChild(lab)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let transition = SKTransition.fade(withDuration: 0.5)
        let gameScene = GameScene(size: self.frame.size)
        self.view?.presentScene(gameScene, transition: transition)
    }
    
}
