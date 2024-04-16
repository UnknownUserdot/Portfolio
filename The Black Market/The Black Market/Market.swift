//
//  Market.swift
//  The Black Market
//
//  Created by Nicholas Flynn on 2/12/24.
//

import Foundation

class Market: Equatable {
    
    static func == (lhs: Market, rhs: Market) -> Bool {
        return lhs.name == rhs.name
    }
    
    typealias Index = Int
    
    var startIndex: Index {
        return items.startIndex
    }
    var endIndex: Index {
        return items.endIndex
    }
    var items: [Item] = []
    var name: String = ""
    
    subscript(position: Index) -> Item {
        return items[position]
    }
    
    init(items: [Item], name: String) {
        self.items = items
        self.name = name
    }
    
    //func addItem(item: Item) {
      //  items.append(item)
    //}
    //func removeItem(item: Item) {
        //if let index = items.firstIndex(of: item) {
            //items.remove(at: index)
        //}
    //}
    func index(after i: Index) -> Index {
        return items.index(after:  i)
    }
    func index(before i: Index) -> Index {
        return items.index(before: i)
    }
    
    func randomizerPrices() {
        
        StemPacksm.price = Double.random(in: 10...60)
        
        RamSticksm.price = Double.random(in: 20...85)
        
        SynthCokem.price = Double.random(in: 90...378)
        
        UltraChim.price = Double.random(in: 180...450)
        
        BrainCompilersm.price = Double.random(in: 200...800)
        
        SynthLifem.price = Double.random(in: 300...600)
        
        MegaBrainm.price = Double.random(in: 1000...3500)
        
    }
    
    func randomizerAmount(){
        
        StemPacksm.stock = Int.random(in: 0...200)
        
        RamSticksm.stock = Int.random(in: 0...189)
        
        SynthCokem.stock = Int.random(in: 0...128)
        
        UltraChim.stock = Int.random(in: 0...89)
        
        BrainCompilersm.stock = Int.random(in: 0...58)
        
        SynthLifem.stock = Int.random(in: 0...45)
        
        MegaBrainm.stock = Int.random(in: 0...23)
        
    }
    
    
}

let ipStore1 = Market (items: [StemPacksm, RamSticksm, SynthCokem, UltraChim, SynthLifem], name: "192.343.1.400")

let ipStore2 = Market (items: [SynthCokem, SynthLifem, BrainCompilersm, StemPacksm, RamSticksm], name: "192.555.3.600")

let ipStore3 = Market (items: [UltraChim, BrainCompilersm, MegaBrainm, StemPacksm, RamSticksm], name: "192.333.2.200")

let ipStore4 = Market (items: [UltraChim, BrainCompilersm, RamSticksm, SynthCokem, MegaBrainm], name: "192.999.2.100")
