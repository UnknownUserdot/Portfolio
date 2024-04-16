//
//  UsrData.swift
//  The Black Market
//
//  Created by Nicholas Flynn on 2/11/24.
//

import Foundation

class UsrData: ObservableObject {
    @Published var username: String = ""
    
    @Published var money: Int = 5000
    
    @Published var days: Int = 0 {
        didSet {
            self.placeHolder()
        }
    }
    //discovered a very cool way to store a function like a placeholder to call to in another view like self.gameOvr
    var placeHolder: () -> Void = {}
    }

