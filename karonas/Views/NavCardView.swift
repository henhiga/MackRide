//
//  NavCardView.swift
//  karonas
//
//  Created by Henrique on 28/07/23.
//

import SwiftUI
import UserNotifications

struct NavCardView: View {
    @Environment(\.managedObjectContext) var managedObjContext
    @Environment(\.colorScheme) var colorScheme
    var caronas: FetchedResults<Caronas>.Element
    var calendar = Calendar.current
    @State var clickou = false
    
    
    var body: some View {
        NavigationStack{
            VStack{
                Text(caronas.name!)
                    .font(.title2)
                    .multilineTextAlignment(.center)
                    .frame(width: 300, height: 60)
                Circle()
                    .strokeBorder(colorScheme == .dark ? Color("DarkTheme.Red") : Color.red, lineWidth: 4)
                    .frame(width: 20)
                    .position(x: 100, y:27)
                Rectangle()
                    .fill(colorScheme == .dark ? Color("DarkTheme.Red") : Color.red)
                    .frame(width: 4, height: 90)
                    .position(x: 100, y:15)
                Circle()
                    .strokeBorder(colorScheme == .dark ? Color("DarkTheme.Red") : Color.red, lineWidth: 4)
                    .frame(width: 20)
                    .position(x: 100, y:5)
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
                .position(x: 250, y: -170)
                VStack{
                    Text(caronas.date1! , style: .time)
                        .frame(width: 50)
                        .position(x: 55, y: -226)
                    Text(caronas.dateche! , style: .time)
                        .frame(width: 50)
                        .position(x: 55, y: -155)
                }
                Rectangle()
                    .frame(width: 325, height: 2)
                    .foregroundColor(.red)
                    .position(x: 195,y: -140)
                Text("Contato")
                    .multilineTextAlignment(.leading)
                    .frame(width: 320, height: 20, alignment: .leading)
                    .font(.title3)
                    .bold()
                    .position(x: 195,y: -191)
                
                Text(caronas.contato!)
                    .frame(width: 320, height: 20, alignment: .leading)
                    .position(x: 197.5,y: -230)
                Button("Mandar notificação da saída"){
                    SendNoti()
                    clickou = true
                    }
                    .frame(width: 200, height: 60)
                    .background(clickou ? .gray : .red)
                    .clipShape(Capsule())
                    .foregroundStyle(.white)
                    .padding()
                    .opacity(checkNotification() ? 1 : 0)
                    .disabled(clickou ? true : false)
            }
            
        }
    }
    func checkNotification() -> Bool {
            guard let settings = UIApplication.shared.currentUserNotificationSettings else {
                return false
            }
            return settings.types.intersection([.alert, .badge, .sound]).isEmpty != true
        }
    func SendNoti() {
        let content = UNMutableNotificationContent()
        content.title = "Sua carona está próxima!"
        content.subtitle = "Está a 15 minutos"
        content.sound = UNNotificationSound.default
        content.badge = 0
        
        var dateComponents = DateComponents()
        var minutos = calendar.component(.minute, from: caronas.date1!)
        var horas = calendar.component(.hour, from: caronas.date1!)
        print(minutos, horas)
        if(minutos < 15 && horas == 0){
            minutos -= 15
            minutos += 60
            horas = 23
            print(horas, minutos, "sssssss")
        } else if (minutos < 15){
            minutos -= 15
            minutos += 60
            horas -= 1
            print(horas, minutos, "seg")
        }else if (horas == 0){
            minutos -= 15
            horas = 23
            print(horas, minutos, "terc")
        }else {
            minutos -= 15
            print(horas, minutos, "quar")
        }
        dateComponents.hour = horas
        dateComponents.minute = minutos

        let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
        // choose a random identifier
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)

        // add our notification request
        UNUserNotificationCenter.current().add(request)
}
}
