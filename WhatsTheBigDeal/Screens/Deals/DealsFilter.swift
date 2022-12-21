//
//  DealsFilter.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 18/12/22.
//

import SwiftUI

enum DealsFilter: String {
    
    static var allFilters: [DealsFilter] {
        return [.time, . cut]
    }
    
    case time = "Recentes"
    case cut = "Maior desconto"
}
