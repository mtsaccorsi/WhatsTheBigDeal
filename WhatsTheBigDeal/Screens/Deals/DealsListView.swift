//
//  RecentsView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 19/06/22.
//

import SwiftUI

struct DealsListView: View {
    
    @StateObject private var dealsVM = DealsListViewModel()
    
    var body: some View {
        
        VStack {
            HStack {
                Text("ofertas")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Spacer()
                
                Picker("", selection: $dealsVM.selectedFilter) {
                    ForEach(DealsFilter.allFilters, id: \.self) { filter in
                        Text(filter.rawValue)
                    }
                }
                .accentColor(.white)
                .onChange(of: dealsVM.selectedFilter) { newValue in
                    refreshDeals()
                }
            }
            .padding(.horizontal, 15)
            .padding(.vertical, 5)
            .background(Color.indigo)
            
            // MARK: - DEALS LIST
            ScrollView {
                LazyVStack {
                    if let results = dealsVM.games {
                        
                        ForEach(results, id: \.id) { deal in
                            DealsDetailView(games: deal)
                        }
                        .padding(.horizontal, 10)
                        .padding(.top, 12)
                        .padding(.bottom, -8)
                        
                        // Infinity Scroll setting a Geometry Reader
                        if dealsVM.dealsOffset == dealsVM.games.count {
                            HStack {
                                Spacer()
                                ListLoadingView(isShowing: dealsVM.isLoading)
                                Spacer()
                            }
                            
                        } else {
                            GeometryReader { reader -> Color in
                                let minY = reader.frame(in: .global).minY
                                let height = UIScreen.main.bounds.height / 1.3
                                
                                // Setting offset to current fetched deals count, increasing the list
                                if !dealsVM.games.isEmpty && minY < height {
                                    dealsVM.isLoading.toggle()
                                    DispatchQueue.main.async {
                                        dealsVM.dealsOffset = dealsVM.games.count
                                        dealsVM.fetchDeals()
                                    }
                                }
                                return Color.clear
                            }
                        }
                    }
                    else {
                        HStack {
                            Spacer()
                            ListLoadingView(isShowing: dealsVM.isLoading)
                            Spacer()
                        }
                    }
                }
                .task {
                    dealsVM.fetchDeals()
                }
            }
            .padding(.top, -7)
            .refreshable {
                refreshDeals()
            }
            // MARK: - LIST ENDED
        }
    }
    
    func refreshDeals() {
        dealsVM.dealsOffset = 0
        dealsVM.games.removeAll()
        dealsVM.fetchDeals()
    }
}

struct DealsListView_Previews: PreviewProvider {
    static var previews: some View {
        DealsListView()
    }
}
