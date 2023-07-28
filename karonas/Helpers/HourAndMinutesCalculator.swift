//
//  HourAndMinutesCalculator.swift
//  karonas
//
//  Created by Henrique on 28/07/23.
//

import Foundation

func TimeCalculator(hour: Int, minutes: Int) -> (horas: Int, minutos: Int) {
    var horas = hour
    var minutos = minutes
    if(minutes < 15){
        horas-=1
        let sobra = minutes - 15
        minutos = sobra + 60
    } else {
        minutos -= 15
    }
    return (horas, minutos)
}
