//
//  Home.swift
//  The Black Market
//
//  Created by Nicholas Flynn on 2/10/24.
//

import SwiftUI
import SwiftData


struct HomeView: View {
    
    @EnvironmentObject var usrData: UsrData
    
    
    @State var GameisOver = false
    
    func gameOvr() {
        if usrData.days >= 31 {
            GameisOver = true
        } else {
            return
        }}
    
    
    var body: some View {
        
        NavigationLink(destination: GameOver().navigationBarBackButtonHidden(true), isActive: $GameisOver) { EmptyView() }
        
        ZStack {
            Color.black
            
            VStack {
                PlayerInfo()
                Spacer()
                
                let inventory = Inv()
                let usrItems = usrInv()
                
                
                NavigationLink( destination: MarketPage(market: ipStore1, inventory: inventory, usrItems: usrItems).navigationBarBackButtonHidden(true)) {
                    Text("Visit \(ipStore1.name)")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                        .multilineTextAlignment(.center)
                    //ontap should run a function to randomize the price 
                        .onAppear {
                            usrData.placeHolder = self.gameOvr
                            usrData.days += 1
                            
                            ipStore1.randomizerPrices()
                            ipStore1.randomizerAmount()
                            print(usrData.days)
                        }
                }
                Spacer()
                NavigationLink( destination: MarketPage(market: ipStore2, inventory: inventory, usrItems: usrItems).navigationBarBackButtonHidden(true)) {
                    Text("Visit \(ipStore2.name)")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                        .multilineTextAlignment(.center)
                        .onAppear {
                            //days += 1
                            ipStore2.randomizerPrices()
                            ipStore2.randomizerAmount()
                            //print(days)
                    }
                }
                Spacer()
                NavigationLink (destination: MarketPage(market: ipStore3, inventory: inventory, usrItems: usrItems).navigationBarBackButtonHidden(true)){
                    Text("Visit \(ipStore3.name)")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                        .multilineTextAlignment(.center)
                        .onAppear {
                            //days += 1
                            ipStore3.randomizerPrices()
                            ipStore3.randomizerAmount()
                            //print(days)
                        }
                }
                Spacer()
                NavigationLink (destination: MarketPage(market: ipStore4, inventory: inventory, usrItems: usrItems).navigationBarBackButtonHidden(true)) {
                    Text("Visit \(ipStore4.name)")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                        .multilineTextAlignment(.center)
                        .onAppear {
                            //days += 1
                            ipStore4.randomizerPrices()
                            ipStore4.randomizerAmount()
                            //print(days)
                            //DEBUG PRINT STATEMENT  print(SynthCoke.price)
                            
                        }
                }
                Spacer()
            }
            
            
        }
        .background(Color.black)
                
    }
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
