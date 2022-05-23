//
//  GameViewController.swift
//  ExplodingMonkeys
//
//  Created by IACD-022 on 2022/05/22.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {

    var currentGame: GameScene?
    @IBOutlet var angleSlider: UISlider!
    @IBOutlet var angleLbl: UILabel!
    
    @IBOutlet var velSlider: UISlider!
    @IBOutlet var velLbl: UILabel!
    
    @IBOutlet var launchBtn: UIButton!
    
    @IBOutlet var playerNum: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            // Load the SKScene from 'GameScene.sks'
            if let scene = SKScene(fileNamed: "GameScene") {
                // Set the scale mode to scale to fit the window
                scene.scaleMode = .aspectFill
                
                // Present the scene
                view.presentScene(scene)
                currentGame = scene as? GameScene
                currentGame?.viewController = self
            }
            
            view.ignoresSiblingOrder = true
            
            view.showsFPS = true
            view.showsNodeCount = true
        }
        
        angleChanged(self)
        velChanged(self)
    }

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    @IBAction func angleChanged(_ sender: Any) {
        angleLbl.text = "Angle: \(Int(angleSlider.value))°"
    }
    @IBAction func velChanged(_ sender: Any) {
        velLbl.text = "Velocity: \(Int(velSlider.value))°"
    }
    @IBAction func launch(_ sender: Any) {
        angleSlider.isHidden = true
        angleLbl.isHidden = true
        
        velSlider.isHidden = true
        velLbl.isHidden = true
        
        launchBtn.isHidden = true
        
        currentGame?.launch(angle: Int(angleSlider.value), velocity: Int(velSlider.value))
    }
    
    func activatePlayer(num: Int) {
        if num == 1 {
            playerNum.text = "<<< PLAYER ONE"
        } else{
            playerNum.text = "PLAYER TWO >>>"
        }
        angleSlider.isHidden = false
        angleLbl.isHidden = false
        
        velSlider.isHidden = false
        velLbl.isHidden = false
        
        launchBtn.isHidden = false
    }
}
