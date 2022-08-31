//
//  GiftsViewModel.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 30/07/22.
//

import Foundation

class GiftsViewModel: ObservableObject {
    
    @Published var gifts: [GameList] = []
    @Published var giftsOffset: Int = 0
    
    func fetchGifts() async {
        if let urlAPI = URL(string: "https://api.isthereanydeal.com/v01/deals/list/?key=\(apiKey)&limit=10&offset=\(giftsOffset)&region=br2&country=BR&sort=price%3Aasc") {
            
            var request = URLRequest(url: urlAPI)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if error != nil {
                    print("There was an error")
                } else if data != nil {
                    if let gamesAPI = try? JSONDecoder().decode(Deals.self, from: data!) {
                        DispatchQueue.main.async {
                            self.gifts.append(contentsOf: gamesAPI.data.list)
                        }
                    }
                }
            }.resume()
        }
    }
    
    func refreshGifts() async {
        self.gifts = []
        self.giftsOffset = 0
        await fetchGifts()
        try? await Task.sleep(nanoseconds: 2_000_000_000)
    }
}
