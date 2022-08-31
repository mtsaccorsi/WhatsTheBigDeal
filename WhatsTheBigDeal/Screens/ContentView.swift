//
//  ContentView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 06/06/22.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var dealsVM = DealsViewModel()
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    if dealsVM.query == "" {
                        
                        // DEALS LIST
                        if let results = dealsVM.games {
                            ForEach(results, id: \.plain) { deal in
                                if isLoading {
                                    LoadingView(isShowing: true)
                                } else {
                                    NavigationLink(destination: GamesView(game: deal)) {
                                        DealsView(games: deal)
                                            .listRowSeparator(.hidden)
                                    }
                                }
                            }
                            .onAppear(perform: loadingCall)
                        } else {
                                LoadingView(isShowing: true)
                        }
                        
                    } else {
                        
                        // SEARCH LIST
                        if let results = dealsVM.search {
                            
                            if results.isEmpty {
                                Text("Nenhum resultado encontrado.")
                            } else {
                                ForEach(dealsVM.search!) { search in
                                    Text(search.title)
                                }
                            }
                        } else {
                            if dealsVM.query != "" {
                                LoadingView(isShowing: true)
                            }
                        }
                    }
                    
                }
                .listStyle(.plain)
                .navigationTitle("Deals")
                .searchable(text: $dealsVM.query, prompt: "Procure um jogo")
                .refreshable {
                    await dealsVM.fetchDeals()
                }
                .task {
                    await dealsVM.fetchDeals()
                }
            }
        }
    }
    
    func loadingCall() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isLoading = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
