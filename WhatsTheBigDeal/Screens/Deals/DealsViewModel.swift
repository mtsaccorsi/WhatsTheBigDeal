//
//  DealsViewModel.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 07/06/22.
//

import Foundation

class DealsViewModel: ObservableObject {
        
    @Published var games: [GameList] = []
    @Published var dealsOffset: Int = 0
    var isLoading = true
    
    func fetchDeals() async {
        if let urlAPI = URL(string: "https://api.isthereanydeal.com/v01/deals/list/?key=\(apiKey)&limit=10&offset=\(dealsOffset)&region=br2&country=BR") {
            
            var request = URLRequest(url: urlAPI)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if error != nil {
                    print("There was an error")
                } else if data != nil {
                    if let gamesAPI = try? JSONDecoder().decode(Deals.self, from: data!) {
                        DispatchQueue.main.async {
                            self.games.append(contentsOf: gamesAPI.data.list)
                        }
                    }
                }
            }.resume()
        }
    }
}
