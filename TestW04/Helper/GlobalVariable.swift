//
//  GlobalVariable.swift
//  TestW04
//
//  Created by MacBook Pro on 18/10/23.
//

import Foundation

struct GlobalVariable{
    static var negara = Negara(randomnumber: Int.random(in: 0...9),poin: 0, checkpoint: 0, aseanName: [])
    static func newGame(){
        GlobalVariable.negara = Negara(randomnumber: Int.random(in: 0...9), poin: 0, checkpoint: 0, aseanName: [])
    }
}

