//
//  CardView.swift
//  karonas
//
//  Created by Henrique on 26/07/23.
//

import SwiftUI

struct CardView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    
    var caronas: FetchedResults<Caronas>.Element
    
    var body: some View {
        VStack{
            Text(caronas.name!)
                .font(.title3)
                .multilineTextAlignment(.center)
                .frame(width: 300, height: 60)
            Circle()
                .strokeBorder(colorScheme == .dark ? Color("DarkTheme.Red") : Color.red, lineWidth: 4)
                .frame(width: 20)
                .position(x: 100, y:30)
            Rectangle()
                .fill(colorScheme == .dark ? Color("DarkTheme.Red") : Color.red)
                .frame(width: 4, height: 100)
                .position(x: 100, y:0)
            Circle()
                .strokeBorder(colorScheme == .dark ? Color("DarkTheme.Red") : Color.red, lineWidth: 4)
                .frame(width: 20)
                .position(x: 100, y:-29)
            VStack{
                Text(caronas.saindo == true ? "Mackenzie" : caronas.local!)
                    .multilineTextAlignment(.leading)
                    .padding([.bottom], -20)
                    .padding([.leading], 20)
                    .frame(width: 300, height: 60, alignment: .leading)
                    
                Text(caronas.saindo == false ? "Mackenzie" : caronas.local!)
                    .multilineTextAlignment(.leading)
                    .padding([.leading], 20)
                    .frame(width: 300, height: 60, alignment: .leading)
                    .position(x: 196.5, y:75)
            }
            .position(x: 250, y: -220)
            VStack{
                Text(caronas.date1! , style: .time)
                    .frame(width: 50)
                    .position(x: 55, y: -318)
                Text(caronas.dateche! , style: .time)
                    .frame(width: 50)
                    .position(x: 55, y: -247)
            }
            Rectangle()
                .frame(width: 325, height: 2)
                .foregroundColor(.red)
                .position(x: 195,y: -240)
            Text("Contato")
                .multilineTextAlignment(.leading)
                .frame(width: 320, height: 20, alignment: .leading)
                .font(.title3)
                .bold()
                .position(x: 195,y: -312)
                
            Text(caronas.contato!)
                .frame(width: 320, height: 20, alignment: .leading)
                .position(x: 197,y: -375)
        }
    }
}

