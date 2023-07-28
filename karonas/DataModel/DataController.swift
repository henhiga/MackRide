//
//  DataController.swift
//  karonas
//
//  Created by Henrique on 24/07/23.
//

import Foundation
import CoreData

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "CaronaModel")
    
    init(){
        container.loadPersistentStores{ desc, error in
            if let error = error {
                print("failed to load the data \(error.localizedDescription)")
            }
            
            
        }
    }
    
    func save(context: NSManagedObjectContext) {
        do{
            try context.save()
            print("Data saved!!!!!!")
        } catch {
            print("cant save the data :(")
        }
    }
    
    func addCarona(name: String, local: String, date1: Date, contato: String, saindo: Bool, pocarona: Bool, dateche: Date, date: Date, context: NSManagedObjectContext) {
        let carona = Caronas(context: context)
        carona.id = UUID()
        carona.date1 = date1
        carona.local = local
        carona.contato = contato
        carona.saindo = saindo
        carona.name = name
        carona.pocarona = pocarona
        carona.dateche = dateche
        carona.date = date
        
        save(context: context)
    }
    func editCarona(carona: Caronas, name: String, local: String, date1: Date, contato: String, saindo: Bool, pocarona: Bool, dateche: Date, date: Date, context: NSManagedObjectContext) {
        carona.date1 = date1
        carona.local = local
        carona.contato = contato
        carona.saindo = saindo
        carona.name = name
        carona.pocarona = pocarona
        carona.dateche = dateche
        carona.date = date
        
        save(context: context)
    }
}
