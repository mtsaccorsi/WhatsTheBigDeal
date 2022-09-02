//
//  SearchViewModel.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 19/06/22.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    // TODO: - INSERT PLAIN FROM SEARCH INTO 'GET CURRENT PRICES' URL
    
    @Published var query = ""
    @Published var fetchedSearch: [SearchResults]? = nil
    @Published var isLoading = true
    
    // used to cancel the search publisher when needed
    var queryCancellable: AnyCancellable? = nil
    
    // Fetchs the string by each character typed between the interval
    init() {
        queryCancellable = $query
            .removeDuplicates()
//            .debounce(for: 0.6, scheduler: RunLoop.main) // deactivate if progressview bug remains
            .sink(receiveValue: { str in
                
                if str == "" {
                    // reset data
                    self.fetchedSearch = nil
                } else {
                    // search data
                    self.fetchSearch()
                }
            })
    }
    
    func fetchSearch() {
        
        let queryConcat = query.replacingOccurrences(of: " ", with: "%20")
        
        if let urlAPI = URL(string: "https://api.isthereanydeal.com/v02/search/search/?key=\(apiKey)&q=\(queryConcat)") {
            
            var request = URLRequest(url: urlAPI)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if error != nil {
                    print(error!.localizedDescription)
                } else if data != nil {
                    if let searchAPI = try? JSONDecoder().decode(Search.self, from: data!) {
                        DispatchQueue.main.async {
                            self.fetchedSearch = searchAPI.data.results
                        }
                    }
                }
            }.resume()
        }
    }
    
//    func fetchSearch() {
//
//        let queryConcat = query.replacingOccurrences(of: " ", with: "%20")
//
//        let url = "https://api.isthereanydeal.com/v02/search/search/?key=\(apiKey)&q=\(queryConcat)"
//
//        let session = URLSession(configuration: .default)
//
//        session.dataTask(with: URL(string: url)!) { (data, _, err) in
//
//            if let error = err {
//                print(error.localizedDescription)
//                return
//            }
//
//            guard let dataAPI = data else {
//                print("No data found")
//                return
//            }
//
//            do {
//                // decoding API data
//                let searchAPI = try JSONDecoder().decode(Search.self, from: dataAPI)
//
//                DispatchQueue.main.async {
////                    if self.fetchedSearch == nil {
//
//                        self.fetchedSearch = searchAPI.data.results
////                    }
//                }
//            } catch {
//                print(error.localizedDescription)
//            }
//        }.resume()
//
//    }
}
