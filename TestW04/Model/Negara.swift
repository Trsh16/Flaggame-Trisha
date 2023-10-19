//
//  Negara.swift
//  TestW04
//
//  Created by MacBook Pro on 18/10/23.
//

import Foundation
import SwiftUI

class Negara{
    var randomnumber: Int
    var poin: Int
    var checkpoint: Int
    var aseanName : [String]
    
    
    init(randomnumber: Int, poin: Int, checkpoint: Int, aseanName : [String]) {
        self.randomnumber = randomnumber
        self.poin = poin
        self.checkpoint = checkpoint
        self.aseanName = aseanName
    }
    
    func checkWin(_ checkpoin:Int, _ point: Int)->(showingAlert: Bool, condition : String){
        var win:Bool = false
        var condition:String = ""
        if (checkpoin == 10 && point == 10 ) {
            win = true
            condition = "You win, your point is \(point), play again?"
        }else if (checkpoin == 10 && point < 10){
            win = true
            condition = "You lose, your correct point is \(point), your wrong point is \(10-point), play again?"
        }
        return (win,condition)
    }
    
    func addAseanCountry(_ aseanName: String){
        self.aseanName.append(aseanName)
    }
    
    func getAseanCountry()->[String]{
        return aseanName
    }
    
    func checkAppearance(_ aseanName: String) -> Bool {
        for name in GlobalVariable.negara.aseanName {
            if name == aseanName {
                return true
            }
        }
        return false
    }
}
