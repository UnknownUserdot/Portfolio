//
//  MarketPage.swift
//  The Black Market
//
//  Created by Nicholas Flynn on 2/13/24.
//

import SwiftUI

struct MarketPage: View {
    @EnvironmentObject var usrData: UsrData
    @State private var amon = ""
    @State private var selected: Item? = nil
    
    
    let market: Market
    
    let inventory: Inv
    
    let usrItems: usrInv
    
    init(market: Market, inventory: Inv, usrItems: usrInv) {
        self.market = market
        self.inventory = inventory
        self.usrItems = usrItems
    }
    
    var body: some View {

        
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            
 
            VStack {
                NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true)) {
                    HStack {
                        Text("<Back to Home>")
                            .fontWeight(.bold)
                            .foregroundColor(.green)
                            .background(Color.black)
                        
                    }
                    
                }
                .background(Color.black)
                PlayerInfo()
                    .background(Color.black)
                Spacer()
                Spacer()
                
                Text ("Network status . . . Connected . . .")
                    .font(.callout)
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(.center)
                //.position(x:210, y:10)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                Text ( "w e l c o m e  \(market.name)")
                    .font(.callout)
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(.center)
                //.position(x:210, y:10)
                    .lineLimit(1)
                    .truncationMode(.tail)
                
                

                List(market.items, id: \.self) { item in
                    Button(action: {
                        self.selected = item
                    }) {
                        Text(item.name)
                            .foregroundStyle(Color.green)
                            .padding()
                    }
                    .background(Color.black)
                    .listRowBackground(Color.black)
                }
                .scrollContentBackground(.hidden)
                .background(Color.black)

                

                
                if let item = selected {
                    HStack{
                        
                        Text(item.name)
                            .foregroundStyle(Color.green)
                        
                        Text("Price: $\(String(format: "%.2f", item.price))")
                            .foregroundStyle(Color.green)
                        
                        Text("Stock: \(item.stock)")
                            .foregroundStyle(Color.green)
                        
                  
                        //TODO make text field accept only Int inputs for amount
                        TextField("Amount", text: $amon)
                            .keyboardType(.numberPad)
                            .background(Color(.darkGray))
                            //.textFieldStyle(.roundedBorder)
                            .border(Color.green, width: 2)
                            .foregroundStyle(Color.green)
                            
                        
                        Button("Buy"){
                           guard let selected = selected else {
                                return
                            }
                            print(selected)
                            
                            
                            guard let amount = Int(amon) else {
                                return
                            }
                            
                            let cost = Int(selected.price) * amount
                            
                            guard usrData.money >= cost else {
                                return
                            }
                            
                            guard selected.stock >= amount else {
                                return
                            }
                            
                            let IDnum = selected.IDnum
                            
                            
                            usrItems.buy(name: selected.name, amon: amount, selected: selected, IDnum: IDnum)
                            //print stattements for debugging purposes
                            //print(amon)
                                selected.stock -= amount
                            //print(selected.stock)
                            //print(selected.name)
                                usrData.money -= cost
                            //print(cost)
                            //print(usrData.money)
                            
                            //print(usrInv.Item)
                            
          
                            
                        }
                        .foregroundStyle(Color.red)
                        
                        Button("Sell"){
                            
                            //var sellable = true
                            
                            guard let seleItem = selected else {
                                return
                            }
                            //print(selected)
                            print(seleItem)
                            guard let amount = Int(amon) else {
                                return
                            }
                            
                            //calculte for amount being sold
                            let value = Int(seleItem.price) * amount
                            
                            let IDnum = seleItem.IDnum
                            
                            if let index = usrItems.usrInv.firstIndex(where: {$0.IDnum == IDnum / 10}){
                                
                                if usrItems.usrInv[index].stock >= amount {
                                    usrItems.sell(name: seleItem.name, amon: amount, selected: seleItem, IDnum: IDnum)
                                    usrData.money += value
                                    
                                }
                            }

                            
                            print(seleItem)
                           
                            //if sellable == true {

                                
                                //return
                           // }
                            
                            
                        }
                        .foregroundStyle(Color.green)
                    }
                    .frame(width: 350, height: 100)
                    .cornerRadius(10)
                    .shadow(radius: 20)
                    .background(Color.black)
                }

            }
          
            

        }
     
        
    }
        
        
}

#Preview {
    MarketPage(market: Market(items: [], name: "Market" ), inventory: Inv(), usrItems: usrInv())
}
