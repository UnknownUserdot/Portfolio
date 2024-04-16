//
//  GameOver.swift
//  The Black Market
//
//  Created by Nicholas Flynn on 3/7/24.
//

import SwiftUI



struct GameOver: View {
    @EnvironmentObject var usrData: UsrData
    
    var body: some View {
        ZStack{
            Color.black.edgesIgnoringSafeArea(.all)
            NavigationLink(destination: ContentView().navigationBarBackButtonHidden(true)){
                Text(". . . G A M E  O V E R . . .\nT R Y  A G A I N ?\n\nUSERNAME: \(usrData.username)\nSCORE: \(usrData.money)")
                    .font(.callout)
                    .fontWeight(.bold)
                    .foregroundColor(Color.green)
                    .multilineTextAlignment(.center)
            }
        }

    }
   
}

#Preview {
    GameOver()
}
