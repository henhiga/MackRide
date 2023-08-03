//
//  Alerta.swift
//  karonas
//
//  Created by Henrique on 03/08/23.
//

import Foundation
import SwiftUI

public struct Article: Identifiable{
    public var id: String { title }
    public let title: String
    public let description: String
}
