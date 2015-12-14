//
//  Player.swift
//  oop-game-exercise
//
//  Created by 邱国邦 on 15/12/14.
//  Copyright © 2015年 FaceCat. All rights reserved.
//

import Foundation

class Player {
    
    //MARK: Properties
    
    private var _hp: Int
    
    var hp: Int {
        return _hp
    }
    
    private var _attackPower: Int
    
    var attackPower: Int {
        return _attackPower
    }
    
    var name: String
    
    var isAlive: Bool {
        return self._hp > 0
    }
    
    //MARK: Initial
    
    init(name: String, startingHp: Int, attackPwr: Int) {
        
        self.name = name
        self._hp = startingHp
        self._attackPower = attackPwr
    }
    
    //MARK: Functions
    
    func attempAttack(attackPwr: Int) ->Bool {
        self._hp -= attackPwr
        
        return true
    }
    
    
    
}