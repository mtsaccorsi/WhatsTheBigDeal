//
//  SearchView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 19/06/22.
//

import SwiftUI

struct SearchBarView: View {
    @StateObject private var searchVM = SearchViewModel()
    @State private var isLoading = true
    
    var body: some View {
//        NavigationView() {
            
                // MARK: - SEARCH BAR
                VStack(spacing: 15) {
                    HStack(spacing: 10) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.gray)
                        TextField("Procure um jogo", text: $searchVM.query)
                            .autocapitalization(.none)
                            .disableAutocorrection(true)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5, style: .continuous))
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: 5, y: 5)
                    .shadow(color: Color.black.opacity(0.06), radius: 5, x: -5, y: -5)
                }
        
                // MARK: - SEARCH LIST
//                List {
//                    if let results = searchVM.fetchedSearch {
//                        
//                        if results.isEmpty {
//                            Text("Nenhum resultado encontrado.")
//                        } else {
//                            ForEach(results) { result in
//                                Text(result.title)
//                            }
//                            .listRowSeparator(.hidden)
//                        }
//                        
//                    } else {
//                        if searchVM.query != "" {
//                            SearchLoadingView(isShowing: true)
//                                .listRowSeparator(.hidden)
//                        }
//                    }
//                }
//                .listStyle(.plain)
            
//        }
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView()
    }
}
