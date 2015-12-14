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
       
        attackSound!.play()
    }
    
    
    //MARK: Actions
    @IBAction func p2AttackP1(sender: UIButton) {
        playAttackSound()
        
        p1AttackButton.enabled = false
        self.performSelector("enableAttackButton:", withObject: p1AttackButton, afterDelay: 3.0)
        
        if p1.attempAttack(p2.attackPower) {
            printLbl.text = "\(p2.name) attack \(p1.name) for \(p2.attackPower) HP"
            
        } else {
            printLbl.text = "Attack Fail!"
        }
        
        if !p1.isAlive {
            printLbl.text = "Winner is \(p2.name) !"
            p1Img.hidden = true
            p1AttackButton.enabled = false
            p2AttackButton.enabled = false
        }
      
        //以上，重复的部分是game logic ？
    }
    
    @IBAction func p1AttackP2(sender: UIButton) {
        playAttackSound()

        p2AttackButton.enabled = false
        self.performSelector("enableAttackButton:", withObject: p2AttackButton, afterDelay: 3.0)
        
        if p2.attempAttack(p1.attackPower) {
            printLbl.text = "\(p1.name) attack \(p2.name) for \(p1.attackPower) HP"
            
        } else {
            printLbl.text = "Attack Fail!"
        }
        
        if !p2.isAlive {
            printLbl.text = "Winner is \(p1.name) !"
            p2Img.hidden = true
            p2AttackButton.enabled = false
            p1AttackButton.enabled = false
        }

        //以上，重复的部分是game logic ？
    }
    
    

    
    
    
    
    
}

