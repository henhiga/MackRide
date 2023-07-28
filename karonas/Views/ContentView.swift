//
//  ContentView.swift
//  karonas
//
//  Created by Henrique on 24/07/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.date, order: .reverse)]) var caronas: FetchedResults<Caronas>
    
    @State private var showingAddView = false
    
    var body: some View {
        NavigationView{
            VStack() {
                List{
                    ForEach(caronas) { caronas in
                        NavigationLink(destination: NavCardView(caronas: caronas)) {
                            CardView(caronas:caronas)
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
