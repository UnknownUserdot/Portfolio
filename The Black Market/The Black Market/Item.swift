//
//  Item.swift
//  The Black Market
//
//  Created by Nicholas Flynn on 2/10/24.
//

import Foundation
import SwiftData

@Model
class Item: Equatable {
    
    var name: String
    var price: Double
    var stock: Int
    var IDnum: Int
    
    init(price: Double, stock: Int, name: String, IDnum: Int) {
        self.price = price
        self.stock = stock
        self.name = name
        self.IDnum = IDnum
    }
    static func ==(lhs: Item, rhs: Item) -> Bool {
        return lhs.price == rhs.price && lhs.stock == rhs.stock
    }
    func randomizer() {
        
    }
}


let StemPacks = Item (price: 0, stock: 0, name: "StemPacks", IDnum: 1)

let SynthCoke = Item(price: 0, stock: 0, name: "Synth Coke", IDnum: 2)

let SynthLife = Item (price: 0, stock: 0, name: "Synth Life", IDnum: 3)
 
let MegaBrain = Item (price: 0, stock: 0, name: "Mega Brain", IDnum: 4)

let UltraChi = Item (price: 0, stock: 0, name: "Ultra Chi", IDnum: 5)

let RamSticks = Item (price: 0, stock: 0, name: "Ram Sticks", IDnum: 6)

let BrainCompilers = Item (price: 0, stock: 0, name: "Brain Compilers", IDnum: 7)

//instances to be used only by the market the M is the market version which will be randomized on each visit using a function in "Market"

let StemPacksm = Item (price: 0, stock: 0, name: "Stem-Packs", IDnum: 10)

let SynthCokem = Item(price: 0, stock: 0, name: "Synth-Coke", IDnum: 20)

let SynthLifem = Item (price: 0, stock: 0, name: "Synth-Life", IDnum: 30)
 
let MegaBrainm = Item (price: 0, stock: 0, name: "Mega-Brain", IDnum: 40)

let UltraChim = Item (price: 0, stock: 0, name: "Ultra-Chi", IDnum: 50)

let RamSticksm = Item (price: 0, stock: 0, name: "Ram-Sticks", IDnum: 60)

let BrainCompilersm = Item (price: 0, stock: 0, name: "Brain-Compilers", IDnum: 70)

