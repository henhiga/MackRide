//
//  ContentView.swift
//  karonas
//
//  Created by Henrique on 24/07/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var caronas: FetchedResults<Caronas>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView{
            VStack() {
                List{
                    ForEach(caronas) { caronas in
                        NavigationLink(destination: CardView(caronas: caronas)) {
                            ZStack{
                                RoundedRectangle(cornerRadius: 25, style: .continuous)
                                    .fill(colorScheme == .dark ? Color("DarkTheme") : Color.white)
                                    .shadow(radius: 5)
                                VStack{
                                    Text(caronas.pocarona ? "Oferecendo Carona" : "Procurando Carona")
                                        .padding([.top], 4)
                                        .padding([.bottom], -5)
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
                    .onDelete(perform: deleteCarona)
                }
                .scrollContentBackground(.hidden)
                .listRowSeparator(.hidden)
            }
            .navigationTitle("Home")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        showingAddView.toggle()
                    } label: {
                        Label("Adicionar Caronas", systemImage: "plus")
                    }
                    
                }
            }
            .sheet(isPresented: $showingAddView) {
                AddCaronaView()
            }
        }
    }
    private func deleteCarona(offsets: IndexSet){
        offsets.map { caronas[$0] }.forEach(managedObjContext.delete)
        DataController().save(context: managedObjContext)
    }
}





struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
