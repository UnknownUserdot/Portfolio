//
//  ContentView.swift
//  The Black Market
//
//  Created by Nicholas Flynn on 2/10/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @EnvironmentObject var usrData: UsrData
    
    var body: some View {
        NavigationView {
            ZStack{
                Color.black
            
            VStack {
                SecureField("Enter Alias", text: $usrData.username)
                
                    .background(Color(.darkGray))
                    .foregroundColor(.green)
                    .border(Color.green,width: 2)
                    //.textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                //Cheat codes with names. Currently does not work. optional for fun at the end of project to fix.
                Button(action: {
                    if usrData.username == "moneybags" {
                        usrData.money += 1000000
                        print(usrData.money)
                    } else if usrData.username == "toughluck" {
                        usrData.money -= 4000
                        print(usrData.money)
                    }
                    
                }) {
                    if usrData.username.isEmpty {
                        Text("Who are you?")
                            .foregroundColor(.green)
                    } else {
                        
                        NavigationLink(destination: HomeView().navigationBarBackButtonHidden(true)) {
                            HStack {
                                Text("Enter the Black Market\nYou have 31 days to earn. One day passes for each visit to a store. Make those profits count.")
                                    .foregroundColor(.green)
                                Image(systemName: "network")
                                    .foregroundColor(.green)
                            }
                        }
                    }
                }
            }
            .onAppear{
                usrData.money = 5000
                usrData.days = 0
            }
            
        }
            .background(Color.black)
        }
        
    }
        
    
}

#Preview {
    ContentView()
        .modelContainer(for: Item.self, inMemory: true)
}
