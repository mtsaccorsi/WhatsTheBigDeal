//
//  SearchModel.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 11/06/22.
//

import Foundation

struct Search: Codable {
    let data: SearchData
}

struct SearchData: Codable {
    let results: [SearchResults]
}

struct SearchResults: Identifiable, Codable {
    let id: Int
    let plain: String
    let title: String
}
