//
//  DealsViewModel.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 07/06/22.
//

import Foundation

class DealsViewModel: ObservableObject {
    
    // MARK: - DEALS LIST
    
    @Published var games: [GameList] = []
    @Published var offset: Int = 0
    @Published var isLoading = true
    
    func fetchDeals() async {
        
        if let urlAPI = URL(string: "https://api.isthereanydeal.com/v01/deals/list/?key=\(apiKey)&limit=20&offset=\(offset)&region=br2&country=BR") {
            
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

    func refreshDeals() async {
        self.games = []
        self.offset = 0
        await fetchDeals()
        try? await Task.sleep(nanoseconds: 2_000_000_000)
    }
}
