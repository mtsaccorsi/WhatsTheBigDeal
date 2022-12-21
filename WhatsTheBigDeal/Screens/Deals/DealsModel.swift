//
//  DealsModel.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 07/06/22.
//

import Foundation

struct Deals: Codable {
    let data: Data
}

struct Data: Codable {
    let list: [GameList]
}

struct GameList: Codable, Identifiable {
    let id = UUID() // needed to be `let` for the api list to load
    let plain: String
    let title: String
    let price_new: Float
    let price_old: Float
    let price_cut: Int
    let shop: Shop
    let urls: GameUrl
}

struct Shop: Codable {
    let id: String
    let name: String
}

struct GameUrl: Codable {
    let buy: String
}
