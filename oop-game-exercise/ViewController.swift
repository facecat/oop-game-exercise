//
//  ViewController.swift
//  oop-game-exercise
//
//  Created by 邱国邦 on 15/12/14.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //MARK: Property
    
    var game: Game!
    var p1: Player!
    var p2: Player!
    var attackSound: AVAudioPlayer!
    
    
    //MARK: Outlet
    
    @IBOutlet weak var printLbl: UILabel!
    @IBOutlet weak var p1AttackButton: UIButton!
    @IBOutlet weak var p2AttackButton: UIButton!
    @IBOutlet weak var p1Img: UIImageView!
    @IBOutlet weak var p2Img: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let path = NSBundle.mainBundle().pathForResource("attack", ofType: "wav")
        let soundUrl = NSURL(fileURLWithPath: path!)
        
        do {
            try attackSound = AVAudioPlayer(contentsOfURL: soundUrl)
            attackSound.prepareToPlay()
        } catch let err as NSError {
            print(err.debugDescription)
        }
        
        startNewGame()
    }
    
    
    //MARK: Functions
    
    func startNewGame() {
        p1 = Player(name: "Orc", startingHp: 100, attackPwr: 15)
        p2 = Player(name: "Knight", startingHp: 150, attackPwr: 10)
        
        game = Game(p1: p1, p2: p2)
        
        p1Img.hidden = false
        p2Img.hidden = false
        
        p1AttackButton.enabled = true
        p2AttackButton.enabled = true
        
        printLbl.text = "Press ATTACK!"
        
    }
    
   
    func enableAttackButton(btn: UIButton!) {
        btn.enabled = true
    }
    
    func playAttackSound() {
        
        if attackSound.playing { attackSound.stop() }
       
        attackSound.play()
    }
    
    func updateGameState(msg: String) {
        printLbl.text = msg
        
        
        if let gameResult = game.gameIsOver() {
            
            printLbl.text = gameResult
            
            p2AttackButton.hidden = true
            p1AttackButton.hidden = true
        }
        
    }
    
    //MARK: Actions
    @IBAction func p2AttackP1(sender: UIButton) {
        playAttackSound()
        
        p1AttackButton.enabled = false
        self.performSelector("enableAttackButton:", withObject: p1AttackButton, afterDelay: 3.0)
        
        
        let lblMessage = game.attackFrom(p2, to: p1)
        
        updateGameState(lblMessage)
    }
    
    @IBAction func p1AttackP2(sender: UIButton) {
        playAttackSound()

        p2AttackButton.enabled = false
        self.performSelector("enableAttackButton:", withObject: p2AttackButton, afterDelay: 3.0)

        
        let lblMessgae = game.attackFrom(p1, to: p2)

        updateGameState(lblMessgae)
    }
    
    

    
    
    
    
    
}

