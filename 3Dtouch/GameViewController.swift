//
//  GameViewController.swift
//  3Dtouch
//
//  Created by Xin Zou on 12/18/16.
//  Copyright © 2016 Xin Zou. All rights reserved.
//

import UIKit
//import QuartzCore
//import SceneKit
import GameplayKit
import SpriteKit

class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


        if let view = self.view as! SKView? {
            // Load the SKScene from 'gameScene.sks'
//            if let scene = SKScene(fileNamed: "GameScene") { // this one didnot work...
            if let scene = GameScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill

                // Present the scene
                view.presentScene(scene)
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
    }
    

    
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
    }

}
