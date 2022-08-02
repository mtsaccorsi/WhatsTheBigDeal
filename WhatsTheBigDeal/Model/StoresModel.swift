//
//  StoresModel.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 19/06/22.
//

import Foundation

struct Store: Codable {
    let data: [StoreData]
}

struct StoreData: Codable, Identifiable {
    let id: String
    let title: String
    let color: String
}
