//
//  Inv.swift
//  The Black Market
//
//  Created by Nicholas Flynn on 2/12/24.
//

import Foundation



class Inv {
    
    var items: [Item] = []
    
    func addItem(item: Item) {
        items.append(item)
    }

}

class usrInv {
    
    
    var usrInv: [Item] = [StemPacks, SynthCoke, SynthLife ,MegaBrain, UltraChi, RamSticks, BrainCompilers]
    
    func buy(name: String, amon: Int, selected: Item, IDnum: Int) {
        // find item
        if let index = usrInv.firstIndex(where: { $0.IDnum == IDnum / 10 } ){
            usrInv[index].stock += amon
            //print(usrInv[index].stock, usrInv[index].name)
        }
        //debugging check for proper inv use in buy function
        print("Current Inventory for user inventory:")
        for item in usrInv {
            print("\(item.name): \(item.stock)")
        }
    }
    
    
    //var usrData = UsrData()
    
    func sell(name: String, amon: Int, selected: Item, IDnum: Int) {
        if let index = usrInv.firstIndex(where: { $0.IDnum == IDnum / 10 } ){
            if usrInv[index].stock > 0 && usrInv[index].stock >= amon {
                
                usrInv[index].stock -= amon
                
                //usrData.money += (amon * Int(usrInv[index].price))
                //print (usrData.money)
                //debugging check for proper inv use in buy function
                print("Current Inventory for user inventory:")
                for item in usrInv {
                    print("\(item.name): \(item.stock)")
                }
                
            } else {
                return
            }
            
            
        }

    }
    
}

