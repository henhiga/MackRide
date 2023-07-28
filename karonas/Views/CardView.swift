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
    
    var caronas: FetchedResults<Caronas>.Element
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(colorScheme == .dark ? Color("DarkTheme") : Color.white)
                .shadow(radius: 5)
            VStack{
                Text(caronas.pocarona ? "Oferecendo Carona" : "Procurando Carona")
                    .padding([.top], 4)
                    .padding([.bottom], -4.99)
                HStack{
                    VStack{
                        Circle()
                            .strokeBorder(colorScheme == .dark ? Color("DarkTheme.Red") : Color.red, lineWidth: 2)
                            .frame(width: 11)
                            .position(x: 60, y:30)
                        Rectangle()
                            .fill(colorScheme == .dark ? Color("DarkTheme.Red") : Color.red)
                            .frame(width: 2, height: 60)
                            .position(x: 60, y:23)
                        Circle()
                            .strokeBorder(colorScheme == .dark ? Color("DarkTheme.Red") : Color.red, lineWidth: 2)
                            .frame(width: 11)
                            .position(x: 60, y:16)
                        
                    }
                    HStack{
                        VStack{
                            Text(caronas.saindo == true ? "Mackenzie" : caronas.local!)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2, reservesSpace: true)
                                .padding([.bottom], -20)
                                .padding([.leading], 20)
                                .frame(width: 200, height: 60, alignment: .leading)
                            Text(caronas.saindo == false ? "Mackenzie" : caronas.local!)
                                .multilineTextAlignment(.leading)
                                .padding([.leading], 20)
                                .frame(width: 200, height: 60, alignment: .leading)
                        }
                            .position(x: 0, y:65)
                        Text(caronas.date1! , style: .time)
                            .frame(width: 50)
                            .position(x:-180 , y:31)
                            .font(.system(size: 11))
                        Text(caronas.dateche! , style: .time)
                            .frame(width: 50)
                            .position(x: -230, y:99)
                            .font(.system(size: 11))
                    }
                    
                }
                Text(caronas.name!)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .padding([.bottom],10)
                    .font(.system(size: 30))
                    
            }
                
                
            
        }
        .frame(width: 300, height: 200)
    }
}

