//
//  PlayerInfo.swift
//  The Black Market
//
//  Created by Nicholas Flynn on 2/11/24.
//

import SwiftUI

struct PlayerInfo: View {
    @EnvironmentObject var usrData: UsrData
        var body: some View{

            let moneyLen = String(usrData.money).count
            let fontSize = (moneyLen/2 + 20) / 2 + 10
                VStack{
                    Text("\(usrData.username)")
                        .font(.callout)
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                    
                        .multilineTextAlignment(.center)
                    //.position(x:210, y:10)
                        .lineLimit(1)
                        .truncationMode(.tail)
                    
                    Text("Money $\(usrData.money)")
                        .font(.system(size: CGFloat(fontSize)))
                        .fontWeight(.bold)
                        .foregroundColor(Color.green)
                        .multilineTextAlignment(.center)
                    //.position(x: 210, y:-390)
                        .lineLimit(1)
                        .truncationMode(.tail)
                
            }
            
            
        }
    
}
#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let usrData = UsrData() // Initialize UsrData
        ContentView().environmentObject(usrData) // Inject UsrData into ContentView
    }
}
#endif

#Preview {
    PlayerInfo().environmentObject(UsrData())
}
