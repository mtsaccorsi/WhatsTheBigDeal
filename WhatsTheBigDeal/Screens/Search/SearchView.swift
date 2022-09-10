//
//  SearchView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 19/06/22.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject private var searchVM = SearchViewModel()

    var body: some View {
        NavigationView {
            
            VStack {
                SearchBarView()
                Spacer()
            }
            .background(Color.indigo)
        
                // MARK: - SEARCH LIST
                List {
                    if let results = searchVM.fetchedSearch {

                        if results.isEmpty {
                            Text("Nenhum resultado encontrado.")
                        } else {
                            ForEach(results) { result in
                                Text(result.title)
                            }
                            .listRowSeparator(.hidden)
                        }

                    } else {
                        if searchVM.query != "" {
                            SearchLoadingView(isShowing: true)
                                .listRowSeparator(.hidden)
                        }
                    }
                }
                .listStyle(.plain)
            
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
