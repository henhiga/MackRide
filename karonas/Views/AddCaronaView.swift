//
//  AddCaronaView.swift
//  karonas
//
//  Created by Henrique on 24/07/23.
//

import SwiftUI

struct AddCaronaView: View {
    @Environment (\.managedObjectContext) var ManagedObjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name=""
    @State private var local=""
    @State private var date1=Date()
    @State private var contato=""
    @State private var saindo=false
    @State private var pocarona=false
    @State private var dateche=Date()
    @State private var date=Date()
  
    var body: some View {
        NavigationView{
            Form {
                Section(header: Text("Informações"))  {
                    TextField("Nome", text: $name)
                    
                    Toggle("Saindo do Mackenzie?", isOn: $saindo)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    TextField(saindo==false ? "Local de saída" : "Local de chegada", text: $local)
                    DatePicker("Horário de saída", selection: $date1, displayedComponents: .hourAndMinute)
                    DatePicker("Horário de chegada", selection: $dateche, displayedComponents: .hourAndMinute)
                    Toggle("Oferecendo carona?", isOn: $pocarona)
                        .toggleStyle(SwitchToggleStyle(tint: .red))
                    TextField("Contato(ex: 11912345678 ou @exemplo)", text: $contato)
                }
            }
            .accentColor(.red)
            .navigationTitle("Criar")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    Button {
                        DataController().addCarona(name: name, local: local, date1: date1, contato: contato, saindo: saindo, pocarona: pocarona, dateche:dateche, date:date, context: ManagedObjContext)
                        print(name, local, date1, contato, saindo, pocarona, dateche)
                        dismiss()
                    } label: {
                        Text("Criar")
                    }
                }
            }
        }
    }
}



struct AddCaronaView_Previews: PreviewProvider {
    static var previews: some View {
        AddCaronaView()
    }
}
