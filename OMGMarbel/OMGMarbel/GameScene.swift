//
//  GameScene.swift
//  OMGMarbel
//
//  Created by Pawan Kumar on 25/02/19.
//  Copyright © 2019 PawanShivHari inc. All rights reserved.
//

import SpriteKit

class Ball: SKSpriteNode {}

class GameScene: SKScene {
    
    var balls = ["ballBlue","ballGreen","ballPurple","ballRed","ballYellow"]
    
    override func didMove(to view: SKView) {
        let backgound = SKSpriteNode(imageNamed: "checkerboard")
        backgound.position = CGPoint(x: frame.midX, y: frame.midY)
        backgound.alpha = 0.2
        backgound.zPosition = -1
        addChild(backgound)
        
        let ball = SKSpriteNode(imageNamed: "ballBlue")
        let ballRadius = ball.frame.width / 2.0
        
        for i in stride(from: ballRadius, to: view.bounds.width - 100, by: ball.frame.width) {
            for j  in stride(from: 100, to: view.bounds.height - ballRadius, by: ball.frame.height) {
            let ballType = balls.randomElement()!
                let ball = Ball(imageNamed:ballType)
                ball.position = CGPoint(x: i, y: j)
                ball.name = ballType
                addChild(ball)
            }
        }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
