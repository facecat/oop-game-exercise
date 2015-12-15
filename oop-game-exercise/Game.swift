//
//  Game.swift
//  oop-game-exercise
//
//  Created by 邱国邦 on 15/12/15.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import Foundation

class Game {
    
    var p1: Player
    var p2: Player
    
    init(p1: Player, p2: Player) {
        self.p1 = p1
        self.p2 = p2
    }
    
    func attackFrom(a :Player, to b: Player) ->String {
        if b.attempAttack(a.attackPower) {
            return "\(a.name) attack \(b.name) for \(a.attackPower) HP!"
        } else {
            return "Failed to attack..."
        }
    }
    
    func gameIsOver() ->String? {
        
        if !p1.isAlive {
            return "\(p2.name) Win!"
        }
        
        if !p2.isAlive {
            return "\(p1.name) Win!"
        }
        return nil
    }
    
    
}