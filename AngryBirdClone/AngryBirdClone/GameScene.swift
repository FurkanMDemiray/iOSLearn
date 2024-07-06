//
//  GameScene.swift
//  AngryBirdClone
//
//  Created by Melik Demiray on 26.11.2023.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {

    var bird = SKSpriteNode()
    var boxs = [SKSpriteNode]()
    var isGameStarted = false
    var startPosition: CGPoint?
    let scoreLabel = SKLabelNode(text: "Score: 0")
    var score = 0

    enum ColliderType: UInt32 {
        case Bird = 1
        case Box = 2
        //case Ground = 4  iki katı olarak devam etmeli
        //case Tree = 8
    }

    override func didMove(to view: SKView) {
        /*
        let texture = SKTexture(imageNamed: "bird")
        bird.texture = texture
        bird.size = CGSize(width: self.frame.width / 15, height: self.frame.height / 8)
        bird.position = CGPoint(x: 0, y: 0)
        bird.zPosition = 1
        self.addChild(bird)
         */

        // Physics
        self.physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        self.scene?.scaleMode = .aspectFit
        self.physicsWorld.contactDelegate = self


        // bird
        bird = childNode(withName: "bird") as! SKSpriteNode
        let birdTexture = SKTexture(imageNamed: "bird")

        bird.physicsBody = SKPhysicsBody(circleOfRadius: birdTexture.size().height / 13)
        bird.physicsBody?.affectedByGravity = false
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.mass = 0.1
        startPosition = bird.position

        bird.physicsBody?.contactTestBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.categoryBitMask = ColliderType.Bird.rawValue
        bird.physicsBody?.collisionBitMask = ColliderType.Box.rawValue




        // bricks

        let brickTexture = SKTexture(imageNamed: "brick")
        let size = CGSize(width: brickTexture.size().width / 6, height: brickTexture.size().height / 6)

        for i in 0...5 {
            if let box = childNode(withName: "box\(i)") as? SKSpriteNode {
                boxs.append(box)
                boxs[i].texture = brickTexture
                boxs[i].physicsBody = SKPhysicsBody(rectangleOf: size)
                boxs[i].physicsBody?.affectedByGravity = true
                boxs[i].physicsBody?.isDynamic = true
                boxs[i].physicsBody?.mass = 0.1
                boxs[i].physicsBody?.allowsRotation = true
                boxs[i].physicsBody?.collisionBitMask = ColliderType.Bird.rawValue
            } else {
                print("Box with name 'box\(i)' not found.")
            }
        }

        // scoreLabel


        scoreLabel.position = CGPoint(x: 0, y: self.frame.height / 5)
        scoreLabel.fontName = "AvenirNext-Bold"
        scoreLabel.fontSize = 36
        scoreLabel.fontColor = UIColor.black
        scoreLabel.zPosition = 2
        self.addChild(scoreLabel)



    }

    func didBegin(_ contact: SKPhysicsContact) {

        if contact.bodyA.collisionBitMask == ColliderType.Bird.rawValue || contact.bodyB.collisionBitMask == ColliderType.Bird.rawValue {

            score += 1
            scoreLabel.text = "Score: \(score)"

        }
    }

    func touchDown(atPoint pos: CGPoint) {


    }

    func touchMoved(toPoint pos: CGPoint) {


    }

    func touchUp(atPoint pos: CGPoint) {

    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {

        if isGameStarted == false {

            if let touch = touches.first {

                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)

                if touchNodes.isEmpty == false {

                    for node in touchNodes {

                        if let sprite = node as? SKSpriteNode {

                            if sprite == bird {

                                bird.position = touchLocation

                            }

                        }

                    }

                }

            }

        }
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isGameStarted == false {

            if let touch = touches.first {

                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)

                if touchNodes.isEmpty == false {

                    for node in touchNodes {

                        if let sprite = node as? SKSpriteNode {

                            if sprite == bird {

                                bird.position = touchLocation

                            }

                        }

                    }

                }

            }

        }
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if isGameStarted == false {

            if let touch = touches.first {

                let touchLocation = touch.location(in: self)
                let touchNodes = nodes(at: touchLocation)

                if touchNodes.isEmpty == false {

                    for node in touchNodes {

                        if let sprite = node as? SKSpriteNode {

                            if sprite == bird {

                                isGameStarted = true
                                bird.physicsBody?.affectedByGravity = true

                                var dx = -(touchLocation.x - startPosition!.x)
                                var dy = -(touchLocation.y - startPosition!.y)

                                bird.physicsBody?.applyImpulse(CGVector(dx: dx, dy: dy))


                            }

                        }

                    }

                }

            }

        }
    }

    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {

    }


    override func update(_ currentTime: TimeInterval) {


        if let birdPhysic = bird.physicsBody {

            if birdPhysic.velocity.dx <= 0.1 && birdPhysic.velocity.dy <= 0.1 && birdPhysic.angularVelocity <= 0.1 && isGameStarted == true {

                bird.position = startPosition!
                birdPhysic.angularVelocity = 0
                birdPhysic.velocity = CGVector(dx: 0, dy: 0)
                birdPhysic.affectedByGravity = false
                isGameStarted = false

            }

        }

    }
}
