//
//  RecentsView.swift
//  WhatsTheBigDeal
//
//  Created by Matheus Accorsi on 19/06/22.
//

import SwiftUI

struct DealsListView: View {
    
    @StateObject private var dealsVM = DealsViewModel()
    
    var body: some View {
        
        List {
            // MARK: - DEALS LIST
            if let results = dealsVM.games {
                
                ForEach(results, id: \.plain) { deal in
                    DealsDetailView(games: deal)
                }
                .listRowSeparator(.hidden)
                .listRowInsets(EdgeInsets())
                .padding(.horizontal, 9)
                .padding(.top, 10)
                
                // Infinity Scroll setting a Geometry Reader
                if dealsVM.offset == dealsVM.games.count {
                    HStack {
                        Spacer()
                        DealsLoadingView(isShowing: dealsVM.isLoading)
                            .task { await dealsVM.fetchDeals()}
                        Spacer()
                    }
                    .listRowSeparator(.hidden)                    
                    
                } else {
                    GeometryReader { reader -> Color in
                        let minY = reader.frame(in: .global).minY
                        let height = UIScreen.main.bounds.height / 1.3
                        
                        // Setting offset to current fetched deals count, increasing the list
                        if !dealsVM.games.isEmpty && minY < height {
                            dealsVM.isLoading.toggle()
                            DispatchQueue.main.async {
                                dealsVM.offset = dealsVM.games.count
                            }
                        }
                        return Color.clear
                    }
                    .listRowSeparator(.hidden)
                }
                
            }
            else {
                HStack {
                    Spacer()
                    DealsLoadingView(isShowing: dealsVM.isLoading)
                    Spacer()
                }
                .listRowSeparator(.hidden)
            }
        }
        // MARK: - LIST ENDED
        .listStyle(PlainListStyle())
        .refreshable {
            dealsVM.isLoading.toggle()
            await dealsVM.refreshDeals()
        }.onAppear {
            UIRefreshControl.appearance().tintColor = UIColor.systemIndigo
        }
    }
}

struct DealsListView_Previews: PreviewProvider {
    static var previews: some View {
        DealsListView()
    }
}
